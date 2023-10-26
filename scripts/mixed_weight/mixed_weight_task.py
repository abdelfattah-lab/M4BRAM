import numpy as np
import math
import re, os
import argparse
from performance_simulator_mixed_weight import *


parser = argparse.ArgumentParser(description='Provide information for network and M4BRAM. \n')
parser.add_argument('--outfile_path', type=str, required=True, default='../results/results.txt',
                    help='Output file path \n')
parser.add_argument('--weight_high_ratio', type=float, required=True, default=0.05,
                    help='Ratio of high-precision weight kernels \n')


args = parser.parse_args()
file_path = args.outfile_path
weight_high_ratio = args.weight_high_ratio

nn_name = 'resnet34'
m4bram_mode = 's'
m4bram_variant = 'L'
weight_precision_high = 8
weight_precision_low   = 4
input_precision = 6


############### M20K and FPGA Configuration ###############
num_bram_row    = 128                                # Number of rows in M4BRAM
num_bram_col    = 128                                # Number of columns in M4BRAM
bram_mux_factor = 4                                  # M4BRAM has a 4:1 mux
bram_dwidth     = num_bram_col // bram_mux_factor    # M4BRAM data width
num_bram        = 1537
num_dsp         = 645
rvec            = 3


############### Read network config ###############
network_dla = []
with open('../DNN_Description/' + nn_name + '_dla.txt', 'r') as f:
    for line in f:
        match_layer = re.search(r'\'[a-z]+\'', line)
        if match_layer is not None:
            layer_type = match_layer.group(0)[1:-1]
            if (layer_type != 'conv') and (layer_type != 'fc'):
                raise Exception("NN layer type can only be 'conv' or 'fc' !")
            elif layer_type == 'conv':
                layer_dim = re.search(r'\[.+\]', line)
                layer_dim = re.findall(r'[0-9]+', layer_dim.group(0))
                if (layer_dim is None) or (len(layer_dim) != 6):
                    raise Exception("Invalid conv layer dimension.")
                else:
                    layer_dim = [int(num) for num in layer_dim]
                    network_dla.append(('conv', layer_dim))
            else:
                layer_dim = re.search(r'\[.+\]', line)
                layer_dim = re.findall(r'[0-9]+', layer_dim.group(0))
                if (layer_dim is None) or (len(layer_dim) != 2):
                    raise Exception("Invalid fully connected layer dimension.")
                else:
                    layer_dim = [int(num) for num in layer_dim]
                    network_dla.append(('fc', layer_dim))

network_m4bram = []
with open('../DNN_Description/' + nn_name + '_m4bram.txt', 'r') as f:
    for line in f:
        match_layer = re.search(r'\'[a-z]+\'', line)
        if match_layer is not None:
            layer_type = match_layer.group(0)[1:-1]
            if (layer_type != 'conv') and (layer_type != 'fc'):
                raise Exception("NN layer type can only be 'conv' or 'fc' !")
            elif layer_type == 'conv':
                layer_dim = re.search(r'\[.+\]', line)
                layer_dim = re.findall(r'[0-9]+', layer_dim.group(0))
                if (layer_dim is None) or (len(layer_dim) != 6):
                    raise Exception("Invalid conv layer dimension.")
                else:
                    layer_dim = [int(num) for num in layer_dim]
                    network_m4bram.append(('conv', layer_dim))
            else:
                layer_dim = re.search(r'\[.+\]', line)
                layer_dim = re.findall(r'[0-9]+', layer_dim.group(0))
                if (layer_dim is None) or (len(layer_dim) != 2):
                    raise Exception("Invalid fully connected layer dimension.")
                else:
                    layer_dim = [int(num) for num in layer_dim]
                    network_m4bram.append(('fc', layer_dim))

network_iofmap = []
with open('../DNN_Description/' + nn_name + '_iofmap.txt', 'r') as f:
    for line in f:
        iofmap_dim = re.search(r'\[.+\]', line)
        if iofmap_dim is not None:
            iofmap_dim = re.findall(r'[0-9]+', iofmap_dim.group(0))
            if (iofmap_dim is None) or (len(iofmap_dim) != 6):
                raise Exception("Invalid iofmap dimension.")
            else:
                iofmap_dim = [int(num) for num in iofmap_dim]
                network_iofmap.append(iofmap_dim)


def main():
    dla_config = calc_dla_mixed_weight_performance(network=nn_name, kvec_splitratio=weight_high_ratio, rvec=rvec, 
                                    pw_h=weight_precision_high, pw_l=weight_precision_low, pi=input_precision, 
                                    num_bram_row=num_bram_row, num_bram_col=num_bram_col, 
                                    bram_mux_factor=bram_mux_factor, bram_dwidth=bram_dwidth, 
                                    num_dsp=num_dsp, num_bram=num_bram, 
                                    nn_dla=network_dla, ifmap_ofmap_size=network_iofmap)
    
    df = calc_m4bram_mixed_weight_performance(network=nn_name, mode=m4bram_mode, variant=m4bram_variant, rvec=rvec,
                                            kvec_splitratio=weight_high_ratio,  
                                            pw_h=weight_precision_high, pw_l=weight_precision_low, pi=input_precision, 
                                            dla_config=dla_config, 
                                            num_dsp=num_dsp, num_bram=num_bram,
                                            num_bram_row=num_bram_row, num_bram_col=num_bram_col, 
                                            bram_mux_factor=bram_mux_factor, bram_dwidth=bram_dwidth, 
                                            nn_dla=network_dla, nn_dla_m4bram=network_m4bram, 
                                            ifmap_ofmap_size=network_iofmap)
    speedup   = str(round(df['speedup_total'], 2))   

    if m4bram_mode == 's':
        mode = 'SY'
    elif m4bram_mode == 'd':
        mode = 'DP'

    if m4bram_variant == 'S':
        variant = 'M4S'
    elif m4bram_variant == 'L':
        variant = 'M4L'

    with open(file_path, 'a') as f:
        f.write(nn_name.ljust(10) + str(mode+'-'+variant).ljust(15) + \
                str(str(1-weight_high_ratio) + ' ' + str(weight_precision_low)+'-bit' + ', ' + str(weight_high_ratio) + ' ' + str(weight_precision_high)+'-bit').ljust(25) + \
                str(str(input_precision)+'-bit').ljust(8) + speedup.ljust(10) + '\n')


if __name__ == "__main__":
    main()