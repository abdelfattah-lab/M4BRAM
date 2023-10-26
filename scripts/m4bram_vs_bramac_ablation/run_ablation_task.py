import os, subprocess


def main():
    current_path = os.getcwd()
    file_path = current_path + '/../results/Section_VE_m4bram_vs_bramac_ablation_results.txt'
    network_list = ['alexnet', 'resnet34', 'vitbase']
    m4bram       = [('S', 'd')]

    with open(file_path, 'a') as f:
        f.write('\n\nAblation Study with Maximum Duplication Factor = 1\n')
        f.write('Network'.ljust(12) + 'M4BRAM_Config'.ljust(15) + 'Precision'.ljust(12) + 'Speedup'.ljust(10) + '\n')

    for nn_name in network_list:
        for precision in [2,4,8]:
            for m4bram_variant, m4bram_mode in m4bram:
                p = subprocess.Popen(['python3', 'ablation_task.py', '--nn_name', nn_name, '--outfile_path', file_path, 
                    '--m4bram_mode', m4bram_mode, '--m4bram_variant', m4bram_variant, '--precision', str(precision), 
                    '--max_duplication_factor', str(1)])
                p_status = p.wait()
                
        with open(file_path, 'a') as f:
            f.write('\n')

    with open(file_path, 'a') as f:
        f.write('\n\nAblation Study with Maximum Duplication Factor = 2\n')
        f.write('Network'.ljust(12) + 'M4BRAM_Config'.ljust(15) + 'Precision'.ljust(12) + 'Speedup'.ljust(10) + '\n')

    for nn_name in network_list:
        for precision in [2,4,8]:
            for m4bram_variant, m4bram_mode in m4bram:
                p = subprocess.Popen(['python3', 'ablation_task.py', '--nn_name', nn_name, '--outfile_path', file_path, 
                    '--m4bram_mode', m4bram_mode, '--m4bram_variant', m4bram_variant, '--precision', str(precision),
                    '--max_duplication_factor', str(2)])
                p_status = p.wait()
                
        with open(file_path, 'a') as f:
            f.write('\n')

    with open(file_path, 'a') as f:
        f.write('\n\nAblation Study with Maximum Duplication Factor = 4\n')
        f.write('Network'.ljust(12) + 'M4BRAM_Config'.ljust(15) + 'Precision'.ljust(12) + 'Speedup'.ljust(10) + '\n')

    for nn_name in network_list:
        for precision in [2,4,8]:
            for m4bram_variant, m4bram_mode in m4bram:
                p = subprocess.Popen(['python3', 'ablation_task.py', '--nn_name', nn_name, '--outfile_path', file_path, 
                    '--m4bram_mode', m4bram_mode, '--m4bram_variant', m4bram_variant, '--precision', str(precision),
                    '--max_duplication_factor', str(4)])
                p_status = p.wait()
                
        with open(file_path, 'a') as f:
            f.write('\n')

if __name__ == '__main__':
    main()
