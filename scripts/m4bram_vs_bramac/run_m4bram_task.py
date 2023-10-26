import os, subprocess


def main():
    current_path = os.getcwd()
    file_path = current_path + '/../results/Section_VE_m4bram_vs_bramac_results.txt'
    with open(file_path, 'a') as f:
        f.write('\n\n\n')
        f.write('Network'.ljust(12) + 'M4BRAM_Config'.ljust(15) + 'Precision'.ljust(12) + 'Speedup'.ljust(10) + '\n')

    network_list = ['alexnet', 'vgg16', 'resnet18', 'resnet34', 'vitbase']
    m4bram       = [('S', 'd'), ('L', 's')]

    for nn_name in network_list:
        for precision in [2,4,8]:
            for m4bram_variant, m4bram_mode in m4bram:
                p = subprocess.Popen(['python3', 'm4bram_task.py', '--nn_name', nn_name, '--outfile_path', file_path, 
                    '--m4bram_mode', m4bram_mode, '--m4bram_variant', m4bram_variant, '--precision', str(precision)])
                p_status = p.wait()
                
        with open(file_path, 'a') as f:
            f.write('\n')

if __name__ == '__main__':
    main()
