# M4BRAM-Artifacts

This github repository contains the necessary artifacts for the paper: 
>Y. Chen, J. Dotzel and M. Abdelfattah,
>"**M4BRAM: Mixed-Precision Matrix-Matrix Multiplication in FPGA Block RAMs**",
>to appear in _Proceedings of the IEEE International Conference on Field Programmable Technology (FPT)_, December 2023.

## Overview
The **scripts** folder contains all scripts to reproduce the results of Section-V.D, Section-V.E, Section-V.F of the paper.

The **COFFE** folder is a modified version of the COFFE simulator (https://github.com/vaughnbetz/COFFE), with additional features to describe and model the circuits of M4BRAM. We use COFFE to evaluate the area and frequency of M4BRAM (described in Section V-B of the paper). 

## Tested Environment & Dependencies
OS requirement:
- Any OS with python3 to run files in **scripts**
- CentOS Linux 7 (or above) to run files in **COFFE**
- Ubuntu 20.04.6 (or above) to run DNN quantization experiments

For running **scripts** and **COFFE**, the following software is required. 
- Python 2.7
- Synopsys Hspice 2013.03 (or above)
- Python 3.9 (require _numpy_, _pandas_, _matplotlib_ packages)
- Bash

## Summary of Artifact Executions
Run the following command in Terminal to clone this github repository:
 ```
 git clone https://github.com/abdelfattah-lab/M4BRAM.git
 ```
Then go to the **M4BRAM** repository in your terminal. 

## 1. Running the **scripts** folder
Run the following commands after going to the **M4BRAM** repository in your terminal. 
 ```
 cd scripts
 bash run_experiments.sh
 ```
It will take several minutes to finish. A new directory **results** under **scripts** will be created and contain experiment results in _.txt_ format. To view the results, go to the **results** directory. There are totally 4 _.txt_ files:
- _Section_VD_mixed_activation_results.txt_: This file contains the results shown in **Fig. 9** of the M4BRAM paper. 
- _Section_VD_mixed_weight_results.txt_: This file contains the results shown in **Table III** of the M4BRAM paper. 
- _Section_VE_m4bram_vs_bramac_results.txt_: This file contains the results shown in **Fig. 10** of the M4BRAM paper. 
- _Section_VE_m4bram_vs_bramac_ablation_results.txt_: This file contains the results shown in **Fig. 11** of the M4BRAM paper. 
- _Section_VF_no_dsp_results.txt_: This file contains the results shown in **Fig. 12** of the M4BRAM paper. 

We also provide the scripts to reproduce the figures in the M4BRAM paper. Run the following command in your terminal. 
 ```
 bash plot_results.sh
 ```
Then 4 figures in _.svg_ format will be generated under the **results** directory. The 4 figures' names contain the corresponding figure numbers in the M4BRAM paper. 


## 2. Running the **COFFE** simulator for M4BRAM
Before running this experiment, please source the necessary bash files in your terminal to enable Synopsys HSpice. Make sure that the following command:
 ```
hspice
```
can be run successfully in the current terminal.

Run the following commands (assuming still in the **scripts** directory after running the first experiments):
 ```
 cd ../COFFE
 python2 coffe.py -i 6 input_files/M4BRAM/M4BRAM_S_16k.txt
 python2 coffe.py -i 6 input_files/M4BRAM/M4BRAM_L_16k.txt
 ```
The two python2 commands evaluate M4BRAM-S and M4BRAM-L, respectively. Each of the two COFFE-CIM experiments takes roughly 12 hours to complete (depending on the computer's performance). After completing, users can view the reported delay and area by running the following commands inside the **COFFE** repository:
 ```
 cd input_files/M4BRAM/M4BRAM_S_16k
 open report.txt 
 cd input_files/M4BRAM/M4BRAM_L_16k
 open report.txt 
 ```
The first **report.txt** file shows the COFFE results for M4BRAM-S, while the second **report.txt** shows the COFFE results for M4BRAM-L. The area and delay information of M4BRAM is inside the **report.txt** file, under **DUMMY ARRAY AREA CONTRIBUTIONS**. 
