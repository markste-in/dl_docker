# [dl_docker](https://hub.docker.com/r/sysfail/dl_docker/)
## Purpose
Analysis and handling of automotive data with deep learning frameworks.
It comes with CPU and GPU (Cuda 9) support
## Quick links
- IPython -> https://localhost:8888
- TensorBoard -> https://localhost:6006
- noVNC (Docker GUI via Browser) -> http://localhost:6080/vnc.html
- Terminal:
  - Within IPython: "Files" Tab -> "New" -> "Terminal"
  - Within noVNC: right click on the desktop -> terminal emulator
- SSH (password: 'dl_docker'):
  - ssh root@localhost
## What is this?
Dockerfile with:
  - GUI access via noVNC (Browser)
  - Python
    - python 3.6
    - jupyter notebook
  - Data Science Tools
    - [numpy](https://github.com/numpy/numpy)
    - [pandas](https://pandas.pydata.org/)
    - [seaborn](https://seaborn.pydata.org/)
    - [matplotlib](https://matplotlib.org/)
    - [opencv](https://opencv.org/)
    - others like [scipy](https://github.com/scipy/scipy), [plotutils](https://www.gnu.org/software/plotutils/), [pillow](https://pillow.readthedocs.io/en/5.2.x/),
    sympy etc.
  - Deep Learning Frameworks
    - [Tensorflow + Tensorflow-gpu 1.10](https://github.com/tensorflow/tensorflow)
    - [Keras 2.2](https://keras.io/)
    - other DL utilities like [tflearn](https://github.com/tflearn/tflearn), [gym](https://github.com/openai/gym), [scikit-learn](https://github.com/scikit-learn/scikit-learn), [lucid](https://github.com/tensorflow/lucid) etc.
  - Libs and Tools to tinker with automotive stuff
    - [ptyhon-can](https://github.com/hardbyte/python-can) to handle raw CAN data (blf, asc)
    - [mdfreader](https://github.com/ratal/mdfreader) to hanle mdf logs
    - [asammdf](http://asammdf.readthedocs.io/) to handle mdf and CAN logging
    - [canmatrix](https://github.com/ebroecker/canmatrix) to handle and convert dbc files
    - [can-utils](https://github.com/linux-can/can-utils) userspace utilities for SocketCAN
    - [pyvit](https://github.com/linklayer/pyvit) Framework to easily work with CAN interfaces and SocketCAN
  - Some examples and tutorials for
    - Tensorflow
    - Keras
    - Python data handling
## How to use
### Build yourself
#### CPU ####
1. Make sure you have docker installed
2. run *./dl_docker_cpu/build_docker.sh*
3. run *./dl_docker_cpu/run_docker.sh*
  - it will start *sysfail/dl_docker_cpu*
  - it will link the folder *~/docker/share* (where you should store the files you want to work with)
  - it will expose port 22 (ssh), 8888 (jupyter notebook), 6006 (tensorboard) and port 6080 (noVNC)
  - it will open the a browser tab pointing to https://localhost:88888
4. The docker image can also be accessed via noVNC. A recent browser is necessary (HTML5)
#### GPU ####
1. Make sure you have the [latest! docker](https://docs.docker.com/install/linux/docker-ce/ubuntu/#install-docker-ce-1) installed
2. Install [NVidia Driver](https://www.nvidia.com/object/unix.html)
3. Install [Nvidia-Docker](https://github.com/NVIDIA/nvidia-docker)
4. run *./dl_docker/build_all.sh*
3. run *./dl_docker_gpu/run_docker_gpu.sh*
  - it will start *sysfail/dl_docker_cpu*
  - it will link the folder *~/docker/share* (where you should store the files you want to work with)
  - it will expose port 22 (ssh), 8888 (jupyter notebook), 6006 (tensorboard) and port 6080 (noVNC)
  - it will open the a browser tab pointing to https://localhost:88888
4. The docker image can also be accessed via noVNC. A recent browser is necessary (HTML5)
### Run the pre-build docker
#### CPU ####
1. Make sure you have docker installed
2. run *./dl_docker_cpu/run_docker.sh*
  - it will download *sysfail/dl_docker* from [Docker Hub](https://hub.docker.com/r/sysfail/dl_docker/)
  - rest see above ...
#### GPU ###
1. Make sure you have the [latest! docker](https://docs.docker.com/install/linux/docker-ce/ubuntu/#install-docker-ce-1) installed
2. Install [NVidia Driver](https://www.nvidia.com/object/unix.html) and [Nvidia-Docker](https://github.com/NVIDIA/nvidia-docker)
3. run *./dl_docker_gpu/run_docker_gpu.sh*
  - rest see above ...

### Supported systems
- Ubuntu 16.04 LTS / 18.04.1 LTS (CPU and GPU)
- Mac OS Sierra (10.12.6) and Docker 18.03 (CPU only)
