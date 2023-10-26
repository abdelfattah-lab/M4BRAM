from matplotlib import pyplot as plt
import pandas as pd
import numpy as np
import os 

model_list      = ['AlexNet', 'VitBase', 'ResNet34']
precision_list  = ['2-bit', '4-bit', '8-bit']
x_labels = precision_list * 3 + ['GM']

################ BRAMAC ################
# BRAMAC-1DA
speedup_bramac_1da   = np.array([(1.45,1.80,1.75), (1.20,1.74,1.73), (1.09,1.32,1.06)])

################ M4BRAM ################
# Double-Pumped M4BRAM-S
speedup_m4bram_s_d_1 = np.array([(1.43,1.83,1.85), (1.29,1.80,1.86), (1.26,1.29,1.25)])
speedup_m4bram_s_d_2 = np.array([(1.84,2.70,1.85), (1.86,2.40,1.92), (1.61,1.82,1.54)])
speedup_m4bram_s_d_4 = np.array([(2.72,2.70,2.31), (2.48,2.51,1.92), (2.26,2.43,1.64)])
m4bram_s_d_1 = speedup_m4bram_s_d_1 / speedup_bramac_1da
m4bram_s_d_2 = speedup_m4bram_s_d_2 / speedup_bramac_1da
m4bram_s_d_4 = speedup_m4bram_s_d_4 / speedup_bramac_1da

mean_m4bram_s_d_1 = np.mean(m4bram_s_d_1)
mean_m4bram_s_d_2 = np.mean(m4bram_s_d_2)
mean_m4bram_s_d_4 = np.mean(m4bram_s_d_4)

m4bram_vs_bramac = np.concatenate([m4bram_s_d_1, m4bram_s_d_2, m4bram_s_d_4], axis = 0)
speedup = {}
keys = []
for i, model in enumerate(model_list):
    for j, precision in enumerate(precision_list):
        speedup[(model, precision)] = (m4bram_s_d_1[i, j], m4bram_s_d_2[i, j], m4bram_s_d_4[i, j])
        keys.append((model, precision))

bar_0 = [speedup[(i, j)][0] for (i, j) in keys] + [mean_m4bram_s_d_1]
bar_1 = [speedup[(i, j)][1] for (i, j) in keys] + [mean_m4bram_s_d_2]
bar_2 = [speedup[(i, j)][2] for (i, j) in keys] + [mean_m4bram_s_d_4]
## Improvement over BRAMAC
linestyle   = 'solid'
markersize  = 6
alpha       = 1
tick_size   = 13
label_size  = 13
legend_size = 13
rotation    = 0

title_yloc  = -0.26

figwidth    = 7.5
figheight   = 2.5

# bar setting
width      = 0.025  # the width of each bar
edgewidth  = 0.8 # the edge width of each bar
hatchwidth = 0.5 # the edge width of each bar
spacing    = 0.12 # spacing between each model bar
distance   = 0.015 # spacing between every two bars of the same model
x          = np.arange(len(x_labels))*spacing # the label locations
f, ax = plt.subplots(1, 1)
f.set_figwidth(figwidth)
f.set_figheight(figheight)
f.tight_layout(pad=1)

yaxis_tick = [0.5, 1.0, 1.5, 2.0, 2.2]
color_r = (238/255, 181/255, 176/255)
color_g = (186/255, 216/255, 165/255)
color_b = (180/255, 207/255, 235/255)
color_list = [color_r, color_g, color_b]

f1 = ax.bar(x - width*1.5 - distance, bar_0, width, label=model_list, color=color_list[0], edgecolor='black', linewidth=edgewidth, alpha=alpha)

f3 = ax.bar(x - width*0.5 - distance*0.5, bar_1, width, label=model_list, color=color_list[1], edgecolor='black', linewidth=edgewidth, alpha=alpha)

f5 = ax.bar(x + width*0.5 + distance*0, bar_2, width, label=model_list, color=color_list[2], edgecolor='black', linewidth=edgewidth, alpha=alpha)

ax.set_xticks(x-distance*1.275,)
ax.set_xticklabels(x_labels)

ax.set_ylim(yaxis_tick[0], yaxis_tick[-1])
ax.set_yticks(yaxis_tick)
ax.set_ylabel('Speedup', fontsize=label_size, weight='bold')
ax.set_yticklabels(np.round(ax.get_yticks(), 1))

ax.tick_params(axis='both', which='major', labelsize=tick_size)

ax.grid(True, linestyle='dashed', axis='y', zorder=0, color='gray', linewidth=0.6)
ax.set_axisbelow(True)
#ax.spines['top'].set_visible(False)
#ax.spines['right'].set_visible(False)
for axis in ['top', 'bottom', 'left', 'right']:
    ax.spines[axis].set_linewidth(1)  # change width

#ax.set_title('(a) 2-bit Weight & Activation', y=title_yloc, fontsize=title_size, weight='bold')

ax.margins(x=0.025)

legend_loc  = (0.225, 0.875)
f.legend([(f1,), (f3,), (f5,)], [r'$N_{I} = 1$', r'$N_{I} = \{1,2\}$', r'$N_{I} = \{1,2,4\}$'], 
             loc=legend_loc, fontsize=legend_size, ncol=4, columnspacing=2, frameon=False, handlelength=2, handleheight=0.9)


f.subplots_adjust(
    left=0.01,
    right=0.981,
)


current_path = os.getcwd()
file_path = current_path + '/../' + 'results/fig11_ablation.svg'
f.savefig(file_path, transparent=True, bbox_inches = 'tight', format='svg', dpi=200, pad_inches=0.1)

