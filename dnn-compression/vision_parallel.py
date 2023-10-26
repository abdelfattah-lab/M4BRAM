import subprocess
import multiprocessing as mp


def worker(gpu_id, other_args):
    """Hacky example script for quick parallel execution of vision_eval.py"""
    command = f"/usr/local/anaconda3/2020.11/bin/python vision_eval.py --device cuda:{gpu_id} {other_args}"
    process = subprocess.Popen(command, shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)

    accuracy = None
    memory_cost = None
    for line in iter(process.stdout.readline, b''):
        line = line.decode().strip()
        print(f"[Process {gpu_id}] {line}")
        if line.startswith('* Prec@1'):
            accuracy = float(line.split()[-1])
        elif line.startswith('Memory cost'):
            memory_cost = float(line.split()[-2])

    process.stdout.close()
    process.wait()

    return accuracy, memory_cost


if __name__ == "__main__":
    percentages = [0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8]
    anti_percentages = [1 - percentage for percentage in percentages]
    percentage_args = [f"{percentage},{anti_percentage}" for percentage, anti_percentage in zip(percentages, anti_percentages)]
    weight_quant_bits = '8,4'
    activation_bits = 6
    epochs = 10
    lr = 5e-5
    workers = 2
    batch_size = 128

    pool = mp.Pool(processes=len(percentage_args))
    results = []
    for i in range(len(percentage_args)):
        other_args = f"--arch resnet34 --multi-quant --weight-bits=8 --activation-bits={activation_bits} " \
                     f"--multi-quant-percentages={percentage_args[i]} --dataset=imagenet -b={batch_size} " \
                     f"--positive-activations --multi-quant-bits={weight_quant_bits} " \
                     f"--print-freq=15000 --epochs={epochs} --lr={lr} --workers={workers} --seed=0"
        result = pool.apply_async(worker, args=(i, other_args))
        results.append(result)

    pool.close()
    pool.join()

    # Gather all results
    accuracies_and_costs = [result.get() for result in results]
    accuracies = [item[0] for item in accuracies_and_costs]
    memory_costs = [item[1] for item in accuracies_and_costs]
    print("Accuracies:", accuracies)
    print("Memory Costs:", memory_costs)
    print("Accuracies:")
    for accuracy in accuracies:
        print(accuracy)

    print("Memory Costs:")
    for cost in memory_costs:
        print(cost)
