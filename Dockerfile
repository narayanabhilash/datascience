# Adding system packages to the r-session-complete image
FROM rstudio/r-session-complete:bionic-1.4.1717-3

# Set versions and platforms

ARG RSP_VERSION=1.2.5019-6
ARG R_VERSION=4.0.2

ADD ./rsai_2021.06.08.tar.gz .

# Install additional system packages
RUN apt-get update -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
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

RUN /opt/R/${R_VERSION}/bin/R CMD INSTALL -l  rsai_2021.06.08.tar.gz


