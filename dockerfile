FROM ubuntu:16.04

MAINTAINER Tommy Markstein <mail@markste.in>

RUN apt update && \
    apt install -y apt-utils

RUN apt update && \
      apt install -y \
      git \
      curl \
      wget \
      bzip2


ENV PATH=/opt/conda/bin:${PATH}

RUN wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -q  && \
    bash Miniconda3-latest-Linux-x86_64.sh -b -p /opt/conda && \
    rm Miniconda3-latest-Linux-x86_64.sh



RUN conda create --name py36 python=3.6 && \
    conda clean -tipsy && \
    ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
    echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc && \
    echo "conda activate py36" >> ~/.bashrc

RUN /bin/bash -c "source activate py36" && \
    pip --no-cache-dir install \
      ipykernel \
      jupyter \
      bleach==1.5 \
      notebook \
      tensorflow==1.8 \
      keras==2.2 \
      matplotlib \
      h5py \
      pandas \
      scikit-learn \
      plotutils \
      seaborn \
      numpy \
      scipy \
      gym \
      opencv-python \
      tflearn \
      tqdm \
      ipython-autotime \
      jupyter_contrib_nbextensions && \
    jupyter contrib nbextensions install --systemv && \
    conda install h5py && \
    conda install -c conda-forge opencv


RUN apt clean && \
    apt autoremove



#IPython
EXPOSE 8888
#TensorBoard
EXPOSE 6006

CMD ["/bin/bash","-c","source activate py36 && jupyter notebook --ip=0.0.0.0 --allow-root --NotebookApp.token='' --no-browser"]
