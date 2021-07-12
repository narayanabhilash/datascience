# Adding system packages to the r-session-complete image
FROM rstudio/r-session-complete:bionic-1.4.1717-3

# Set versions and platforms

ARG RSP_VERSION=1.2.5019-6
ARG R_VERSION=4.0.2
ADD ./rsai_2021.06.08.tar.gz .
COPY ./keyboard /etc/default/keyboard
RUN ls -la /etc/default/
RUN cat /etc/default/keyboard

# environment variables 
ENV DEBIAN_FRONTEND=noninteractive

# Install additional system packages
RUN apt-get update -y && \
    apt-get install -y \
    cmake \
    build-essential \
    gcc \
    g++ \
    aptitude \ 
    libstdc++6 \
    libc6-dev \
    libpng-dev \
    libgeos-dev \
    libfontconfig1-dev \
    gdal-bin \
    libgdal-dev \
    libproj-dev \
    libv8-dev \
    libudunits2-dev \
    libgeos-dev \
    libcairo2-dev
    
#### Setting up CUDA Toolkit:
#### =======================
#### It is recommended to use the Linux package manager to install the CUDA for the Linux distributions supported under WSL 2. Follow these instructions to install the CUDA Toolkit.
#### First, set up the CUDA network repository. The instructions shown here are for Ubuntu 18.04. See the CUDA Linux Installation Guide for more information on other distributions.
RUN apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub
RUN sh -c 'echo "deb http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64 /" > /etc/apt/sources.list.d/cuda.list'
RUN apt-get update
        
#### Now install CUDA. Note that for WSL 2, you should use the cuda-toolkit-<version> meta-package to avoid installing the NVIDIA driver that is typically bundled with the toolkit. You can also install other components of the toolkit by choosing the right meta-package.
#### Do not choose the cuda, cuda-11-0, or cuda-drivers meta-packages under WSL 2 since these packages will result in an attempt to install the Linux NVIDIA driver under WSL 2.
RUN apt-get install -y cuda-toolkit-11-0
RUN apt-get install -y xserver-xorg-core
#### Installing nvidia-driver:
#### ========================
RUN apt install -y nvidia-driver-460


# Adding R local package to the r-session-complete image
RUN /opt/R/${R_VERSION}/bin/R -e 'install.packages("/rsai_2021.06.08.tar.gz", repos=NULL, type="source")'

# Adding R non-approved packages to the r-session-complete image
RUN /opt/R/${R_VERSION}/bin/R -e 'install.packages("gisadata", repos="https://github.com/kasaai/gisadata")' && \
    /opt/R/${R_VERSION}/bin/R -e 'install.packages("h3jsr", repos="https://github.com/obrl-soil/h3jsr")' && \
    /opt/R/${R_VERSION}/bin/R -e 'install.packages("mlr3forecasting", repos="https://github.com/mlr-org/mlr3temporal")'

# Removed all R packages
    
    
