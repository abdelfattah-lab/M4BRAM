from matplotlib import pyplot as plt
import pandas as pd
import numpy as np
import os 

activation_precision    = ['8-b', '7-b', '6-b', '5-b', '4-b']
model_name              = ['AlexNet', 'ResNet-18', 'ResNet-34' ]

model                   = [ 'alexnet', 'resnet18', 'resnet34' ]

# Synchronous M4BRAM-L
speedup_m4bram_l_s      = { 'resnet34': [2.05,  2.27,  2.52, 1.43, 1.64 ],
                            'resnet18': [1.99,  2.19,  2.43, 1.37, 1.57 ],
                            'alexnet':  [2.10,  2.33,  2.61, 1.48, 1.85 ], 
                           }

# Double-Pumped M4BRAM-L
speedup_m4bram_l_d      = { 'resnet34': [3.28,  3.28,  3.85, 1.92, 2.33 ],
                            'resnet18': [3.13,  3.13,  3.65, 1.83, 2.20 ],
                            'alexnet':  [3.44,  3.44,  4.09, 2.04, 2.70 ], 
                           }

total_speedup_ls = 0
total_speedup_ld = 0
num_speedup      = 0

## Improvement over Baseline Accelerator

linestyle   = 'solid'
markersize  = 10
alpha       = 1
tick_size   = 14.5
label_size  = 15
legend_size = 13.5
title_size  = 16.5
text_size   = 14

title_yloc  = -0.5

figwidth    = 9
figheight   = 2.6

# bar setting
width      = 0.025  # the width of each bar
edgewidth  = 0.8 # the edge width of each bar
hatchwidth = 0.5 # the edge width of each bar
spacing    = 0.11 # spacing between each model bar
distance   = 0.012 # spacing between every two bars of the same model
x          = np.arange(len(activation_precision))*spacing # the label locations

f, ax = plt.subplots(1, 2)
f.set_figwidth(figwidth)
f.set_figheight(figheight)
f.tight_layout(pad=1)

color_r = (238/255, 181/255, 176/255)
color_g = (186/255, 216/255, 165/255)
color_b = (180/255, 207/255, 235/255)

for i in range(2):
    if i == 0:
        yaxis_lim = [1.0, 2.801, 0.3]
        
        f1 = ax[i].bar(x - width*1 - distance*0.5, speedup_m4bram_l_s[model[0]], width, label=activation_precision,  
                       color=color_r)
        f2 = ax[i].bar(x - width*1 - distance*0.5, speedup_m4bram_l_s[model[0]], width, label=activation_precision, 
                       color='none', edgecolor='black', linewidth=edgewidth, alpha=alpha)

        f3 = ax[i].bar(x + width*0 + distance*0, speedup_m4bram_l_s[model[1]], width, label=activation_precision,  
                       color=color_g)
        f4 = ax[i].bar(x + width*0 + distance*0, speedup_m4bram_l_s[model[1]], width, label=activation_precision, 
                       color='none', edgecolor='black', linewidth=edgewidth, alpha=alpha)

        f5 = ax[i].bar(x + width*1 + distance*0.5, speedup_m4bram_l_s[model[2]], width, label=activation_precision,  
                       color=color_b)
        f6 = ax[i].bar(x + width*1 + distance*0.5, speedup_m4bram_l_s[model[2]], width, label=activation_precision, 
                       color='none', edgecolor='black', linewidth=edgewidth, alpha=alpha)
        
        ax[i].set_title('(a)', y=title_yloc, fontsize=title_size)
    else:
        yaxis_lim = [1.5, 4.501, 0.5]
        
        f1 = ax[i].bar(x - width*1 - distance*0.5, speedup_m4bram_l_d[model[0]], width, label=activation_precision,  
                       color=color_r)
        f2 = ax[i].bar(x - width*1 - distance*0.5, speedup_m4bram_l_d[model[0]], width, label=activation_precision, 
                       color='none', edgecolor='black', linewidth=edgewidth, alpha=alpha)

        f3 = ax[i].bar(x + width*0 + distance*0, speedup_m4bram_l_d[model[1]], width, label=activation_precision,  
                       color=color_g)
        f4 = ax[i].bar(x + width*0 + distance*0, speedup_m4bram_l_d[model[1]], width, label=activation_precision, 
                       color='none', edgecolor='black', linewidth=edgewidth, alpha=alpha)

        f5 = ax[i].bar(x + width*1 + distance*0.5, speedup_m4bram_l_d[model[2]], width, label=activation_precision,  
                       color=color_b)
        f6 = ax[i].bar(x + width*1 + distance*0.5, speedup_m4bram_l_d[model[2]], width, label=activation_precision, 
                       color='none', edgecolor='black', linewidth=edgewidth, alpha=alpha)
        
        ax[i].set_title('(b)', y=title_yloc, fontsize=title_size)

    ax[i].tick_params(axis='y',direction='in', pad=6, width=1)

    ax[i].set_xticks(x,)
    ax[i].set_xticklabels(activation_precision)

    ax[i].set_xlabel('Activation Precision', fontsize=label_size, weight='bold', labelpad=6)

    ax[i].set_ylim(yaxis_lim[:2])
    ax[i].set_yticks(np.arange(yaxis_lim[0], yaxis_lim[1], yaxis_lim[2]))
    ax[i].set_ylabel('Speedup', fontsize=label_size, weight='bold', labelpad=6)
    ax[i].set_yticklabels(np.round(ax[i].get_yticks(), 1))

    ax[i].tick_params(axis='both', which='major', labelsize=tick_size)

    ax[i].grid(True, linestyle='dashed', axis='y', zorder=0, color='gray', linewidth=0.9)
    ax[i].set_axisbelow(True)
    #ax[i].spines['top'].set_visible(False)
    #ax[i].spines['right'].set_visible(False)
    for axis in ['top', 'bottom', 'left', 'right']:
        ax[i].spines[axis].set_linewidth(1)  # change width

    x_margin = 0.05
    ax[i].margins(x=x_margin)
#ax[i].set_title('(a) 2-bit Weight & Activation', y=title_yloc, fontsize=title_size, weight='bold')

    
f.legend([(f1,f2), (f3,f4), (f5,f6), ], 
        [model_name[0], model_name[1], model_name[2]], 
        loc='upper center', bbox_to_anchor=[0.5, 1.18], 
        fontsize=legend_size, ncol=4, columnspacing=2, frameon=True, handlelength=1.75, handleheight=0.8)

plt.subplots_adjust(wspace=0.26, hspace=0)

current_path = os.getcwd()
file_path = current_path + '/../' + 'results/fig_12_m4bram_vs_dsp.svg'
f.savefig(file_path, transparent=True, bbox_inches = 'tight', format='svg', dpi=200, pad_inches=0.1)

