from matplotlib import pyplot as plt
import pandas as pd
import numpy as np
import os

activation_precision    = ['8-b', '7-b', '6-b', '5-b', '4-b']
model_name              = ['AlexNet', 'VGG-16', 'ResNet-18', 'ResNet-34' ]

model                   = [ 'vgg16', 'resnet18', 'resnet34' ]

base_accuracy           = { 'resnet34': 75.16,  'resnet18': 73.09, 'alexnet': 61.43,  'vgg16': 73.02}

accuracy                = { 'resnet34': [75.06, 75.09, 75.03, 74.31, 72.37],
                            'resnet18': [72.77, 72.74, 72.55, 71.83, 69.18],
                            'alexnet' : [60.87, 60.91, 60.68, 59.96, 56.61], 
                            'vgg16':    [72.94, 72.99, 72.79, 72.42, 70.70]}

# Double-Pumped M4BRAM-S
speedup_m4bram_s_d      = { 'resnet34': [1.64,  1.64,  1.96,  1.27,  1.50 ],
                            'alexnet':  [1.76,  1.76,  1.85,  1.32,  1.73 ], 
                            'resnet18': [1.62,  1.62,  1.93,  1.27,  1.46 ], 
                            'vgg16':    [1.61,  1.61,  1.86,  1.32,  1.57 ], }

# Synchronous M4BRAM-L
speedup_m4bram_l_s      = { 'resnet34': [2.03,  2.20,  2.32,  1.44,  1.71 ],
                            'alexnet':  [1.92,  2.08,  2.28,  1.52,  2.17 ], 
                            'resnet18': [1.96,  2.11,  2.25,  1.38,  1.52 ], 
                            'vgg16':    [1.80,  1.99,  2.22,  1.52,  1.52 ], }

# Double-Pumped M4BRAM-L
speedup_m4bram_l_d      = { 'resnet34': [2.34,  2.34,  2.34,  1.77,  2.14 ],
                            'alexnet':  [2.54,  2.54,  2.58,  1.79,  2.46 ], 
                            'resnet18': [2.29,  2.29,  2.29,  1.70,  2.04 ], 
                            'vgg16':    [2.24,  2.24,  2.31,  1.70,  2.06 ], }

linestyle   = 'solid'
markersize  = 10
alpha       = 1
tick_size   = 15
label_size  = 15.5
legend_size = 14
title_size  = 15
text_size   = 14.5

title_yloc  = -0.26

figwidth    = 16
figheight   = 3

# bar setting
width      = 0.025  # the width of each bar
edgewidth  = 0.8 # the edge width of each bar
hatchwidth = 0.5 # the edge width of each bar
spacing    = 0.11 # spacing between each model bar
distance   = 0.012 # spacing between every two bars of the same model
x          = np.arange(len(activation_precision))*spacing # the label locations

f, ax = plt.subplots(1, 3)
f.set_figwidth(figwidth)
f.set_figheight(figheight)
f.tight_layout(pad=1)

yaxis_lim = [0.5, 2.501, 0.5]

for i in range(len(model)):
    name = model[i]
    f1 = ax[i].bar(x - width*1 - distance*0.5, speedup_m4bram_s_d[name], width, label=activation_precision,  
                   color='white', edgecolor=(1,0.25,0.25), linewidth=hatchwidth, hatch="xxxx")
    f2 = ax[i].bar(x - width*1 - distance*0.5, speedup_m4bram_s_d[name], width, label=activation_precision, 
                   color='none', edgecolor='black', linewidth=edgewidth, alpha=alpha)

    f3 = ax[i].bar(x + width*0 + distance*0, speedup_m4bram_l_s[name], width, label=activation_precision,  
                   color='white', edgecolor='mediumpurple', linewidth=hatchwidth, hatch="+++")
    f4 = ax[i].bar(x + width*0 + distance*0, speedup_m4bram_l_s[name], width, label=activation_precision, 
                   color='none', edgecolor='black', linewidth=edgewidth, alpha=alpha)
    
    f5 = ax[i].bar(x + width*1 + distance*0.5, speedup_m4bram_l_d[name], width, label=activation_precision,  
                   color='white', edgecolor='dodgerblue', linewidth=hatchwidth, hatch="+++")
    f6 = ax[i].bar(x + width*1 + distance*0.5, speedup_m4bram_l_d[name], width, label=activation_precision, 
                   color='none', edgecolor='black', linewidth=edgewidth, alpha=alpha)

    ax[i].tick_params(axis='y',direction='in', pad=6, width=1)

    ax[i].set_xticks(x,)
    ax[i].set_xticklabels(activation_precision)

    if name == 'alexnet':
        ax[i].set_xlabel('AlexNet Activation', fontsize=label_size, weight='bold', labelpad=6)
    elif name == 'vgg16':
        ax[i].set_xlabel('VGG-16 Activation', fontsize=label_size, weight='bold', labelpad=6)
    elif name == 'resnet18':
        ax[i].set_xlabel('ResNet-18 Activation', fontsize=label_size, weight='bold', labelpad=6)
    elif name == 'resnet34':
        ax[i].set_xlabel('ResNet-34 Activation', fontsize=label_size, weight='bold', labelpad=6)

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

    x_margin = 0.03
    ax[i].margins(x=x_margin)
    #ax[i].set_title('(a) 2-bit Weight & Activation', y=title_yloc, fontsize=title_size, weight='bold')


    ax2 = ax[i].twinx()
    #color = (0.25, 0.41, 0.88)
    factor = 1/255
    color = (100*factor, 170*factor, 100*factor)
    
    error_tolerance = 0.5
    f7  = ax2.axhline(base_accuracy[name]-error_tolerance, color='black', linewidth=1.5, linestyle='-.')
    
    f8, = ax2.plot(x, accuracy[name], color=color, linewidth=2.5, linestyle=linestyle, 
                     marker = 'o', markersize=markersize, alpha=0.8)

    if name == 'alexnet':
        ax2.set_yticks(np.arange(56, 62.1, 1.5))
    elif name == 'vgg16':
        ax2.set_yticks(np.arange(70, 74.1, 1))
        ax2.text(0.33, 72.65, str(round(base_accuracy[name]-error_tolerance,2)),  color='black', fontsize=text_size, weight='bold')
    elif name == 'resnet18':
        ax2.set_yticks(np.arange(68, 74.1, 1))
        ax2.text(0.33, 72.75, str(round(base_accuracy[name]-error_tolerance,2)),  color='black', fontsize=text_size, weight='bold')
    elif name == 'resnet34':
        ax2.set_yticks(np.arange(72, 76.1, 1))
        ax2.text(0.33, 74.79, str(round(base_accuracy[name]-error_tolerance,2)),  color='black', fontsize=text_size, weight='bold')

    ax2.tick_params(axis='y', direction='in', pad=6, width=1)

    ax2.set_ylabel('Accuracy (%)', fontsize=label_size, weight='bold', labelpad=6)
    ax2.tick_params(axis='both', which='major', labelsize=tick_size)

    ax2.margins(x=x_margin)

    
f.legend([(f1,f2), (f3,f4), (f5,f6), (f8)], 
        ['Speedup (Double-pumped M4S)', 'Speeup (Synchronous M4L)', 'Speeup (Double-pumped M4L)', 'Accuracy'], 
        loc='upper center', bbox_to_anchor=[0.5, 1.16], 
        fontsize=legend_size, ncol=4, columnspacing=2, frameon=True, handlelength=1.75, handleheight=0.9)

plt.subplots_adjust(wspace=0.38, hspace=0)

current_path = os.getcwd()
file_path = current_path + '/../results/fig_9_m4bram_mixed_activation.svg'
f.savefig(file_path, transparent=True, bbox_inches = 'tight', format='svg', dpi=200, pad_inches=0.1)

