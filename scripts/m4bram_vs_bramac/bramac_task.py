import numpy as np
import math
import re, os
import argparse
from performance_simulator_bramac import *

parser = argparse.ArgumentParser(description='Provide information for network and bramac. \n')
parser.add_argument('--nn_name', type=str, required=True, default='alexnet',
                    help='Supported networks are: {alexnet, vgg16, resnet18, resnet34, vitbase}. \n')
parser.add_argument('--bramac_mode', type=str, required=True, default='s',
                    help='Supported modes are: {s, d}, where "s" means synchronous and "d" means double-pumped \n')
parser.add_argument('--bramac_variant', type=str, required=True, default='n',
                    help='Supported variants are: {S, L}, where "S" means small dummy array and "L" means large dummy array \n')
parser.add_argument('--outfile_path', type=str, required=True, default='../results/results.txt',
                    help='Output file path \n')
parser.add_argument('--precision', type=int, required=True, default=8,
                    help='DNN precision \n')


args = parser.parse_args()
nn_name = args.nn_name
bramac_mode = args.bramac_mode
bramac_variant = args.bramac_variant
file_path = args.outfile_path
precision = args.precision

############### M20K and FPGA Configuration ###############
num_bram_row    = 128                                # Number of rows in bramac
num_bram_col    = 160                                # Number of columns in bramac
bram_mux_factor = 4                                  # bramac has a 4:1 mux
bram_dwidth     = num_bram_col // bram_mux_factor    # bramac data width
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

network_bramac = []
with open('../DNN_Description/' + nn_name + '_bramac.txt', 'r') as f:
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
                    network_bramac.append(('conv', layer_dim))
            else:
                layer_dim = re.search(r'\[.+\]', line)
                layer_dim = re.findall(r'[0-9]+', layer_dim.group(0))
                if (layer_dim is None) or (len(layer_dim) != 2):
                    raise Exception("Invalid fully connected layer dimension.")
                else:
                    layer_dim = [int(num) for num in layer_dim]
                    network_bramac.append(('fc', layer_dim))

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
    dla_config = calc_dla_performance(network=nn_name, rvec=rvec, precision=precision,
                                        num_dsp=num_dsp, num_bram=num_bram, 
                                        num_bram_row=num_bram_row, num_bram_col=128, 
                                        bram_mux_factor=bram_mux_factor, bram_dwidth=bram_dwidth, 
                                        nn_dla=network_dla, ifmap_ofmap_size=network_iofmap)
    
    df = calc_bramac_performance(network=nn_name, mode=bramac_mode, variant=bramac_variant,
                                     rvec=rvec, precision=precision, dla_config=dla_config, 
                                     num_dsp=num_dsp, num_bram=num_bram,
                                     num_bram_row=num_bram_row, num_bram_col=num_bram_col, 
                                     bram_mux_factor=bram_mux_factor, bram_dwidth=bram_dwidth, 
                                     nn_dla=network_dla, nn_dla_bramac=network_bramac, 
                                     ifmap_ofmap_size=network_iofmap)
    speedup   = str(round(df['speedup_total'], 2))   

    if bramac_mode == 's':
        mode = 'SA'
    elif bramac_mode == 'd':
        mode = 'DA'

    if bramac_variant == 'S':
        variant = 'BRAMAC-1'
    elif bramac_variant == 'L':
        variant = 'BRAMAC-2'

    with open(file_path, 'a') as f:
        f.write(nn_name.ljust(12) + str(variant+mode).ljust(15) + str(str(precision)+'-bit').ljust(12) + \
                speedup.ljust(10) + '\n')


if __name__ == "__main__":
    main()