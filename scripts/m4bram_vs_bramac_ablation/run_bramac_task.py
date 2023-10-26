import os, subprocess


def main():
    current_path = os.getcwd()
    file_path = current_path + '/../' + 'results/m4bram_vs_bramac_ablation_results.txt'
    with open(file_path, 'w') as f:
        f.write('BRAMAC Results\n')
        f.write('Network'.ljust(12) + 'BRAMAC_Config'.ljust(15) + 'Precision'.ljust(12) + 'Speedup'.ljust(10) + '\n')

    network_list = ['alexnet', 'resnet34', 'vitbase']
    bramac       = [('S', 'd')]

    for nn_name in network_list:
        for precision in [2,4,8]:
            for bramac_variant, bramac_mode in bramac:
                p = subprocess.Popen(['python3', 'bramac_task.py', '--nn_name', nn_name, '--outfile_path', file_path, 
                    '--bramac_mode', bramac_mode, '--bramac_variant', bramac_variant, '--precision', str(precision)])
                p_status = p.wait()
                
        with open(file_path, 'a') as f:
            f.write('\n')

if __name__ == '__main__':
    main()
