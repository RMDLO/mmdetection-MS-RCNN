#!/usr/bin/env bash

# Request resources with srun
srun --partition=gpu \
 --time=4:00:00 \
 --nodes=1 \
 --ntasks-per-node=64 \
 --sockets-per-node=2 \
 --cores-per-socket=8 \
 --threads-per-core=4 \
 --mem-per-cpu=1200 \
 --wait=0 \
 --export=ALL \
 --gres=gpu:v100:4 \
 --pty /bin/bash;

 module load opence/1.5.1 && tools/dist_train.sh configs/cocopen-jittering/ms_rcnn_x101_32x4d_fpn_1x_cocopen_jittering.py 4
