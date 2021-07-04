# Adding system packages to the r-session-complete image

FROM rstudio/r-session-complete:bionic-1.4.1717-3

 

# Set versions and platforms

ARG RSP_VERSION=1.2.5019-6

ARG R_VERSION=4.0.2

 

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

RUN ls -la opt/R/

RUN R -version

# Adding R packages to the r-session-complete image

RUN /opt/R/${R_VERSION}/bin/R -e 'install.packages("V8", repos="https://cran.rstudio.com")' && \
    /opt/R/${R_VERSION}/bin/R -e 'install.packages("png", repos="https://cran.rstudio.com")' && \
    /opt/R/${R_VERSION}/bin/R -e 'install.packages("units", repos="https://cran.rstudio.com")' && \
    /opt/R/${R_VERSION}/bin/R -e 'install.packages("leaflet", repos="https://cran.rstudio.com")' && \
    /opt/R/${R_VERSION}/bin/R -e 'install.packages("svglite", repos="https://cran.rstudio.com")' && \
    /opt/R/${R_VERSION}/bin/R -e 'install.packages("rgeos", repos="https://cran.rstudio.com")' && \
    /opt/R/${R_VERSION}/bin/R -e 'install.packages("sf", repos="https://cran.rstudio.com")' && \
    /opt/R/${R_VERSION}/bin/R -e 'install.packages("leafpop", repos="https://cran.rstudio.com")' && \
    /opt/R/${R_VERSION}/bin/R -e 'install.packages("rgdal", repos="https://cran.rstudio.com")' && \
    /opt/R/${R_VERSION}/bin/R -e 'install.packages("leafem", repos="https://cran.rstudio.com")' && \
    /opt/R/${R_VERSION}/bin/R -e 'install.packages("mapview", repos="https://cran.rstudio.com")'
