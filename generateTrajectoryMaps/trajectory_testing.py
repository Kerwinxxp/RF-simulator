import pandas as pd
import numpy as np
import cv2
import os

dataset_num = 1

target_region = pd.read_csv('dataset{}/target_region.csv'.format(dataset_num), header=None)
unique_lat = {v: index for index, v in enumerate(np.sort(np.unique(target_region[0])))}
unique_lon = {v: index for index, v in enumerate(np.sort(np.unique(target_region[1])))}
target_region_img = np.zeros((256, 256))
for k in range(target_region[0].shape[0]):
    if target_region.iloc[k][2] != 0:
        target_region_img[unique_lat[target_region.iloc[k][0]], unique_lon[target_region.iloc[k][1]]] = 50
for i in range(100):
    environment = target_region_img.copy()
    trajectory = pd.read_csv('dataset{}/trajectory_{}.csv'.format(dataset_num, i+1), header=None)
    for k in range(len(trajectory)):
        lat, long = trajectory.iloc[k]
        environment[unique_lat[lat], unique_lon[long]] = 255
    cv2.imshow('frame', environment.astype(np.uint8))
    cv2.waitKey(0)