import os, subprocess


def main():
    current_path = os.getcwd()
    file_path = current_path + '/' + '../results/mixed_weight_results.txt'
    with open(file_path, 'w') as f:
        f.write('Mixed Weight Results\n\n')
        f.write('Network'.ljust(10) + 'M4BRAM_Config'.ljust(15) + 'Weight'.ljust(25) + 'Input'.ljust(8) + 'Speedup'.ljust(10) + '\n')

    weight_high_ratio_list = [0.05, 0.15, 0.25]

    for weight_high_ratio in weight_high_ratio_list:
        p = subprocess.Popen(['python3', 'mixed_weight_task.py', '--outfile_path', file_path, '--weight_high_ratio', str(weight_high_ratio)])
        p_status = p.wait()
            

if __name__ == '__main__':
    main()
