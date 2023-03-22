#!/bin/bash
#SBATCH --job-name="ms-rcnn"
#SBATCH --output="ms-rcnn.%j.%N.out"
#SBATCH --error="ms-rcnn.%j.%N.err"
#SBATCH --partition=gpu
#SBATCH --time=24:00:00
#SBATCH --nodes=2
#SBATCH --ntasks-per-node=64
#SBATCH --sockets-per-node=2
#SBATCH --cores-per-socket=8
#SBATCH --threads-per-core=4
#SBATCH --mem-per-cpu=1200
#SBATCH --export=ALL
#SBATCH --gres=gpu:v100:1

cd RMDLO/mmdetection/

./tools/dist_train.sh configs/cocopen-jittering/ms_rcnn_x101_32x4d_fpn_1x_cocopen_jittering.py 8 --work-dir=work_dirs/ms_rcnn_x101_32x4d_fpn_1x_cocopen_jittering-8gpu