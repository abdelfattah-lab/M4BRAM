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


class DLA_M4BRAM_mixed_act(object):
    def __init__(self, network, mode='s', variant='S', pw=8, pi=8,
                 pvec=1, dsp_qvec=2, dsp_cvec=8, dsp_kvec=32, 
                 m4bram_qvec=2, m4bram_cvec=16, m4bram_kvec=32, 
                 rvec=3, svec=1, 
                 num_bram_row=128, num_bram_col=128, bram_mux_factor=4, bram_dwidth=32):
        super(DLA_M4BRAM_mixed_act, self).__init__()
        self.network         = network
        self.variant         = variant
        self.pw              = pw
        self.pi              = pi
        self.pvec            = pvec
        self.dsp_qvec        = dsp_qvec
        self.dsp_cvec        = dsp_cvec
        self.dsp_kvec        = dsp_kvec
        self.m4bram_qvec     = m4bram_qvec
        self.m4bram_cvec     = m4bram_cvec
        self.m4bram_cvec_per_bram = 2
        self.m4bram_kvec     = m4bram_kvec
        self.rvec            = rvec
        self.svec            = svec
        self.num_bram_row    = num_bram_row
        self.num_bram_col    = num_bram_col
        self.bram_mux_factor = bram_mux_factor
        self.bram_dwidth     = bram_dwidth
        self.fcache_bram     = 0
        self.read_m4bram_acc_total  = 0
        
        self.num_multiplier_per_dsp = 2 * DSP_PACKING_FACTOR[(pw, pi)] # Apply DSP packing  
        
        if mode == 's':
            self.m4bram_num_cycle_per_iter   = 2 + self.pi
        elif mode == 'd':
            self.m4bram_num_cycle_per_iter   = 2 + math.ceil(self.pi/2)
        else:
            raise Exception('ERROR! Parameter "mode" is invalid. ' + 
                            'Please provide \'s\' for synchronous and \'d\' for double-pumped M4BRAM.')
        
        if self.variant == 'L':
            self.m4bram_num_mac_per_iter     = {2: bram_dwidth//2*4, 4: bram_dwidth//4*4, 8: bram_dwidth//8*4}
        elif self.variant == 'S':
            self.m4bram_num_mac_per_iter     = {2: bram_dwidth//2*2, 4: bram_dwidth//4*2, 8: bram_dwidth//8*2}
        else:
            raise Exception('ERROR! M4BRAM variant is invalid. ' + 
                            'Please provide a valid M4BRAM variant \'w\' for WDA or \'n\' for NDA')
        
        self.dsp_num_mac_per_iter        = {}  
        for n in [2, 4, 8]:
            self.dsp_num_mac_per_iter[n] = self.num_multiplier_per_dsp * self.m4bram_num_cycle_per_iter

    def count_dsp(self):
        return math.ceil( ( self.dsp_qvec * self.pvec * self.rvec * self.dsp_cvec * self.dsp_kvec ) 
                         / self.num_multiplier_per_dsp )
    
    def count_streambuf_bram(self, cin, pin, qin, cout, pout, qout):   
        dsp_ifmap_width = (self.dsp_qvec - 1) * math.ceil( qin/qout ) + self.rvec
        dsp_num_bank    = dsp_ifmap_width * self.dsp_cvec
        m4bram_ifmap_width = (self.m4bram_qvec - 1) * math.ceil( qin/qout ) + self.rvec
        m4bram_num_bank    = m4bram_ifmap_width * math.ceil(self.m4bram_cvec / self.m4bram_num_cycle_per_iter)
        num_bank = (m4bram_num_bank + dsp_num_bank) * self.pvec
        
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
        if self.pi > 4:
            bram_depth  = self.num_bram_row * self.bram_mux_factor * (self.bram_dwidth / 8)
        else:
            bram_depth  = self.num_bram_row * self.bram_mux_factor * (self.bram_dwidth / 4)
        return math.ceil( ifmap_depth / bram_depth ) * num_bank
    
    def count_fcache_bram(self, r, s, c, k):
        # r, s are the largest layer's filter width and height, respectively
        # c, k are the largest layer's input dimension and output dimension, respectively
        num_bram_rvec      = self.rvec
        if (self.m4bram_qvec*self.pvec) < 8:
            bram_dwidth_new = self.bram_dwidth / (self.m4bram_qvec*self.pvec)
        else:
            bram_dwidth_new = 8
        
        if self.variant == 'L':
            num_kvec_per_word  = bram_dwidth_new * 2 / self.pw
        elif self.variant == 'S':
            num_kvec_per_word  = bram_dwidth_new / self.pw
        
        num_bram_cvec_kvec = math.ceil(self.m4bram_kvec / num_kvec_per_word) * self.m4bram_cvec / self.m4bram_cvec_per_bram
        num_bram_r         = math.ceil( r / self.rvec )
        num_bram_s         = s       
        num_bram_c         = math.ceil( c / self.m4bram_cvec )
        num_bram_k         = math.ceil( k / self.m4bram_kvec )
        num_word_bram      = self.bram_mux_factor * self.num_bram_row * self.bram_dwidth // self.pw
        
        if self.network == 'vitbase':
            num_bram_r_s_c_k   = math.ceil( (num_bram_r * num_bram_s * num_bram_c * num_bram_k * 3) / # Uq, Uk, Uv stored on-chip
                                       (num_word_bram / num_kvec_per_word / self.m4bram_cvec_per_bram) )
        elif self.network in ['alexnet', 'resnet18','resnet34', 'vgg16']:
            num_bram_r_s_c_k   = math.ceil( (num_bram_r * num_bram_s * num_bram_c * num_bram_k) / 
                                       (num_word_bram / num_kvec_per_word / self.m4bram_cvec_per_bram) )
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
        if self.variant == 'L':
            m4bram_num_cycle_read_acc = 8
        elif self.variant == 'S':
            m4bram_num_cycle_read_acc = 4
            
        dsp_num_cycle_cvec = math.ceil(c / self.dsp_cvec)
        dsp_num_iter_kvec  = math.ceil(k / self.dsp_kvec)
        dsp_num_cycle      = dsp_num_cycle_cvec * s * math.ceil(r / self.rvec) * dsp_num_iter_kvec * \
                            ( math.ceil(q / (self.dsp_qvec+self.m4bram_qvec)) ) * math.ceil(p / self.pvec)
        
        m4bram_num_cycle_cvec = math.ceil(c / self.m4bram_cvec) * self.m4bram_num_cycle_per_iter
        m4bram_num_iter_kvec  = math.ceil(k / self.m4bram_kvec)
        m4bram_num_cycle      = m4bram_num_cycle_cvec * s * math.ceil(r / self.rvec) * \
                                m4bram_num_iter_kvec * \
                                math.ceil(q / (self.dsp_qvec+self.m4bram_qvec)) * math.ceil(p / self.pvec)
        m4bram_num_cycle_readout = m4bram_num_cycle_read_acc * m4bram_num_iter_kvec * \
                                    math.ceil(q / (self.dsp_qvec+self.m4bram_qvec)) * math.ceil(p / self.pvec)
        
        self.read_m4bram_acc_total += m4bram_num_cycle_readout
        
        if dsp_num_cycle > m4bram_num_cycle:
            return m4bram_num_cycle_readout + dsp_num_cycle
        else:
            return m4bram_num_cycle_readout + m4bram_num_cycle
    
    def count_fclayer_cycle(self, c, k):
        n = self.pw
        batch_size = self.dsp_kvec * 2
        num_flop  = 2 * c * k * batch_size
        num_mac_per_iter = self.dsp_num_mac_per_iter[n]*self.count_dsp() + self.m4bram_num_mac_per_iter[n]*self.fcache_bram
        num_cycle = num_flop / (2*num_mac_per_iter) * self.m4bram_num_cycle_per_iter
        return math.ceil(num_cycle / batch_size) 






class DLA_M4BRAM_mixed_weight(object):
    def __init__(self, network, mode='s', variant='S', pw_h=8, pw_l=4, pi=8, kvec_splitratio=0.9,
                 pvec=1, dsp_qvec=2, dsp_cvec=8, dsp_kvec=32, 
                 m4bram_qvec=2, m4bram_cvec=16, m4bram_kvec=32, 
                 rvec=3, svec=1,
                 num_bram_row=128, num_bram_col=128, bram_mux_factor=4, bram_dwidth=32):
        super(DLA_M4BRAM_mixed_weight, self).__init__()
        self.network         = network
        self.variant         = variant
        self.pw_h            = pw_h
        self.pw_l            = pw_l
        self.pi              = pi
        self.pvec            = pvec
        self.dsp_qvec        = dsp_qvec
        self.dsp_cvec        = dsp_cvec
        self.dsp_kvec        = dsp_kvec
        self.dsp_kvec1       = math.ceil(dsp_kvec*kvec_splitratio)
        self.dsp_kvec2       = dsp_kvec - self.dsp_kvec1
        self.m4bram_qvec     = m4bram_qvec
        self.m4bram_cvec     = m4bram_cvec
        self.m4bram_cvec_per_bram = 2
        self.m4bram_kvec     = m4bram_kvec
        self.m4bram_kvec1    = math.ceil(m4bram_kvec*kvec_splitratio)
        self.m4bram_kvec2    = m4bram_kvec - self.m4bram_kvec1
        self.rvec            = rvec
        self.svec            = svec
        self.num_bram_row    = num_bram_row
        self.num_bram_col    = num_bram_col
        self.bram_mux_factor = bram_mux_factor
        self.bram_dwidth     = bram_dwidth
        self.fcache_bram1    = 0
        self.fcache_bram2    = 0

        self.num_multiplier_per_dsp1 = 2 * DSP_PACKING_FACTOR[(pw_h, pi)] # Apply DSP packing  
        self.num_multiplier_per_dsp2 = 2 * DSP_PACKING_FACTOR[(pw_l, pi)] # Apply DSP packing  
        
        self.dsp1            = math.ceil( ( self.dsp_qvec * self.pvec * self.rvec * self.dsp_cvec * self.dsp_kvec1 ) 
                                         / self.num_multiplier_per_dsp1 )
        self.dsp2            = math.ceil( ( self.dsp_qvec * self.pvec * self.rvec * self.dsp_cvec * self.dsp_kvec2 ) 
                                         / self.num_multiplier_per_dsp2 )
        
        if mode == 's':
            self.m4bram_num_cycle_per_iter   = 2 + self.pi
        elif mode == 'd':
            self.m4bram_num_cycle_per_iter   = 2 + math.ceil(self.pi/2)
        else:
            raise Exception('ERROR! Parameter "mode" is invalid. ' + 
                            'Please provide \'s\' for synchronous and \'d\' for double-pumped WDA.')
        
        if self.variant == 'L':
            self.m4bram_num_mac_per_iter     = {2: bram_dwidth//2*4, 4: bram_dwidth//4*4, 8: bram_dwidth//8*4}
        elif self.variant == 'S':
            self.m4bram_num_mac_per_iter     = {2: bram_dwidth//2*2, 4: bram_dwidth//4*2, 8: bram_dwidth//8*2}
        else:
            raise Exception('ERROR! M4BRAM variant is invalid. ' + 
                            'Please provide a valid M4BRAM variant \'w\' for WDA or \'n\' for NDA')
        
        self.dsp_num_mac_per_iter        = {}  
        for n in [2, 4, 8]:
            self.dsp_num_mac_per_iter[n] = self.num_multiplier_per_dsp1 * self.m4bram_num_cycle_per_iter

    def count_dsp(self):
        return (self.dsp1+self.dsp2)
    
    def count_streambuf_bram(self, cin, pin, qin, cout, pout, qout):   
        dsp_ifmap_width = (self.dsp_qvec - 1) * math.ceil( qin/qout ) + self.rvec
        dsp_num_bank    = dsp_ifmap_width * self.dsp_cvec
        m4bram_ifmap_width = (self.m4bram_qvec - 1) * math.ceil( qin/qout ) + self.rvec
        m4bram_num_bank    = m4bram_ifmap_width * math.ceil(self.m4bram_cvec / self.m4bram_num_cycle_per_iter)
        num_bank = (m4bram_num_bank + dsp_num_bank) * self.pvec
        
        if self.network == 'alexnet':
            ifmap_depth = math.ceil( (cin*pin*qin + cout*pout*qout) / num_bank )
        elif self.network == 'resnet34':
            ifmap_depth = math.ceil( (cin*pin*qin + 2*cout*pout*qout) / num_bank )
        elif self.network == 'vgg16':
            ifmap_depth = math.ceil( (cin*pin*qin + cout*pout*qout) / 4 / num_bank ) # Cache 1/4 input tensor 
        elif self.network == 'vitbase':
            ifmap_depth = math.ceil( (cin*pin*qin + 2*cout*pout*qout) / num_bank )
        else:
            raise Exception('You have entered a network name that is not supported by default. ' +
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
        num_bram_rvec      = self.rvec
        if (self.m4bram_qvec*self.pvec) < 8:
            bram_dwidth_new = self.bram_dwidth / (self.m4bram_qvec*self.pvec)
        else:
            bram_dwidth_new = 8
        
        if self.variant == 'L':
            num_kvec1_per_word  = bram_dwidth_new * 2 / self.pw_h
            num_kvec2_per_word  = bram_dwidth_new * 2 / self.pw_l
        elif self.variant == 'S':
            num_kvec1_per_word  = bram_dwidth_new / self.pw_h
            num_kvec2_per_word  = bram_dwidth_new / self.pw_l
        
        num_bram_cvec_kvec1 = math.ceil(self.m4bram_kvec1 / num_kvec1_per_word) * self.m4bram_cvec / self.m4bram_cvec_per_bram
        num_bram_cvec_kvec2 = math.ceil(self.m4bram_kvec2 / num_kvec2_per_word) * self.m4bram_cvec / self.m4bram_cvec_per_bram
        num_bram_r          = math.ceil( r / self.rvec )
        num_bram_s          = s       
        num_bram_c          = math.ceil( c / self.m4bram_cvec )
        num_bram_k          = math.ceil( k / self.m4bram_kvec )
        num_word_bram1      = self.bram_mux_factor * self.num_bram_row * self.bram_dwidth / self.pw_h
        
        if self.network == 'vitbase':
            # Uq, Uk, Uv stored on-chip
            num_bram_r_s_c_k   = math.ceil( (num_bram_r * num_bram_s * num_bram_c * num_bram_k * 3) / 
                                       (num_word_bram1 / num_kvec1_per_word / self.m4bram_cvec_per_bram) )
        elif self.network in ['alexnet', 'resnet34', 'vgg16']:
            num_bram_r_s_c_k   = math.ceil( (num_bram_r * num_bram_s * num_bram_c * num_bram_k) / 
                                       (num_word_bram1 / num_kvec1_per_word / self.m4bram_cvec_per_bram) )
        else:
            raise Exception('You have entered a network name ' + '\'' + self.network + '\'' + 
                            'that is not supported by default. ' +
                           'Please add the formula for calculating the filter cache size for network ' + 
                            '\'' + self.network + '\'')
            
        #return ( num_bram_rvec * num_bram_cvec_kvec * num_bram_r_s_c_k )
        num_bram1_total     = num_bram_rvec * num_bram_cvec_kvec1 * num_bram_r_s_c_k
        num_bram2_total     = num_bram_rvec * num_bram_cvec_kvec2 * num_bram_r_s_c_k
        if (num_bram1_total+num_bram2_total) > (self.fcache_bram1+self.fcache_bram2):
            self.fcache_bram1 = num_bram1_total
            self.fcache_bram2 = num_bram2_total
        
        return (num_bram1_total+num_bram2_total)
    
    def count_convlayer_cycle(self, r, s, c, p, q, k):
        if self.variant == 'L':
            m4bram_num_cycle_read_acc = 8
        elif self.variant == 'S':
            m4bram_num_cycle_read_acc = 4
            
        dsp_num_cycle_cvec = math.ceil(c / self.dsp_cvec)
        dsp_num_iter_kvec  = math.ceil(k / self.dsp_kvec)
        dsp_num_cycle      = dsp_num_cycle_cvec * s * math.ceil(r / self.rvec) * dsp_num_iter_kvec * \
                                math.ceil(q / (self.dsp_qvec+self.m4bram_qvec)) * math.ceil(p / self.pvec)
        
        m4bram_num_cycle_cvec = math.ceil(c / self.m4bram_cvec) * self.m4bram_num_cycle_per_iter
        m4bram_num_iter_kvec  = math.ceil(k / self.m4bram_kvec)
        m4bram_num_cycle      = m4bram_num_cycle_cvec * s * math.ceil(r / self.rvec) * \
                                m4bram_num_iter_kvec * \
                                math.ceil(q / (self.dsp_qvec+self.m4bram_qvec)) * math.ceil(p / self.pvec)
        m4bram_num_cycle_readout = m4bram_num_cycle_read_acc * m4bram_num_iter_kvec * \
                                    math.ceil(q / (self.dsp_qvec+self.m4bram_qvec)) * math.ceil(p / self.pvec)
                
        if dsp_num_cycle > m4bram_num_cycle:
            return m4bram_num_cycle_readout + dsp_num_cycle
        else:
            return m4bram_num_cycle_readout + m4bram_num_cycle
    
    def count_fclayer_cycle(self, c, k):
        n1 = self.pw_h
        n2 = self.pw_l
        batch_size = self.dsp_kvec * 2
        num_flop  = 2 * c * k * batch_size
        num_mac_per_iter = self.dsp_num_mac_per_iter[n1]*self.dsp1 + \
                            self.dsp_num_mac_per_iter[n2]*self.dsp2 + \
                            self.m4bram_num_mac_per_iter[n1]*self.fcache_bram1 + \
                            self.m4bram_num_mac_per_iter[n2]*self.fcache_bram2
        num_cycle = num_flop / (2*num_mac_per_iter) * self.m4bram_num_cycle_per_iter
        return math.ceil(num_cycle / batch_size) 




class DLA_M4BRAM_no_DSP(object):
    def __init__(self, network='alexnet', mode='s', variant='S', pw=8, pi=8,
                 pvec=1, m4bram_qvec=2, m4bram_cvec=16, m4bram_kvec=32, 
                 rvec=3, svec=1, 
                 num_bram_row=128, num_bram_col=128, bram_mux_factor=4, bram_dwidth=32):
        super(DLA_M4BRAM_no_DSP, self).__init__()
        self.network         = network
        self.variant         = variant
        self.pw              = pw
        self.pi              = pi
        self.pvec            = pvec
        self.m4bram_qvec     = m4bram_qvec
        self.m4bram_cvec     = m4bram_cvec
        self.m4bram_cvec_per_bram = 2
        self.m4bram_kvec     = m4bram_kvec
        self.rvec            = rvec
        self.svec            = svec
        self.num_bram_row    = num_bram_row
        self.num_bram_col    = num_bram_col
        self.bram_mux_factor = bram_mux_factor
        self.bram_dwidth     = bram_dwidth
        self.fcache_bram     = 0
        
        if mode == 's':
            self.m4bram_num_cycle_per_iter   = 2 + self.pi
        elif mode == 'd':
            self.m4bram_num_cycle_per_iter   = 2 + math.ceil(self.pi/2)
        else:
            raise Exception('ERROR! Parameter "mode" is invalid. ' + 
                            'Please provide \'s\' for synchronous and \'d\' for double-pumped WDA.')
        
        if self.variant == 'L':
            self.m4bram_num_mac_per_iter     = {2: bram_dwidth//2*4, 4: bram_dwidth//4*4, 8: bram_dwidth//8*4}
        elif self.variant == 'S':
            self.m4bram_num_mac_per_iter     = {2: bram_dwidth//2*2, 4: bram_dwidth//4*2, 8: bram_dwidth//8*2}
        else:
            raise Exception('ERROR! M4BRAM variant is invalid. ' + 
                            'Please provide a valid M4BRAM variant \'w\' for WDA or \'n\' for NDA')
            
    def count_streambuf_bram(self, cin, pin, qin, cout, pout, qout):   
        m4bram_ifmap_width = (self.m4bram_qvec - 1) * math.ceil( qin/qout ) + self.rvec
        m4bram_num_bank    = m4bram_ifmap_width * math.ceil(self.m4bram_cvec / self.m4bram_num_cycle_per_iter)
        num_bank = m4bram_num_bank * self.pvec
        
        if self.network == 'alexnet':
            ifmap_depth = math.ceil( (cin*pin*qin + cout*pout*qout) / num_bank )
        elif self.network == 'resnet34' or self.network == 'resnet18':
            ifmap_depth = math.ceil( (cin*pin*qin + 2*cout*pout*qout) / num_bank )
        elif self.network == 'vgg16':
            ifmap_depth = math.ceil( (cin*pin*qin + cout*pout*qout) / 16 / num_bank ) # Cache 1/4 input tensor 
        elif self.network == 'vitbase':
            ifmap_depth = math.ceil( (cin*pin*qin + 2*cout*pout*qout) / num_bank )
        else:
            raise Exception('You have entered a network name that is not supported by default. ' +
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
        num_bram_rvec      = self.rvec
        if (self.m4bram_qvec*self.pvec) < 8:
            bram_dwidth_new = self.bram_dwidth / (self.m4bram_qvec*self.pvec)
        else:
            bram_dwidth_new = 8
        
        if self.variant == 'L':
            num_kvec_per_word  = bram_dwidth_new * 2 / self.pw
        elif self.variant == 'S':
            num_kvec_per_word  = bram_dwidth_new / self.pw
        
        num_bram_cvec_kvec = math.ceil(self.m4bram_kvec / num_kvec_per_word) * self.m4bram_cvec / self.m4bram_cvec_per_bram
        num_bram_r         = math.ceil( r / self.rvec )
        num_bram_s         = s       
        num_bram_c         = math.ceil( c / self.m4bram_cvec )
        num_bram_k         = math.ceil( k / self.m4bram_kvec )
        num_word_bram      = self.bram_mux_factor * self.num_bram_row * self.bram_dwidth // self.pw
        
        if self.network == 'vitbase':
            num_bram_r_s_c_k   = math.ceil( (num_bram_r * num_bram_s * num_bram_c * num_bram_k * 3) / # Uq, Uk, Uv stored on-chip
                                       (num_word_bram / num_kvec_per_word / self.m4bram_cvec_per_bram) )
        elif self.network in ['alexnet', 'resnet18','resnet34', 'vgg16']:
            num_bram_r_s_c_k   = math.ceil( (num_bram_r * num_bram_s * num_bram_c * num_bram_k) / 
                                       (num_word_bram / num_kvec_per_word / self.m4bram_cvec_per_bram) )
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
        if self.variant == 'L':
            m4bram_num_cycle_read_acc = 8
        elif self.variant == 'S':
            m4bram_num_cycle_read_acc = 4

        m4bram_num_cycle_cvec = math.ceil(c / self.m4bram_cvec) * self.m4bram_num_cycle_per_iter
        m4bram_num_iter_kvec  = math.ceil(k / self.m4bram_kvec)
        m4bram_num_cycle      = m4bram_num_cycle_cvec * s * math.ceil(r / self.rvec) * \
                                m4bram_num_iter_kvec * \
                                math.ceil(q / self.m4bram_qvec) * math.ceil(p / self.pvec)
        m4bram_num_cycle_readout = m4bram_num_cycle_read_acc * m4bram_num_iter_kvec * \
                                    math.ceil(q / self.m4bram_qvec) * math.ceil(p / self.pvec)
        
        return m4bram_num_cycle_readout + m4bram_num_cycle
    
    def count_fclayer_cycle(self, c, k):
        n = self.pw
        batch_size = self.m4bram_kvec * 2
        num_flop  = 2 * c * k * batch_size
        num_mac_per_iter = self.m4bram_num_mac_per_iter[n]*self.fcache_bram
        num_cycle = num_flop / (2*num_mac_per_iter) * self.m4bram_num_cycle_per_iter
        return math.ceil(num_cycle / batch_size) 


