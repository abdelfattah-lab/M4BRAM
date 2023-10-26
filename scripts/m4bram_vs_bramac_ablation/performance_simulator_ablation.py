import pandas as pd

import os
current_path = os.getcwd()

import sys
# caution: path[0] is reserved for script path (or '' in REPL)
sys.path.insert(1, current_path + '/..')

from dla_config import *
from dla_m4bram_config import *

def calc_dla_mixed_act_performance(network='alexnet', pw=8, pi=8, rvec=3, 
                                    num_dsp=1500, num_bram=1800, 
                                    num_bram_row=128, num_bram_col=128, bram_mux_factor=4, bram_dwidth=32,
                                    nn_dla=None, ifmap_ofmap_size=None):
    if nn_dla == None or ifmap_ofmap_size == None:
        raise Exception('Please provide a correct neural network topology !')
    if (pi > 8) or (pi < 2) or (pw not in [2,4,8]):
        raise Exception('Invalid precision for weight or activation !')

    dla = DLA_mixed_act(network=network, pw=pw, pi=pi, rvec=rvec, qvec=1, cvec=8, kvec=48)
    dla_latency = {}
    count = 1
    streambuf_dla_layer = {'cin': 0, 'pin': 0, 'qin': 0, 'cout': 0, 'pout': 0, 'qout': 0}
    
    for iofmap_size in ifmap_ofmap_size:
        pin  = iofmap_size[0]
        qin  = iofmap_size[1]
        cin  = iofmap_size[2]
        pout = iofmap_size[3]
        qout = iofmap_size[4]
        cout = iofmap_size[5]
        
        current_ifmap_depth = streambuf_dla_layer['cin']*streambuf_dla_layer['pin']*streambuf_dla_layer['qin'] + \
                            streambuf_dla_layer['cout']*streambuf_dla_layer['pout']*streambuf_dla_layer['qout']
        if ( pin*qin*cin + pout*qout*cout ) > current_ifmap_depth:
            streambuf_dla_layer['pin']  = pin
            streambuf_dla_layer['qin']  = qin
            streambuf_dla_layer['cin']  = cin
            streambuf_dla_layer['pout'] = pout
            streambuf_dla_layer['qout'] = qout
            streambuf_dla_layer['cout'] = cout
    
    fcache_dla_layer = {'r': 0, 's': 0, 'c': 0, 'k': 0} 
    for layer_type, config in nn_dla:
        if layer_type == 'conv':
            r = config[0]
            s = config[1]
            c = config[2]
            p = config[3]
            q = config[4]
            k = config[5]
            
            if ( r*s*c*k ) > ( fcache_dla_layer['r'] * fcache_dla_layer['s'] * fcache_dla_layer['c'] * fcache_dla_layer['k'] ):
                fcache_dla_layer['r'] = r
                fcache_dla_layer['s'] = s
                fcache_dla_layer['c'] = c
                fcache_dla_layer['k'] = k
            
            layer_name = 'conv_' + str(count)
            dla_latency[layer_name] = dla.count_convlayer_cycle(r, s, c, p, q, k)
        elif layer_type == 'fc':
            c = config[0]
            k = config[1]
            
            layer_name = 'fc_' + str(count)
            dla_latency[layer_name] = dla.count_fclayer_cycle(c, k)
        else:
            raise Exception("NN layer type can only be 'conv' or 'fc' !")
        
        count += 1
    
    dla_latency_total = sum(dla_latency.values())
    num_fcache_bram_dla    = dla.count_fcache_bram(r=fcache_dla_layer['r'], s=fcache_dla_layer['s'], 
                                            c=fcache_dla_layer['c'], k=fcache_dla_layer['k'])
    num_streambuf_bram_dla = dla.count_streambuf_bram(cin=streambuf_dla_layer['cin'], 
                                                      pin=streambuf_dla_layer['pin'],
                                                      qin=streambuf_dla_layer['qin'],
                                                      cout=streambuf_dla_layer['cout'],
                                                      pout=streambuf_dla_layer['pout'],
                                                      qout=streambuf_dla_layer['qout']
                                                     )
    dla_area           = calc_dla_area(num_bram=num_fcache_bram_dla + num_streambuf_bram_dla, 
                                      num_dsp=dla.count_dsp())
    
    pvec_list    = []
    qvec_list    = []
    cvec_list    = []
    kvec_list    = []    
    speedup_list = {}
    
    for key in dla_latency:
        speedup_list[key] = []
    
    speedup_total_list    = []
    area_ratio_list       = []
    speedup_per_area_list = []

    fold_config_list = []
    qf_list = []
    
    num_streambuf_bram_list = []
    num_fcache_bram_list    = []
    num_dsp_list            = []
    
    qvec_searchspace = range(1, 9)
    pvec_searchspace = range(1, 9)
    
    for pvec in pvec_searchspace:
        for qvec in qvec_searchspace:
            if (pw == 2) and (pvec*qvec)%2 != 0:
                continue
            for cvec in range(4, 65, 4):
                for kvec in range(4, 129, 4):
                    dlanew = DLA_mixed_act(network=network, pw=pw, pi=pi, rvec=rvec, pvec=pvec, qvec=qvec, cvec=cvec, kvec=kvec,
                                            num_bram_row=num_bram_row, num_bram_col=num_bram_col, 
                                            bram_mux_factor=bram_mux_factor, bram_dwidth=bram_dwidth)
                    
                    # restrict the size of the adder tree to <= 64 elements
                    if dlanew.cvec * dlanew.rvec > 64:
                        continue
                        
                    mem_invalid = ( (kvec/cvec)%2 != 0 )
                    num_fcache_bram = dlanew.count_fcache_bram(r=fcache_dla_layer['r'], s=fcache_dla_layer['s'], 
                                                                c=fcache_dla_layer['c'], k=fcache_dla_layer['k'])
                    num_streambuf_bram = dlanew.count_streambuf_bram(cin=streambuf_dla_layer['cin'], 
                                                                     pin=streambuf_dla_layer['pin'],
                                                                     qin=streambuf_dla_layer['qin'],
                                                                     cout=streambuf_dla_layer['cout'],
                                                                     pout=streambuf_dla_layer['pout'],
                                                                     qout=streambuf_dla_layer['qout'])
                    
                    if (dlanew.count_dsp() > num_dsp) or ((num_fcache_bram + num_streambuf_bram) > num_bram) or mem_invalid:
                        continue

                    count = 1
                    dlanew_latency_total = 0

                    for layer_type, config in nn_dla:
                        if layer_type == 'conv':
                            r = config[0]
                            s = config[1]
                            c = config[2]
                            p = config[3]
                            q = config[4]
                            k = config[5]

                            layer_name = 'conv_' + str(count)
                            layer_latency_dlanew = dlanew.count_convlayer_cycle(r, s, c, p, q, k) 
                            speedup_list[layer_name].append( dla_latency[layer_name] / layer_latency_dlanew )
                            dlanew_latency_total += layer_latency_dlanew
                        elif layer_type == 'fc':
                            c = config[0]
                            k = config[1]

                            layer_name = 'fc_' + str(count)
                            layer_latency_dlanew = dlanew.count_fclayer_cycle(c, k)
                            speedup_list[layer_name].append( dla_latency[layer_name] / layer_latency_dlanew )
                            dlanew_latency_total += layer_latency_dlanew
                        else:
                            raise Exception("NN layer type can only be 'conv' or 'fc' !")

                        count += 1
                        
                    dlanew_area     = calc_dla_area(num_bram=num_fcache_bram + num_streambuf_bram, 
                                                     num_dsp=dlanew.count_dsp())

                    speedup_total = dla_latency_total / dlanew_latency_total

                    num_streambuf_bram_list.append(num_streambuf_bram)
                    num_fcache_bram_list.append(num_fcache_bram)
                    num_dsp_list.append(dlanew.count_dsp())

                    qvec_list.append(qvec)
                    pvec_list.append(pvec)
                    cvec_list.append(cvec)
                    kvec_list.append(kvec)

                    area_ratio = dlanew_area / dla_area
                    area_ratio_list.append(area_ratio)

                    speedup_per_area = speedup_total / area_ratio
                    if speedup_total > 1:
                        speedup_per_area_list.append(speedup_per_area)
                        qf_list.append(speedup_total * speedup_per_area)
                    else:
                        speedup_per_area_list.append(0)
                        qf_list.append(0)

                    speedup_total_list.append(speedup_total)

    result_dict = {'pvec': pvec_list, 'qvec': qvec_list, 'cvec': cvec_list, 'kvec': kvec_list, 
                   'num_streambuf_bram': num_streambuf_bram_list, 'num_fcache_bram': num_fcache_bram_list, 
                   'num_dsp': num_dsp_list,
                   'speedup_total': speedup_total_list, 'area_ratio': area_ratio_list, 
                   'speedup_per_area': speedup_per_area_list, 'qf': qf_list}
    
    for key in speedup_list:
        result_dict[key] = speedup_list[key]

    df = pd.DataFrame(result_dict)
    df_result = df.sort_values(by='qf', axis=0, ascending=False)
    
    return df_result.iloc[0,:].to_dict()



def calc_m4bram_ablation_performance(network='alexnet', mode='s', variant='s', pw=8, pi=8, max_duplication_factor=1,
                                rvec=3, dla_config={},
                                nn_dla=None, nn_dla_m4bram=None, 
                                num_dsp=1500, num_bram=1800,
                                num_bram_row=128, num_bram_col=128, bram_dwidth=32, bram_mux_factor=4,
                                ifmap_ofmap_size=None):
    
    if nn_dla == None or nn_dla_m4bram == None or ifmap_ofmap_size == None:
        raise Exception('Please provide a correct neural network topology !')
        return
    if dla_config == {}:
        raise Exception('Please provide a valid DLA configuration for comparison with DLA-M4BRAM !')
        return
        
    dla_pvec = int(dla_config['pvec'])
    dla_qvec = int(dla_config['qvec'])
    dla_cvec = int(dla_config['cvec'])
    dla_kvec = int(dla_config['kvec'])
    dla = DLA_mixed_act(network=network, pw=pw, pi=pi, rvec=rvec, pvec=dla_pvec, qvec=dla_qvec, cvec=dla_cvec, kvec=dla_kvec,
                        num_bram_row=num_bram_row, num_bram_col=num_bram_col, 
                        bram_mux_factor=bram_mux_factor, bram_dwidth=bram_dwidth)

    dla_latency = {}
    count = 1
    
    streambuf_dla_layer = {'cin': 0, 'pin': 0, 'qin': 0, 'cout': 0, 'pout': 0, 'qout': 0}
    for iofmap_size in ifmap_ofmap_size:
        pin  = iofmap_size[0]
        qin  = iofmap_size[1]
        cin  = iofmap_size[2]
        pout = iofmap_size[3]
        qout = iofmap_size[4]
        cout = iofmap_size[5]
        
        current_ifmap_depth = streambuf_dla_layer['cin']*streambuf_dla_layer['pin']*streambuf_dla_layer['qin'] + \
                            streambuf_dla_layer['cout']*streambuf_dla_layer['pout']*streambuf_dla_layer['qout']
        if ( pin*qin*cin + pout*qout*cout ) > current_ifmap_depth:
            streambuf_dla_layer['pin']  = pin
            streambuf_dla_layer['qin']  = qin
            streambuf_dla_layer['cin']  = cin
            streambuf_dla_layer['pout'] = pout
            streambuf_dla_layer['qout'] = qout
            streambuf_dla_layer['cout'] = cout
    
    fcache_dla_layer = {'r': 0, 's': 0, 'c': 0, 'k': 0} 
    for layer_type, config in nn_dla:
        if layer_type == 'conv':
            r = config[0]
            s = config[1]
            c = config[2]
            p = config[3]
            q = config[4]
            k = config[5]
            
            if ( r*s*c*k ) > ( fcache_dla_layer['r'] * fcache_dla_layer['s'] * \
                              fcache_dla_layer['c'] * fcache_dla_layer['k'] ):
                fcache_dla_layer['r'] = r
                fcache_dla_layer['s'] = s
                fcache_dla_layer['c'] = c
                fcache_dla_layer['k'] = k
            
            layer_name = 'conv_' + str(count)
            dla_latency[layer_name] = dla.count_convlayer_cycle(r, s, c, p, q, k)
        elif layer_type == 'fc':
            c = config[0]
            k = config[1]
            
            layer_name = 'fc_' + str(count)
            dla_latency[layer_name] = dla.count_fclayer_cycle(c, k)
        else:
            raise Exception("NN layer type can only be 'conv' or 'fc' !")
        
        count += 1
    
    dla_latency_total = sum(dla_latency.values())
    num_fcache_bram_dla    = dla.count_fcache_bram(r=fcache_dla_layer['r'], s=fcache_dla_layer['s'], 
                                            c=fcache_dla_layer['c'], k=fcache_dla_layer['k'])
    num_streambuf_bram_dla = dla.count_streambuf_bram(cin=streambuf_dla_layer['cin'], 
                                                      pin=streambuf_dla_layer['pin'],
                                                      qin=streambuf_dla_layer['qin'],
                                                      cout=streambuf_dla_layer['cout'],
                                                      pout=streambuf_dla_layer['pout'],
                                                      qout=streambuf_dla_layer['qout'],
                                                     )
    dla_area           = calc_dla_area(num_bram=num_fcache_bram_dla + num_streambuf_bram_dla, 
                                      num_dsp=dla.count_dsp())
    
    pvec_list        = []
    dsp_qvec_list    = []
    dsp_cvec_list    = []
    dsp_kvec_list    = []
    m4bram_qvec_list = []
    m4bram_cvec_list = []
    m4bram_kvec_list = []
    
    num_streambuf_bram_list = []
    num_fcache_bram_list    = []
    num_dsp_list            = []
    
    speedup_list = {}
    for key in dla_latency:
        speedup_list[key] = []
    
    speedup_total_list    = []
    area_ratio_list       = []
    speedup_per_area_list = []
    qf_list = []
    
    cycle_total_list              = []
    read_m4bram_acc_total_list    = []
    read_m4bram_acc_overhead_list = []
    
    dsp_qvec_searchspace = range(1, 9)

    for pvec in [1, 2, 4]:
        for m4bram_qvec in [1, 2, 4]:
            if m4bram_qvec*pvec > max_duplication_factor+0.5:
                continue
            for dsp_qvec in dsp_qvec_searchspace:
                if pw == 2 and (dsp_qvec*pvec)%2 != 0:
                    continue
                for dsp_cvec in range(4, 65, 4):
                    for m4bram_cvec in range(4, 129, 4):
                        for dsp_kvec in range(4, 257, 4):
                            for m4bram_kvec in range(16, 257, 16):
                                if ((m4bram_cvec/2)%dsp_cvec != 0) or (m4bram_kvec%dsp_kvec != 0) or ((dsp_kvec/dsp_cvec)%2 != 0):
                                    continue
                                    
                                dla_m4bram = DLA_M4BRAM_mixed_act(network=network, mode=mode, variant=variant,
                                                        pw=pw, pi=pi, 
                                                        num_bram_col=num_bram_col, num_bram_row=num_bram_row, 
                                                        bram_dwidth=bram_dwidth, bram_mux_factor=bram_mux_factor, 
                                                        rvec=rvec, pvec=pvec,
                                                        dsp_qvec=dsp_qvec, dsp_cvec=dsp_cvec, dsp_kvec=dsp_kvec,
                                                        m4bram_qvec=m4bram_qvec, m4bram_cvec=m4bram_cvec, m4bram_kvec=m4bram_kvec)
                                
                                # restrict the size of the adder tree to <= 64 elements
                                if dla_m4bram.m4bram_cvec / dla_m4bram.m4bram_cvec_per_bram * dla_m4bram.rvec > 64:
                                    continue
                                if dla_m4bram.dsp_cvec * dla_m4bram.rvec > 64:
                                    continue

                                num_fcache_bram    = dla_m4bram.count_fcache_bram(r=fcache_dla_layer['r'], s=fcache_dla_layer['s'], 
                                                                                    c=fcache_dla_layer['c'], k=fcache_dla_layer['k'])
                                num_streambuf_bram = dla_m4bram.count_streambuf_bram(cin=streambuf_dla_layer['cin'], 
                                                                     pin=streambuf_dla_layer['pin'],
                                                                     qin=streambuf_dla_layer['qin'],
                                                                     cout=streambuf_dla_layer['cout'],
                                                                     pout=streambuf_dla_layer['pout'],
                                                                     qout=streambuf_dla_layer['qout'])
                                
                                # Physical Weight Duplication
                                if m4bram_qvec*pvec >= 8:
                                    num_fcache_bram *= 2
                                    
                                if (dla_m4bram.count_dsp() > num_dsp) or ((num_fcache_bram + num_streambuf_bram) > num_bram):
                                    continue

                                count = 1
                                dla_m4bram_latency_total = 0

                                for layer_type, config in nn_dla_m4bram:
                                    if layer_type == 'conv':
                                        r = config[0]
                                        s = config[1]
                                        c = config[2]
                                        p = config[3]
                                        q = config[4]
                                        k = config[5]

                                        layer_name = 'conv_' + str(count)
                                        layer_latency_dla_m4bram = dla_m4bram.count_convlayer_cycle(r, s, c, p, q, k) 
                                        speedup_list[layer_name].append( dla_latency[layer_name] / layer_latency_dla_m4bram )
                                        dla_m4bram_latency_total += layer_latency_dla_m4bram
                                    elif layer_type == 'fc':
                                        c = config[0]
                                        k = config[1]

                                        layer_name = 'fc_' + str(count)
                                        layer_latency_dla_m4bram = dla_m4bram.count_fclayer_cycle(c, k)
                                        speedup_list[layer_name].append( dla_latency[layer_name] / layer_latency_dla_m4bram )
                                        dla_m4bram_latency_total += layer_latency_dla_m4bram
                                    else:
                                        raise Exception("NN layer type can only be 'conv' or 'fc' !")

                                    count += 1

                                dla_m4bram_area     = calc_dla_m4bram_area(num_bram=num_fcache_bram + num_streambuf_bram, 
                                                            num_dsp=dla_m4bram.count_dsp(), variant=variant)
                                speedup_total = dla_latency_total / dla_m4bram_latency_total

                                num_streambuf_bram_list.append(num_streambuf_bram)
                                num_fcache_bram_list.append(num_fcache_bram)
                                num_dsp_list.append(dla_m4bram.count_dsp())
                                
                                pvec_list.append(pvec)
                                dsp_qvec_list.append(dsp_qvec)
                                dsp_cvec_list.append(dsp_cvec)
                                dsp_kvec_list.append(dsp_kvec)
                                m4bram_qvec_list.append(m4bram_qvec)
                                m4bram_cvec_list.append(m4bram_cvec)
                                m4bram_kvec_list.append(m4bram_kvec)

                                area_ratio = dla_m4bram_area / dla_area
                                area_ratio_list.append(area_ratio)
                                
                                cycle_total_list.append(dla_m4bram_latency_total)
                                read_m4bram_acc_total_list.append(dla_m4bram.read_m4bram_acc_total)
                                read_m4bram_acc_overhead_list.append(dla_m4bram.read_m4bram_acc_total / dla_m4bram_latency_total)

                                speedup_per_area = speedup_total / area_ratio
                                if speedup_total > 1:
                                    speedup_per_area_list.append(speedup_per_area)
                                    qf_list.append(speedup_total * speedup_per_area)
                                else:
                                    speedup_per_area_list.append(0)
                                    qf_list.append(0)

                                speedup_total_list.append(speedup_total)

    result_dict = {'pvec':pvec_list, 
                   'dsp_qvec': dsp_qvec_list, 'dsp_cvec': dsp_cvec_list, 'dsp_kvec': dsp_kvec_list, 
                   'm4bram_qvec': m4bram_qvec_list, 'm4bram_cvec': m4bram_cvec_list, 'm4bram_kvec': m4bram_kvec_list,
                   'num_streambuf_bram': num_streambuf_bram_list, 'num_fcache_bram': num_fcache_bram_list, 
                   'num_dsp': num_dsp_list,
                   'speedup_total': speedup_total_list, 'area_ratio': area_ratio_list, 
                   'speedup_per_area': speedup_per_area_list, 'qf': qf_list,
                   'cycle_total': cycle_total_list, 'read_m4bram_acc_total': read_m4bram_acc_total_list, 
                   'read_m4bram_acc_overhead': read_m4bram_acc_overhead_list}
    for key in speedup_list:
        result_dict[key] = speedup_list[key]

    df = pd.DataFrame(result_dict)
    df_result = df.sort_values(by='qf', axis=0, ascending=False)
    
    return df_result.iloc[0,:].to_dict()    



