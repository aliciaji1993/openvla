FROM nvidia/cuda:12.2.2-cudnn8-devel-ubuntu22.04

# apt
RUN apt-get update -q \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    apt-transport-https \
    curl \
    git \
    software-properties-common \
    net-tools \
    vim \
    virtualenv \
    wget \
    xpra \
    xserver-xorg-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# python
RUN apt-get update -q \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    python3.10-dev python3.10 python3-pip
RUN virtualenv --python=python3.10 env
RUN rm /usr/bin/pip
RUN ln -s /env/bin/python3.10 /usr/bin/python
RUN ln -s /env/bin/pip3.10 /usr/bin/pip
RUN ln -s /env/bin/pytest /usr/bin/pytest

# pytorch
RUN pip install torch==2.2.0 torchvision==0.17.0 \
    --extra-index-url https://download.pytorch.org/whl/cu121 \
    -i https://pypi.tuna.tsinghua.edu.cn/simple

# VPN support
RUN pip install PySocks

# required by OpenVLA
RUN pip install packaging ninja
RUN pip install "flash-attn==2.5.5" --no-build-isolation