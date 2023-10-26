import math


def calc_dla_area(num_bram, num_dsp):
    return ( num_bram*40 + num_dsp*30 )


def calc_dla_m4bram_area(num_bram, num_dsp, variant='S'):
    if variant == 'S':
        return ( num_bram*40*1.196 + num_dsp*30 )
    elif variant == 'L':
        return ( num_bram*40*1.334 + num_dsp*30 )
    else:
        raise Exception('ERROR! M4BRAM variant is invalid. ' + 
                        'Please provide a valid M4BRAM variant \'s\' for small dummy array or \'l\' for large dummy array')


############### DSP Packing ###############
DSP_PACKING_FACTOR = {}

for pw_temp in [2, 4, 8]: # weight precision
    for pi_temp in range(2, 9): # activation precision
        if pw_temp == 2:
            if pi_temp < 6:
                factor = 4
            else:
                factor = 2
            DSP_PACKING_FACTOR[(pw_temp, pi_temp)] = factor
        elif pw_temp == 4:
            if pi_temp < 3:
                factor = 4
            else:
                factor = 2
            DSP_PACKING_FACTOR[(pw_temp, pi_temp)] = factor
        elif pw_temp == 8:
            if pi_temp < 6:
                factor = 2
            else:
                factor = 1
            DSP_PACKING_FACTOR[(pw_temp, pi_temp)] = factor


class DLA_mixed_act(object):
    def __init__(self, network, pw=8, pi=8, 
                 pvec=1, qvec=2, cvec=8, kvec=48, rvec=3,
                 num_bram_row=128, num_bram_col=128, bram_mux_factor=4, bram_dwidth=32):
        super(DLA_mixed_act, self).__init__()
        self.network         = network
        self.pw              = pw        # weight precision
        self.pi              = pi        # activation precision
        self.pvec            = pvec
        self.qvec            = qvec
        self.cvec            = cvec
        self.kvec            = kvec
        self.rvec            = rvec
        self.num_bram_row    = num_bram_row
        self.num_bram_col    = num_bram_col
        self.bram_mux_factor = bram_mux_factor
        self.bram_dwidth     = bram_dwidth
        
        self.num_multiplier_per_dsp = 2 * DSP_PACKING_FACTOR[(pw, pi)] # Apply DSP packing
    
    def count_dsp(self):
        return math.ceil( ( self.qvec * self.pvec * self.rvec * self.cvec * self.kvec ) 
                         / self.num_multiplier_per_dsp )
 
    def count_streambuf_bram(self, cin, pin, qin, cout, pout, qout):
        ifmap_width = (self.qvec - 1) * math.ceil( qout/qin ) + self.rvec
        num_bank    = ifmap_width * self.cvec * self.pvec
        
        if self.network == 'alexnet':
            ifmap_depth = math.ceil( (cin*pin*qin + cout*pout*qout) / num_bank )
        elif self.network == 'resnet34' or self.network == 'resnet18':
            ifmap_depth = math.ceil( (cin*pin*qin + 2*cout*pout*qout) / num_bank )
        elif self.network == 'vgg16':
            ifmap_depth = math.ceil( (cin*pin*qin + cout*pout*qout) / 4 / num_bank ) # Cache 1/4 input tensor 
        elif self.network == 'vitbase':
            ifmap_depth = math.ceil( (cin*pin*qin + 2*cout*pout*qout) / num_bank )
        else:
            raise Exception('You have entered a network name ' + '\'' + self.network + '\'' + 
                            'that is not supported by default. ' +
                           'Please add the formula for calculating the stream buffer size for network ' + 
                            '\'' + self.network + '\'')
        if self.pi > 4:
            bram_depth  = self.num_bram_row * self.bram_mux_factor * (self.bram_dwidth / 8)
        else:
            bram_depth  = self.num_bram_row * self.bram_mux_factor * (self.bram_dwidth / 4)
        return math.ceil( ifmap_depth / bram_depth ) * num_bank
    
    def count_fcache_bram(self, r, s, c, k):
        # r, s are the largest layer's filter width and height, respectively
        # c, k are the largest layer's input dimension and output dimension, respectively
        num_row_bram       = self.num_bram_row
        num_bram_rvec      = self.rvec
        num_cvec_per_data  = self.bram_dwidth / self.pw
        num_bram_cvec_kvec = math.ceil(self.cvec * self.kvec / num_cvec_per_data)
        num_bram_r         = math.ceil( r / self.rvec )
        num_bram_s         = s       
        num_bram_c         = math.ceil( c / self.cvec )
        num_bram_k         = math.ceil( k / self.kvec )
        
        if self.network == 'vitbase':
            num_bram_r_s_c_k   = math.ceil( (num_bram_r * num_bram_s * num_bram_c * num_bram_k * 3) / # Uq, Uk, Uv stored on-chip
                                           (self.bram_mux_factor * self.num_bram_row) )
        elif self.network in ['alexnet', 'resnet18', 'resnet34', 'vgg16']:
            num_bram_r_s_c_k   = math.ceil( (num_bram_r * num_bram_s * num_bram_c * num_bram_k) / 
                                           (self.bram_mux_factor * self.num_bram_row) )
        else:
            raise Exception('You have entered a network name ' + '\'' + self.network + '\'' + 
                            'that is not supported by default. ' +
                           'Please add the formula for calculating the filter cache size for network ' + 
                            '\'' + self.network + '\'')
            
        num_bram_bandwidth = num_bram_rvec * num_bram_cvec_kvec 
        num_bram_total     = num_bram_bandwidth * num_bram_r_s_c_k
        
        return num_bram_total

    def dsp_eff(self, r, s, c, p, q, k):
        eff = q / ( math.ceil(q / self.qvec) * self.qvec ) * \
                p / ( math.ceil(p / self.pvec) * self.pvec ) * \
                k / ( math.ceil(k / self.kvec) * self.kvec ) * \
                c / ( math.ceil(c / self.cvec) * self.cvec ) * \
                r / ( math.ceil(r / self.rvec) * self.rvec )
        return eff
    
    def count_convlayer_cycle(self, r, s, c, p, q, k):
        num_flop  = 2 * r * s * c * p * q * k / self.dsp_eff(r, s, c, p, q, k)
        num_cycle = num_flop / ( 2*self.count_dsp()*self.num_multiplier_per_dsp )
        return math.ceil(num_cycle)
    
    def count_fclayer_cycle(self, c, k):
        batch_size = self.kvec * 2
        num_flop  = 2 * c * k * batch_size
        num_cycle = num_flop / ( 2*self.count_dsp()*self.num_multiplier_per_dsp )
        return math.ceil(num_cycle / batch_size) 








class DLA_mixed_weight(object):
    def __init__(self, network, pw_h=8, pw_l=4, pi=8, 
                 pvec=1, qvec=2, cvec=8, kvec=48, kvec_splitratio=0.9, rvec=3,
                 num_dsp=1518, num_bram_row=128, num_bram_col=128, bram_mux_factor=4, bram_dwidth=32):
        super(DLA_mixed_weight, self).__init__()
        self.network         = network
        self.kvec_splitratio = kvec_splitratio
        self.pw_h            = pw_h       # weight high-precision  (e.g. 8-bit)
        self.pw_l            = pw_l       # weight low-precision   (e.g. 4-bit)
        self.pi              = pi        # activation precision
        self.pvec            = pvec
        self.qvec            = qvec
        self.cvec            = cvec
        self.kvec            = kvec 
        self.kvec1           = math.ceil(kvec*kvec_splitratio)      # kvec for high precision (e.g. 8-bit)
        self.kvec2           = self.kvec - self.kvec1               # kvec for low precision  (e.g. 4-bit)
        self.rvec            = rvec
        self.num_bram_row    = num_bram_row
        self.num_bram_col    = num_bram_col
        self.bram_mux_factor = bram_mux_factor
        self.bram_dwidth     = bram_dwidth
            
        self.num_multiplier_per_dsp1 = 2 * DSP_PACKING_FACTOR[(pw_h, pi)] # Apply DSP packing
        self.num_multiplier_per_dsp2 = 2 * DSP_PACKING_FACTOR[(pw_l, pi)] # Apply DSP packing
        
        self.dsp1            = math.ceil( ( self.qvec * self.pvec * self.rvec * self.cvec * self.kvec1 ) 
                                             / self.num_multiplier_per_dsp1 )
        self.dsp2            = math.ceil( ( self.qvec * self.pvec * self.rvec * self.cvec * self.kvec2 ) 
                                             / self.num_multiplier_per_dsp2 )
    
    def count_dsp(self):
        return (self.dsp1+self.dsp2)
    
    def count_streambuf_bram(self, cin, pin, qin, cout, pout, qout):
        ifmap_width = (self.qvec - 1) * math.ceil( qout/qin ) + self.rvec
        num_bank    = ifmap_width * self.cvec * self.pvec
        
        if self.network == 'alexnet':
            ifmap_depth = math.ceil( (cin*pin*qin + cout*pout*qout) / num_bank )
        elif self.network == 'resnet34':
            ifmap_depth = math.ceil( (cin*pin*qin + 2*cout*pout*qout) / num_bank )
        elif self.network == 'vgg16':
            ifmap_depth = math.ceil( (cin*pin*qin + cout*pout*qout) / 4 / num_bank ) # Cache 1/4 input tensor 
        elif self.network == 'vitbase':
            ifmap_depth = math.ceil( (cin*pin*qin + 2*cout*pout*qout) / num_bank )
        else:
            raise Exception('You have entered a network name ' + '\'' + self.network + '\'' + 
                            'that is not supported by default. ' +
                           'Please add the formula for calculating the stream buffer size for network ' + 
                            '\'' + self.network + '\'')
            
        if self.pi > 4:
            bram_depth  = self.num_bram_row * self.bram_mux_factor * (self.bram_dwidth / 8)
        else:
            bram_depth  = self.num_bram_row * self.bram_mux_factor * (self.bram_dwidth / 4)
        return math.ceil( ifmap_depth / bram_depth ) * num_bank
    
    def count_fcache_bram(self, r, s, c, k):
        # r, s are the largest layer's filter width and height, respectively
        # c, k are the largest layer's input dimension and output dimension, respectively
        num_row_bram        = self.num_bram_row
        num_bram_rvec       = self.rvec
        num_kvec1_per_data  = self.bram_dwidth / self.pw_h
        num_kvec2_per_data  = self.bram_dwidth / self.pw_l
        num_bram_cvec_kvec1 = math.ceil(self.cvec * self.kvec1 / num_kvec1_per_data)
        num_bram_cvec_kvec2 = math.ceil(self.cvec * self.kvec2 / num_kvec2_per_data)
        num_bram_r          = math.ceil( r / self.rvec )
        num_bram_s          = s       
        num_bram_c          = math.ceil( c / self.cvec )
        num_bram_k          = math.ceil( k / self.kvec )
        
        if self.network == 'vitbase':
            # Uq, Uk, Uv stored on-chip
            num_bram_r_s_c_k   = math.ceil( (num_bram_r * num_bram_s * num_bram_c * num_bram_k * 3) / 
                                           (self.bram_mux_factor * self.num_bram_row) )
        elif self.network in ['alexnet', 'resnet34', 'vgg16']:
            num_bram_r_s_c_k   = math.ceil( (num_bram_r * num_bram_s * num_bram_c * num_bram_k) / 
                                           (self.bram_mux_factor * self.num_bram_row) )
        else:
            raise Exception('You have entered a network name ' + '\'' + self.network + '\'' + 
                            'that is not supported by default. ' +
                           'Please add the formula for calculating the filter cache size for network ' + 
                            '\'' + self.network + '\'')
            
        num_bram_bandwidth = num_bram_rvec * (num_bram_cvec_kvec1 + num_bram_cvec_kvec2)
        num_bram_total     = num_bram_bandwidth * num_bram_r_s_c_k
        
        return num_bram_total

    def dsp_eff(self, r, s, c, p, q, k):
        eff = q / ( math.ceil(q / self.qvec) * self.qvec ) * \
                p / ( math.ceil(p / self.pvec) * self.pvec ) * \
                k / ( math.ceil(k / self.kvec) * self.kvec ) * \
                c / ( math.ceil(c / self.cvec) * self.cvec ) * \
                r / ( math.ceil(r / self.rvec) * self.rvec )
        return eff
    
    def count_convlayer_cycle(self, r, s, c, p, q, k):
        num_flop  = 2 * r * s * c * p * q * math.ceil(k / self.kvec) * self.kvec1 / self.dsp_eff(r, s, c, p, q, k)
        num_cycle = num_flop / ( 2*self.dsp1*self.num_multiplier_per_dsp1 )
        return math.ceil(num_cycle)
    
    def count_fclayer_cycle(self, c, k):
        batch_size = self.kvec * 2
        num_flop  = 2 * c * k * batch_size
        num_cycle = num_flop / ( 2*self.dsp1*self.num_multiplier_per_dsp1 + 
                                2*self.dsp2*self.num_multiplier_per_dsp2 )
        return math.ceil(num_cycle / batch_size)     




