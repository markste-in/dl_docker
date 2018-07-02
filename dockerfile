FROM ubuntu:16.04

MAINTAINER Tommy Markstein <mail@markste.in>

#Set debconf to Noninteractive
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

#(mini)conda
ENV PATH=/opt/conda/bin:${PATH}
ENV PYTHONIOENCODING UTF-8

RUN apt update && \
    apt install -y apt-utils \
    locales


#set locale correct
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN apt update && \
      apt install -y \
      git \
      curl \
      wget \
      bzip2 \
      software-properties-common

#requirements for opencv & gym (q-learning)
RUN   apt update && \
      apt install -y build-essential \
        cmake \
        libgtk2.0-dev \
        pkg-config \
        libavcodec-dev \
        libavformat-dev \
        libswscale-dev\
        libtbb2 \
        libtbb-dev \
        libjpeg-dev \
        libpng-dev \
        libtiff-dev \
        libjasper-dev \
        libdc1394-22-dev \
        python-opengl

#install miniconda
RUN wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -q  && \
    bash Miniconda3-latest-Linux-x86_64.sh -b -p /opt/conda && \
    rm Miniconda3-latest-Linux-x86_64.sh

#create env keras_2_2
RUN conda create --name keras_2_2 python=3.6 && \
    conda clean -tipsy && \
    ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
    echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc

#install python packages (non-DL)
RUN /bin/bash -c "source activate keras_2_2" && \
    pip --no-cache-dir install \
      jupyter \
      bleach==1.5 \
      notebook \
      ipykernel \
      plotutils \
      seaborn \
      numpy \
      matplotlib \
      scipy \
      pandas \
      tqdm \
      pillow \
      Cython \
      opencv-contrib-python \
      ipython-autotime \
      jupyter_contrib_nbextensions && \
    jupyter contrib nbextensions install --system && \
    jupyter nbextension enable execute_time/ExecuteTime && \
    conda install h5py hdf5

#install DL-frameworks and kits
RUN /bin/bash -c "source activate keras_2_2" && \
    pip --no-cache-dir install \
      tensorflow==1.8 \
      keras==2.2 \
      scikit-learn \
      gym \
      tflearn


#to tinker with cars and CAN

#to play with SocketCAN
RUN apt install -y \
      can-utils

RUN /bin/bash -c "source activate keras_2_2" && \
    pip --no-cache-dir install \
      #read and handle mdf files
      mdfreader \
        bitarray \
        mpldatacursor \
      asammdf \
      #tablib needs to be upgraded otherwise asammdf cannot be imported (conflict with local FLAG)
        tablib==0.11.5 \
      #handle raw CAN data (asc, blf)
      python-can \
      #To convert and use dbc files
      canmatrix \
        xlrd \
        xlwt-future \
        XlsxWriter \
        PyYAML \
        lxml \
      #easy framework to play with SocketCAN
        pyvit



#Examples
RUN mkdir -p /docker/examples && \
    cd /docker/examples && \
    #Python Data Science Handbook
    git clone https://github.com/jakevdp/PythonDataScienceHandbook.git && \
    #TensorFlow
    git clone https://github.com/nfmcclure/tensorflow_cookbook.git && \
    git clone https://github.com/Hvass-Labs/TensorFlow-Tutorials.git && \
    git clone https://github.com/aymericdamien/TensorFlow-Examples.git && \
    #Keras Ressources
    git clone https://github.com/fchollet/keras-resources && \
    git clone https://github.com/buomsoo-kim/Easy-deep-learning-with-Keras && \
    git clone https://github.com/leriomaggio/deep-learning-keras-tensorflow.git

COPY StartHere.ipynb /docker/

#clean up
RUN apt clean && \
    apt autoremove


#IPython
EXPOSE 8888
#TensorBoard
EXPOSE 6006

CMD ["/bin/bash","-c","source activate keras_2_2 && jupyter notebook --ip=0.0.0.0 --allow-root --NotebookApp.token='' --no-browser"]
