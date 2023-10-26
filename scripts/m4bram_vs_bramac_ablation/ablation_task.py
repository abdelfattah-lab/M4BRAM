import numpy as np
import math
import re, os
import argparse
from performance_simulator_ablation import *

parser = argparse.ArgumentParser(description='Provide information for network and M4BRAM. \n')
parser.add_argument('--nn_name', type=str, required=True, default='alexnet',
                    help='Supported networks are: {alexnet, vgg16, resnet18, resnet34, vitbase}. \n')
parser.add_argument('--m4bram_mode', type=str, required=True, default='s',
                    help='Supported M4BRAM modes are: {s, d}, where "s" means synchronous and "d" means double-pumped \n')
parser.add_argument('--m4bram_variant', type=str, required=True, default='S',
                    help='Supported M4BRAM variants are: {S, L}, where "S" means small dummy array and "L" means large dummy array \n')
parser.add_argument('--outfile_path', type=str, required=True, default='../results/results.txt',
                    help='Output file path \n')
parser.add_argument('--precision', type=int, required=True, default=8,
                    help='DNN precision \n')
parser.add_argument('--max_duplication_factor', type=int, required=True, default=2,
                    help='Maximum duplication factor of M4BRAM \n')

args = parser.parse_args()
nn_name = args.nn_name
m4bram_mode = args.m4bram_mode
m4bram_variant = args.m4bram_variant
file_path = args.outfile_path
precision = args.precision
max_duplication_factor = args.max_duplication_factor

############### M20K and FPGA Configuration ###############
num_bram_row    = 128                                # Number of rows in M4BRAM
num_bram_col    = 128                                # Number of columns in M4BRAM
bram_mux_factor = 4                                  # M4BRAM has a 4:1 mux
bram_dwidth     = num_bram_col // bram_mux_factor    # M4BRAM data width
if (nn_name in ['vgg16', 'resnet18', 'resnet34']) and (precision == 8):
    num_bram        = 2489
    num_dsp         = 1152
else:
    num_bram        = 1537
    num_dsp         = 645


############## Global rvec for DLA ###############
if nn_name == 'vitbase':
    rvec = 1
else:
    rvec = 3


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
    dla_config = calc_dla_mixed_act_performance(network=nn_name, rvec=rvec, pw=precision, pi=precision, 
                                        num_dsp=num_dsp, num_bram=num_bram, 
                                        num_bram_row=num_bram_row, num_bram_col=num_bram_col, 
                                        bram_mux_factor=bram_mux_factor, bram_dwidth=bram_dwidth, 
                                        nn_dla=network_dla, ifmap_ofmap_size=network_iofmap)
    
    df = calc_m4bram_ablation_performance(network=nn_name, mode=m4bram_mode, variant=m4bram_variant,
                                        max_duplication_factor=max_duplication_factor,
                                        rvec=rvec, pw=precision, pi=precision, dla_config=dla_config, 
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
        f.write(nn_name.ljust(12) + str(mode+'-'+variant).ljust(15) + \
                str(str(precision)+'-bit').ljust(12) + speedup.ljust(10) + '\n')


if __name__ == "__main__":
    main()