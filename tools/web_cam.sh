python demo/webcam_demo.py \
    configs/cocopen-jittering/ms_rcnn_x101_32x4d_fpn_1x_cocopen_jittering.py \
    work_dirs/ms_rcnn_x101_32x4d_fpn_1x_cocopen_jittering/latest.pth \
    [--device ${GPU_ID}] \
    [--camera-id ${CAMERA-ID}] \
    [--score-thr ${SCORE_THR}]