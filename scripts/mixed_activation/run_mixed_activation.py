import os, subprocess


def main():
    current_path = os.getcwd()
    file_path = current_path + '/../' + 'results/mixed_activation_results.txt'
    with open(file_path, 'w') as f:
        f.write('Mixed Activation Results\n\n')
        f.write('Network'.ljust(10) + 'M4BRAM_Config'.ljust(15) + 'Weight'.ljust(8) + 'Input'.ljust(8) + 'Speedup'.ljust(10) + '\n')

    network_list = ['vgg16', 'resnet18', 'resnet34']
    m4bram       = [('S', 'd'), ('L', 's'), ('L', 'd')]

    for nn_name in network_list:
        for input_precision in [8,7,6,5,4]:
            for m4bram_variant, m4bram_mode in m4bram:
                p = subprocess.Popen(['python3', 'mixed_activation_task.py', '--nn_name', nn_name, '--outfile_path', file_path, 
                    '--m4bram_mode', m4bram_mode, '--m4bram_variant', m4bram_variant,
                    '--input_precision', str(input_precision), '--weight_precision', '8',])
                p_status = p.wait()
                
            with open(file_path, 'a') as f:
                f.write('\n')

if __name__ == '__main__':
    main()
