import math


def calc_dla_area(num_bram, num_dsp):
    return ( num_bram*40 + num_dsp*30 )


def calc_dla_bramac_area(num_bram, num_dsp, variant='S'):
    if variant == 'S':
        return ( num_bram*40*1.17 + num_dsp*30 )
    elif variant == 'L':
        return ( num_bram*40*1.34 + num_dsp*30 )
    else:
        raise Exception('ERROR! BRAMAC variant is invalid. ' + 
                        'Please provide a valid BRAMAC variant \'L\' for 2SA or \'S\' for 1DA')


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


class DLA_BRAMAC(object):
    def __init__(self, network, mode='s', variant='S',
                 dsp_qvec=2, dsp_cvec=8, dsp_kvec=32, rvec=3, svec=1, 
                 num_bram_row=128, num_bram_col=128, bram_dwidth=32, bram_mux_factor=4, precision=8):
        super(DLA_BRAMAC, self).__init__()
        self.network         = network
        self.variant         = variant
        self.dsp_qvec        = dsp_qvec
        self.dsp_cvec        = dsp_cvec
        self.dsp_kvec        = dsp_kvec
        self.bramac_cvec_per_bram = 2
        self.rvec            = rvec
        self.svec            = svec
        self.num_bram_row    = num_bram_row
        self.num_bram_col    = num_bram_col
        self.bram_mux_factor = bram_mux_factor
        self.bram_dwidth     = bram_dwidth
        self.precision       = precision  
        self.fcache_bram     = 0

        self.num_multiplier_per_dsp = 2 * DSP_PACKING_FACTOR[(precision, precision)] # Apply DSP packing
        
        if mode == 's':
            self.bramac_num_cycle_per_iter   = {2: 4, 4: 6, 8: 10}
        elif mode == 'd':
            self.bramac_num_cycle_per_iter   = {2: 3, 4: 4, 8: 6}
        else:
            raise Exception('ERROR! Parameter "mode" is invalid. ' + 
                            'Please provide \'s\' for synchronous and \'d\' for double-pumped WDA.')
        
        if self.variant == 'L':
            self.bramac_num_mac_per_iter = {2: bram_dwidth//2*4, 4: bram_dwidth//4*4, 8: bram_dwidth//8*4}
            self.bramac_qvec = 2
        elif self.variant == 'S':
            self.bramac_num_mac_per_iter = {2: bram_dwidth//2*2, 4: bram_dwidth//4*2, 8: bram_dwidth//8*2}
            self.bramac_qvec = 1
        else:
            raise Exception('ERROR! BRAMAC variant is invalid. ' + 
                            'Please provide a valid BRAMAC variant \'L\' for 2SA or \'S\' for 1DA')
        
        self.bramac_cvec          = self.dsp_cvec * self.bramac_num_cycle_per_iter[self.precision]
        self.dsp_num_mac_per_iter = self.num_multiplier_per_dsp * self.bramac_num_cycle_per_iter[precision]

    def count_dsp(self):
        return math.ceil( (self.dsp_qvec * self.rvec * self.dsp_cvec * self.dsp_kvec) / self.num_multiplier_per_dsp )
    
    def count_streambuf_bram(self, cin, pin, qin, cout, pout, qout):   
        qvec = self.dsp_qvec + self.bramac_qvec
        ifmap_width = (qvec - 1) * math.ceil( qin/qout ) + self.rvec
        num_bank    = ifmap_width * self.dsp_cvec
        
        if self.network == 'alexnet':
            ifmap_depth = math.ceil( (cin*pin*qin + cout*pout*qout) / num_bank )
        elif self.network == 'resnet34' or self.network == 'resnet18':
            ifmap_depth = math.ceil( (cin*pin*qin + 2*cout*pout*qout) / num_bank )
        elif self.network == 'vgg16':
            ifmap_depth = math.ceil( (cin*pin*qin + cout*pout*qout) / 4 / num_bank ) # Cache 1/4 input tensor 
        elif self.network == 'vitbase':
            ifmap_depth = math.ceil( (cin*pin*qin + 2*cout*pout*qout) / num_bank )
        else:
            raise Exception('You have entered a network name that is not supported by default. ' +
                           'Please add the formula for calculating the stream buffer size for network ' + 
                            '\'' + self.network + '\'')

        bram_depth  = self.num_bram_row * self.bram_mux_factor * (self.bram_dwidth / self.precision)
        return math.ceil( ifmap_depth / bram_depth ) * num_bank
    
    def count_fcache_bram(self, r, s, c, k):
        # r, s are the largest layer's filter width and height, respectively
        # c, k are the largest layer's input dimension and output dimension, respectively
        num_bram_rvec      = self.rvec
        
        num_kvec_per_word  = self.bram_dwidth / self.precision
        
        num_bram_cvec_kvec = math.ceil(self.dsp_kvec / num_kvec_per_word) * self.bramac_cvec / self.bramac_cvec_per_bram
        num_bram_r         = math.ceil( r / self.rvec )
        num_bram_s         = s       
        num_bram_c         = math.ceil( c / self.bramac_cvec )
        num_bram_k         = math.ceil( k / self.dsp_kvec )
        num_word_bram      = self.bram_mux_factor * self.num_bram_row * self.bram_dwidth // self.precision
        if self.network == 'vitbase':
            num_bram_r_s_c_k   = math.ceil( (num_bram_r * num_bram_s * num_bram_c * num_bram_k * 3) / 
                                   (num_word_bram / num_kvec_per_word / self.bramac_cvec_per_bram) )
        elif self.network in ['alexnet', 'resnet18','resnet34', 'vgg16']:
            num_bram_r_s_c_k   = math.ceil( (num_bram_r * num_bram_s * num_bram_c * num_bram_k) / 
                                    (num_word_bram / num_kvec_per_word / self.bramac_cvec_per_bram) )
        else:
            raise Exception('You have entered a network name ' + '\'' + self.network + '\'' + 
                            'that is not supported by default. ' +
                           'Please add the formula for calculating the filter cache size for network ' + 
                            '\'' + self.network + '\'')

        #return ( num_bram_rvec * num_bram_cvec_kvec * num_bram_r_s_c_k )
        num_bram_bandwidth = num_bram_rvec * num_bram_cvec_kvec 
        num_bram_total     = num_bram_bandwidth * num_bram_r_s_c_k

        if num_bram_total > self.fcache_bram:
            self.fcache_bram   = num_bram_total
        
        return num_bram_total
    
    def count_convlayer_cycle(self, r, s, c, p, q, k):
        n = self.precision
        qvec = self.dsp_qvec + self.bramac_qvec
        
        if self.variant == 'L':
            bramac_num_cycle_read_acc = 8
        elif self.variant == 'S':
            bramac_num_cycle_read_acc = 4
            
        num_cycle_cvec = math.ceil(c / self.bramac_cvec) * self.bramac_num_cycle_per_iter[n]
        num_iter_kvec  = math.ceil(k / self.dsp_kvec)
        dsp_num_cycle  = ( num_cycle_cvec * s * math.ceil(r / self.rvec) + bramac_num_cycle_read_acc ) * \
                            num_iter_kvec * math.ceil(q / qvec) * p
                        
        return dsp_num_cycle
    
    def count_fclayer_cycle(self, c, k):
        n = self.precision
        batch_size = self.dsp_kvec * 2
        num_flop  = 2 * c * k * batch_size
        num_mac_per_iter = self.dsp_num_mac_per_iter*self.count_dsp() + self.bramac_num_mac_per_iter[n]*self.fcache_bram
        num_cycle = num_flop / (2*num_mac_per_iter) * self.bramac_num_cycle_per_iter[n]
        return math.ceil(num_cycle / batch_size) 


