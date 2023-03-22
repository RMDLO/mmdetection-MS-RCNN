from mmdet.apis import init_detector, inference_detector
import mmcv

# Specify the path to model config and checkpoint file
config_file = 'configs/cocopen-jittering/ms_rcnn_x101_32x4d_fpn_1x_cocopen_jittering.py'
checkpoint_file = 'work_dirs/ms_rcnn_x101_32x4d_fpn_1x_cocopen_jittering/epoch_200.pth'

# build the model from a config file and a checkpoint file
model = init_detector(config_file, checkpoint_file, device='cuda:0')

# test a single image and show the results
img = 'datasets/cocopen-jittering/val_easy/8.png'  # or img = mmcv.imread(img), which will only load it once
result = inference_detector(model, img)
# visualize the results in a new window
model.show_result(img, result)
# or save the visualization results to image files
model.show_result(img, result, out_file='result.jpg')