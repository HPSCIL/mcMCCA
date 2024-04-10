#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH -p GPU
./mcMCCA_RFR ./parameters.txt