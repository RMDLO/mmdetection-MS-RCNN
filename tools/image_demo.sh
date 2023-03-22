#!/usr/bin/env bash

python demo/image_demo.py \
    datasets/cocopen-jittering/val_hard/a5.png \
    configs/cocopen-jittering/ms_rcnn_x101_32x4d_fpn_1x_cocopen_jittering.py \
    work_dirs/ms_rcnn_x101_32x4d_fpn_1x_cocopen_jittering/latest.pth \
    [--device ${GPU_ID}] \
    [--score-thr ${SCORE_THR}]