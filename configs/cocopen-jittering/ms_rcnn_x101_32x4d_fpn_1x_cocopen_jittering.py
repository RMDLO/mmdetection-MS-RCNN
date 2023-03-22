# The new config inherits a base config to highlight the necessary modification
_base_ = '../ms_rcnn/ms_rcnn_x101_32x4d_fpn_1x_coco.py'

# We also need to change the num_classes in head to match the dataset's annotation
model = dict(
    roi_head=dict(
        bbox_head=dict(num_classes=3),
        mask_head=dict(num_classes=3)))

# Modify dataset related settings
dataset_type = 'COCODataset'
classes = ('device', 'wire', "background")
data = dict(
    train=dict(
        img_prefix='datasets/cocopen-jittering/train/',
        classes=classes,
        ann_file='datasets/cocopen-jittering/train/train_obj_sem.json'),
    val=dict(
        img_prefix='datasets/cocopen-jittering/val/',
        classes=classes,
        ann_file='datasets/cocopen-jittering/val/val_obj_sem.json'),
    test=dict(
        img_prefix='datasets/cocopen-jittering/val_hard/',
        classes=classes,
        ann_file='datasets/cocopen-jittering/val_hard/val_hard_obj_sem.json'))

# We can use the pre-trained Mask RCNN model to obtain higher performance
# load_from = 'checkpoints/mask_rcnn_r50_caffe_fpn_mstrain-poly_3x_coco_bbox_mAP-0.408__segm_mAP-0.37_20200504_163245-42aa3d00.pth'

# Resuming training
resume_from = 'work_dirs/ms_rcnn_x101_32x4d_fpn_1x_cocopen_jittering/latest.pth'