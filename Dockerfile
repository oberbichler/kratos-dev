FROM ubuntu:bionic

ENV HOME /root

RUN apt-get update -y && apt-get upgrade -y

RUN apt-get install -y \
    build-essential \
    ccache \
    cmake \
    gfortran-7 \
    libblas-dev \
    libboost-dev \
    libeigen3-dev \
    libhdf5-dev \
    libhdf5-openmpi-dev \
    liblapack-dev \
    libmetis-dev \
    libopenmpi-dev \
    libtrilinos-amesos-dev \
    libtrilinos-aztecoo-dev \
    libtrilinos-epetra-dev \
    libtrilinos-epetraext-dev \
    libtrilinos-ifpack-dev \
    libtrilinos-ml-dev \
    libtrilinos-teuchos-dev \
    openmpi-bin \
    python3-dev \
    python3-h5py \
    python3-pip \
    software-properties-common

RUN add-apt-repository ppa:git-core/ppa && apt-get update -y && apt-get install -y git

RUN /usr/sbin/update-ccache-symlinks && echo 'export PATH="/usr/lib/ccache:$PATH"' | tee -a ~/.bashrc

RUN python3 -m pip install --upgrade pip && \
    pip3 install numpy scipy

CMD [ "/bin/bash" ]

WORKDIR $HOME
