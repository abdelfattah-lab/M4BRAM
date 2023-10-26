rm -rf results
mkdir -p results

cd mixed_activation
python3 run_mixed_activation.py &&

cd ..
cd mixed_weight
python3 run_mixed_weight.py &&

cd ..
cd m4bram_vs_bramac
python3 run_bramac_task.py &&
python3 run_m4bram_task.py &&

cd ..
cd m4bram_vs_bramac_ablation
python3 run_bramac_task.py &&
python3 run_ablation_task.py &&

cd ..
cd no_dsp
python3 run_no_dsp.py &&

echo "Successfully run all experiments."
