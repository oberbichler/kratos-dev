FROM ubuntu:bionic

ENV HOME /root

ADD mmg-5.4.1 /usr/local

RUN apt-get update -y && apt-get upgrade -y && \
    apt-get -y install \
        gnupg2 \
        software-properties-common \
        wget && \
    wget https://apt.repos.intel.com/intel-gpg-keys/GPG-PUB-KEY-INTEL-SW-PRODUCTS-2019.PUB -P/tmp && \
    apt-key add /tmp/GPG-PUB-KEY-INTEL-SW-PRODUCTS-2019.PUB && \
    rm /tmp/GPG-PUB-KEY-INTEL-SW-PRODUCTS-2019.PUB && \
    echo deb https://apt.repos.intel.com/mkl all main > /etc/apt/sources.list.d/intel-mkl.list && \
    add-apt-repository ppa:git-core/ppa && \
    apt-get -y update && \
    apt-get install -y \
        build-essential \
        ccache \
        cmake \
        gfortran-7 \
        git \
        intel-mkl-2020.0-088 \
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
        gnupg2 \
        software-properties-common \
        wget && \
    apt-get clean

CMD [ "/bin/bash" ]

WORKDIR $HOME
