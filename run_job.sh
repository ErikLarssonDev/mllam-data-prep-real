#!/bin/sh
#SBATCH -t 72:00:00
#SBATCH --mail-type=ALL
#SBATCH --mail-user=erila85@liu.se
#SBATCH --output ./slurm_logs/%A_%x.out
#SBATCH -p berzelius-cpu -n1 -c12
#SBATCH -J IFS_TEST
# --reservation=1g.10gb

source ~/.bashrc
cd /proj/berzelius-2022-164/users/x_erila/mllam-data-prep-real

module load Mambaforge/23.3.1-1-hpc1-bdist
mamba activate real-lam

wandb online

# python -m mllam_data_prep danra_model3_config.yaml --output model3 --show-progress
# python -m mllam_data_prep danra_model3_config.yaml --output model3/danra_model3_config.zarr --show-progress
# python -m mllam_data_prep overlapping_ifs_val_400km_model1_config.yaml --output run_output/overlapping_ifs_val_400km_model1_config.zarr --show-progress
python -m mllam_data_prep overlapping_ifs_test_400km_model1_config.yaml --output run_output/overlapping_ifs_test_400km_model1_config.zarr --show-progress