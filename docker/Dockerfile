# ----------------------------------------------------#
# Ubuntu 22.04 including Python 3.10
# PyTorch 2.0.0 (with cherry pick https://github.com/pytorch/pytorch/pull/97838)
# NVIDIA CUDA® 12.1.1
# NVIDIA cuBLAS 12.1.3.1
# NVIDIA cuDNN 8.9.1.23
# NVIDIA NCCL 2.18.1
# NVIDIA RAPIDS™ 23.04
# Apex
# rdma-core 36.0
# NVIDIA HPC-X 2.14
# OpenMPI 4.1.4+
# GDRCopy 2.3
# TensorBoard 2.9.0
# Nsight Compute 2023.1.1.4
# Nsight Systems 2023.2.1.89
# NVIDIA TensorRT™ 8.6.1.2
# Torch-TensorRT 1.4.0.dev0
# NVIDIA DALI® 1.25.0
# MAGMA 2.6.2
# JupyterLab 2.3.2 including Jupyter-TensorBoard
# TransformerEngine 0.8
# PyTorch quantization wheel 2.1.2
# ----------------------------------------------------#
FROM nvcr.io/nvidia/pytorch:23.05-py3

# ----------------------------------------------------#
# Install Linux Packages
# ----------------------------------------------------#
RUN apt update -y \
    && apt install -y \
    curl \
    vim \
    build-essential \
    pkg-config \
    unzip \
    wget \
    git \
    git-lfs \
    zip \
    less \
    ffmpeg \
    libsm6 \
    libxext6 \
    ninja-build \
    libglib2.0-0 \
    libsm6 \
    libxrender-dev \
    libxext6 \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*

# ----------------------------------------------------#
# Install Python Packages
# ----------------------------------------------------#
RUN pip install --upgrade pip
RUN pip install -U setuptools
RUN pip --no-cache-dir install \
    notebook \
    seaborn \
    attrdict \
    natsort \
    hydra-core \
    kornia \
    wandb \
    optuna \
    onnxruntime-gpu \
    opencv-python==4.7.0.72 \
    opencv-python-headless==4.7.0.72 \
    pre-commit \
    openmim \
    && python -m ipykernel.kernelspec

# Force albumentations not to update opencv
RUN pip install -U albumentations --no-binary qudida,albumentations

RUN mim install mmengine==0.9.0 "mmcv==2.0.1" "mmdet==3.2.0" "mmsegmentation==1.2.0" "mmdet3d==1.3.0" "mmpose==1.2.0" "mmpretrain==1.1.0"

# ----------------------------------------------------#
# Create non root user
# ----------------------------------------------------#
ARG USERNAME=developer
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Create the user
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    # Add sudo support.
    && usermod -aG sudo $USERNAME \
    && apt update \
    && apt install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

# Jupyter
EXPOSE 8888

# Switch to created user
USER $USERNAME

# Set container root path to workspace
WORKDIR /home/$USERNAME/workspace
