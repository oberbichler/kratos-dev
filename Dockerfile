FROM ubuntu:bionic

ENV HOME /root

ADD mmg-5.4.1 /usr/local

RUN apt-get update -y && apt-get upgrade -y && \
    apt-get -y install \
        software-properties-common \
        wget && \
    apt-get install -y \
        build-essential \
        ccache \
        cmake \
        gfortran-7 \
        git \
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
        python3-pip && \
    /usr/sbin/update-ccache-symlinks && \
    echo 'export PATH="/usr/lib/ccache:$PATH"' | tee -a ~/.bashrc && \
    python3 -m pip install --upgrade pip && \
    pip3 install \
        numpy \
        scipy && \
    apt-get -y remove \
        software-properties-common \
        wget && \
    apt-get clean

CMD [ "/bin/bash" ]

WORKDIR $HOME
