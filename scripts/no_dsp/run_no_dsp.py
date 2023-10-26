import os, subprocess


def main():
    current_path = os.getcwd()
    file_path = current_path + '/../' + 'results/no_dsp_results.txt'
    with open(file_path, 'w') as f:
        f.write('No DSP Results\n\n')
        f.write('M4BRAM_Config'.ljust(15) + 'Weight'.ljust(8) + 'Input'.ljust(8) + 'Network'.ljust(10) + 'Speedup'.ljust(10) + '\n')

    network_list = ['alexnet', 'resnet18', 'resnet34']
    m4bram       = [('L', 's'), ('L', 'd')]

    for m4bram_variant, m4bram_mode in m4bram:
        for input_precision in [8,7,6,5,4]:
            for nn_name in network_list:
                p = subprocess.Popen(['python3', 'no_dsp_task.py', '--nn_name', nn_name, '--outfile_path', file_path, 
                    '--m4bram_mode', m4bram_mode, '--m4bram_variant', m4bram_variant,
                    '--input_precision', str(input_precision), '--weight_precision', '8',])
                p_status = p.wait()

            with open(file_path, 'a') as f:
                f.write('\n')

if __name__ == '__main__':
    main()
