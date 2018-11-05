# -*- coding: utf-8 -*-
import sys
import numpy as np
import tensorflow as tf
import scipy.misc as scm
import math
import json
import os
import xml.etree.ElementTree as ET

type_list = ['person', 'bird', 'cat', 'cow', 'dog', 'horse',
             'sheep', 'aeroplane', 'bicycle', 'boat', 'bus',
             'car', 'motorbike', 'train', 'bottle', 'chair',
             'dining table', 'potted plant', 'sofa', 'tv/monitor']

IMG_MEAN = np.array((104, 116, 122), dtype=np.float32)
imshape = []
labels = ['vechile']
max_object_num = 70

data_path ='/home/cidi/ZSH/dataset/VOC0712/VOCdevkit/VOC2012/'
savepath = 'tfrecord/train.tfrecord'
train_dict_path ='/home/cidi/ZSH/dataset/VOC0712/VOCdevkit/VOC2012/ImageSets/Main/trainval.txt'

# def imshow_bbox(bbox,img,label):
#     if label == 'car':
#         cv2.rectangle(img, (int(bbox[0]), int(bbox[1])), (int(bbox[2]), int(bbox[3])), red_color, 2)
#     elif label == 'truck':
#         cv2.rectangle(img, (int(bbox[0]), int(bbox[1])), (int(bbox[2]), int(bbox[3])), green_color, 2)
#     elif label == 'bus':
#         cv2.rectangle(img, (int(bbox[0]), int(bbox[1])), (int(bbox[2]), int(bbox[3])), blue_color, 2)
#     else:
#         cv2.rectangle(img, (int(bbox[0]), int(bbox[1])), (int(bbox[2]), int(bbox[3])), yellow_color, 2)
#     return img

def read_voc(voc_path, ratio):
    tree = ET.parse(voc_path)
    root = tree.getroot()
    root_lists = []
    labels = []
    bboxes = []

    for child in root:
        root_list = child.tag
        root_lists.append(root_list)

    size = root.find('size')
    img_w = size.find('width').text
    img_h = size.find('height').text
    imShape = [int(img_w), int(img_h)]

    objects = root.findall('object')
    for s in objects:
        name = s.find('name').text
        index = [t+1 for t,type in enumerate(type_list) if name==type]
        bndboxes = s.find('bndbox')
        xmin = float(bndboxes.find('xmin').text)/ratio/imShape[0]
        ymin = float(bndboxes.find('ymin').text)/ratio/imShape[1]
        xmax = float(bndboxes.find('xmax').text)/ratio/imShape[0]
        ymax = float(bndboxes.find('ymax').text)/ratio/imShape[1]
        if((ymax-ymin)<1 or (xmax-xmin)<1):
            continue
        bboxes.append([xmin,ymin,xmax,ymax])
        if not (index.__len__()==0):
            labels.append(index[0])
        # print(name,xmin,ymin,xmax,ymax)
    return labels,bboxes


def view_bar(message, num, total):
    rate = num / total
    rate_num = int(rate * 40)
    rate_nums = math.ceil(rate * 100)
    r = '\r%s:[%s%s]%d%%\t%d/%d' % (message, ">" * rate_num, " " * (40 - rate_num), rate_nums, num, total,)
    sys.stdout.write(r)
    sys.stdout.flush()

if not(os.path.exists('/'.join(savepath.split('/')[:-1]))):
    os.mkdir(os.path.join(sys.path[0],'/'.join(savepath.split('/')[:-1])))

f = open(train_dict_path)
image_ids = f.readlines()
Len = len(image_ids)
writer = tf.python_io.TFRecordWriter(path=savepath)
total_len = len(image_ids)
len=0
for i, image_id in enumerate(image_ids):
    # image_path = os.path.join(data_path+'image/'+image_id.split('\n')[0]+'.jpg')
    # json_path = os.path.join(data_path+'json/'+image_id.split('\n')[0].split('.')[0]+'.json')
    image_path = os.path.join(data_path + 'JPEGImages/' + image_id.split('\n')[0] + '.jpg')
    json_path = os.path.join(data_path + 'Annotations/' + image_id.split('\n')[0].split('.')[0] + '.xml')

    img = scm.imread(image_path)
    imshape = img.shape
    ratio = 1
    # if(img.shape!=imshape):
    #     ratio_h = img.shape[0] / imshape[0]
    #     ratio_w = img.shape[1] / imshape[1]
    #     img = scm.imresize(img,(imshape[0],imshape[1]))
    cls, reg_label = read_voc(json_path, ratio)
    xmin = [d[0] for d in reg_label]
    ymin = [d[1] for d in reg_label]
    xmax = [d[2] for d in reg_label]
    ymax = [d[3] for d in reg_label]
    if(cls.__len__()>0):
        len+=1
        xmins = -np.ones((max_object_num,), np.float32)
        ymins = -np.ones((max_object_num,), np.float32)
        xmaxs = -np.ones((max_object_num,), np.float32)
        ymaxs = -np.ones((max_object_num,), np.float32)
        cls_label = -np.ones((max_object_num,), np.int64)
        xmins[:xmin.__len__()] = xmin
        ymins[:ymin.__len__()] = ymin
        xmaxs[:xmax.__len__()] = xmax
        ymaxs[:ymax.__len__()] = ymax
        cls_label[:cls.__len__()] = cls

        feature = tf.train.Features(feature={
            # maybe do not need encode() in linux
            # 'img_name':  tf.train.Feature(bytes_list=tf.train.BytesList(value=[image_id.encode()])),
            # 'img':       tf.train.Feature(bytes_list=tf.train.BytesList(value=[img.tobytes()])),
            # 'img_shape': tf.train.Feature(bytes_list=tf.train.BytesList(value=[np.array(imshape,np.int32).tobytes()])),
            # 'cls_label': tf.train.Feature(bytes_list=tf.train.BytesList(value=[cls_label.tobytes()])),
            # 'reg_label': tf.train.Feature(bytes_list=tf.train.BytesList(value=[reg_label.tobytes()])),

            'img_name': tf.train.Feature(bytes_list=tf.train.BytesList(value=[image_id.encode()])),
            'img_shape': tf.train.Feature(bytes_list=tf.train.BytesList(value=[np.array(imshape, np.int32).tobytes()])),
            'img': tf.train.Feature(bytes_list=tf.train.BytesList(value=[img.tobytes()])),
            'cls_label': tf.train.Feature(int64_list=tf.train.Int64List(value=cls_label)),
            'xmin': tf.train.Feature(float_list=tf.train.FloatList(value=xmins)),
            'ymin': tf.train.Feature(float_list=tf.train.FloatList(value=ymins)),
            'xmax': tf.train.Feature(float_list=tf.train.FloatList(value=xmaxs)),
            'ymax': tf.train.Feature(float_list=tf.train.FloatList(value=ymaxs))
        })
        example = tf.train.Example(features=feature)
        writer.write(example.SerializeToString())
    view_bar('Conversion progress', i + 1, total_len)
writer.close()
print('\nall have box: '+str(len))
print('\nConversion is complete!')