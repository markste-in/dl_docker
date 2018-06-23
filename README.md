# dl_docker
## Purpose
Analysis and handling of automotive data with deep learning frameworks. So far without GPU support since it is made to be used on laptops without dedicated Nvidia GPU. (For people who work on the move)
## What is this?
Dockerfile with:
  - Python
    - python 3.6
    - jupyter notebook
  - Data Science Tools
    - numpy
    - pandas
    - seaborn
    - matplotlib
    - opencv
  - Deep Learning Frameworks
    - Tensorflow 1.8
    - Keras 2.2
  - Libs to tinker with automotive stuff
    - ptyhon-can
    - mdfreader
  - Some examples and tutorials for
    - Tensorflow
    - Keras
    - Python data handling
## How to use
### Build yourself
1. Make sure you have docker installed
2. run *build_docker.sh*
3. run *run_docker.sh*
  - it will start *sysfail/dl_docker*
  - it will link the folder *~/docker/share* (where you should store the files you want to work with)
  - it will expose port 8888 (jupyter notebook) and 6006 (tensorboard)
  - it will open the a browser tab pointing to http://localhost:88888
### Run the pre-build docker
1. Make sure you have docker installed
2. run *run_docker.sh*
  - it will download *sysfail/dl_docker* from docker hub
  - rest see above ...
| Be aware that due to convenience the jupyter is running without a password or token! |
### Supported systems 
Tested on:
- Ubuntu 16.04 LTS and Docker 18.05
- Mac OS Sierra (10.12.6) and Docker 18.03
