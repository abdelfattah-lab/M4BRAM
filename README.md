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

There are 3 tasks required to collect the area, frequency, and performance of BRAMAC
1. Run **COFFE-CIM** to obtain the area and delay of different components of BRAMAC. 
2. Run scripts in **dlabramac** to obtain the speedup of employing BRAMAC to Intel DLA for AlexNet and ResNet-34.
3. Run synopsys design compiler to obtain the area of the embedded finite-state machines in BRAMAC.

## 1. Running COFFE-CIM
Before running this experiment, please make sure that the following command:
 ```
hspice
```
can be run successfully in the current terminal. If not, please set up the hspice environment in the terminal. 

COFFE-CIM can report the area and delay of all components in BRAMAC by running the following commands inside the BRAMAC repository:
 ```
 cd COFFE-CIM
 python2 coffe.py -i 6 input_files/CIM/RAM16_CIM.txt
 python2 coffe.py -i 6 input_files/CIM/RAM32_CIM.txt 
 ```
The two python2 commands evaluate BRAMAC based on 16Kb and 32Kb baseline BRAMs. Each of the two COFFE-CIM experiments takes roughly 12 hours to complete depending on the computer's performance. After completing, users can view the reported delay and area by running the following commands inside the BRAMAC repository:
 ```
 cd COFFE-CIM/input_files/CIM/RAM16_CIM
 open report.txt 
 cd COFFE-CIM/input_files/CIM/RAM32_CIM
 open report.txt 
 ```
The first **report.txt** file is for a 16Kb baseline BRAM, while the second **report.txt** file is for a 32Kb baseline BRAM. The dummy array area information is inside the **report.txt** file, under **DUMMY ARRAY AREA CONTRIBUTIONS**. Note that the reported dummy array area contains two dummy arrays. The user should divide the area number by 2 to obtain the area of one dummy array as in the paper. 
To estimate the dummy array area of a 20Kb baseline BRAM, the user can do a linear interpolating between 16kb and 32kb cases: **area_20Kb = area_16Kb + (area_32Kb - area_16Kb)/4**. 

## 2. Running DLA-BRAMAC
The scripts under **dlabramac** can report the speedup and area overhead of DLA-BRAMAC comapred to the baseline DLA by running the following commands inside the BRAMAC repository:
 ```
 cd dlabramac
 python3 dlabramac_2sa.py --nn_type alexnet
 python3 dlabramac_2sa.py --nn_type resnet
 python3 dlabramac_1da.py --nn_type alexnet
 python3 dlabramac_1da.py --nn_type resnet
 ```
Each two python3 commands evaluate a BRAMAC variant (2sa or 1da) for a specific network (alexnet or resnet), and will generate a **.txt** file to summarize the speedup and area overhead pf DLA-BRAMAC under different MAC precisions. 

## 3. Synthesizing the Embedded Finite-State Machine
To run this experiment in the BRAMAC repository, Synopsys Design COmpiler and a commercial Technology PDK is required. We are not able to disclose any information about the technology PDK due to non-disclosure agreement with the third party. But we encourage users to synthesize the systemVerilog using their commercial or free PDKs. We give an example on how to synthesize the embedded finite-state machine for BRAMAC-2SA. The process for synthesize the embedded finite-state machine for BRAMAC-1DA is similar. 

In addition to setting up the target library, the link library, the user can add the following two commands in their Synopsys Design Compiler tcl setup file.  
 ```
 <commands to set up target_library and link_library, leaving for the users>

 analyze -format sverilog synopsys/fsm_2sa/fsm_2sa.v
 elaborate fsm_2sa
 check_design
 create_clock clk -name ideal_clock1 -period 0.4
 compile

 write -format verilog -hierarchy -output post-synth.v
 write -format ddc     -hierarchy -output post-synth.ddc
 report_resources -nosplit -hierarchy
 report_timing -nosplit -transition_time -nets -attributes
 report_area -nosplit -hierarchy
 report_power -nosplit -hierarchy
 ```
After running Synopsys Design COmpiler with the above tcl setup file, the area of the embedded finite-state machine will be reported. 
