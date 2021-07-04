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

RUN /opt/R/${R_VERSION}/bin/R -e 'install.packages("/rsai_2021.06.08.tar.gz", repos=NULL, type="source")'

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

RUN /opt/R/${R_VERSION}/bin/R -e 'install.packages("gisadata", repos="https://github.com/kasaai/gisadata")' && \
    /opt/R/${R_VERSION}/bin/R -e 'install.packages("h3jsr", repos="https://github.com/obrl-soil/h3jsr")' && \
    /opt/R/${R_VERSION}/bin/R -e 'install.packages("mlr3forecasting", repos="https://github.com/mlr-org/mlr3temporal")' && \
    /opt/R/${R_VERSION}/bin/R -e 'install.packages("mlr3forecasting", repos="https://cran.rstudio.com")' && \
    /opt/R/${R_VERSION}/bin/R -e 'install.packages("data.table", repos="https://cran.rstudio.com")' && \
    /opt/R/${R_VERSION}/bin/R -e 'install.packages("dplyr", repos="https://cran.rstudio.com")' && \
    /opt/R/${R_VERSION}/bin/R -e 'install.packages("DT", repos="https://cran.rstudio.com")' && \
    /opt/R/${R_VERSION}/bin/R -e 'install.packages("Formula", repos="https://cran.rstudio.com")' && \
    /opt/R/${R_VERSION}/bin/R -e 'install.packages("gbm", repos="https://cran.rstudio.com")' && \
    /opt/R/${R_VERSION}/bin/R -e 'install.packages("ggplot2", repos="https://cran.rstudio.com")' && \
    /opt/R/${R_VERSION}/bin/R -e 'install.packages("glmnet", repos="https://cran.rstudio.com")' && \
    /opt/R/${R_VERSION}/bin/R -e 'install.packages("gtools", repos="https://cran.rstudio.com")' && \
    /opt/R/${R_VERSION}/bin/R -e 'install.packages("Hmisc", repos="https://cran.rstudio.com")' && \
    /opt/R/${R_VERSION}/bin/R -e 'install.packages("lattice", repos="https://cran.rstudio.com")' && \
    /opt/R/${R_VERSION}/bin/R -e 'install.packages("leaflet", repos="https://cran.rstudio.com")' && \
    /opt/R/${R_VERSION}/bin/R -e 'install.packages("magrittr", repos="https://cran.rstudio.com")' && \
    /opt/R/${R_VERSION}/bin/R -e 'install.packages("Matrix", repos="https://cran.rstudio.com")' && \
    /opt/R/${R_VERSION}/bin/R -e 'install.packages("miniCRAN", repos="https://cran.rstudio.com")' && \
    /opt/R/${R_VERSION}/bin/R -e 'install.packages("nlme", repos="https://cran.rstudio.com")' && \
    /opt/R/${R_VERSION}/bin/R -e 'install.packages("plotly", repos="https://cran.rstudio.com")' && \
    /opt/R/${R_VERSION}/bin/R -e 'install.packages("R.methodsS3", repos="https://cran.rstudio.com")' && \
    /opt/R/${R_VERSION}/bin/R -e 'install.packages("R.oo", repos="https://cran.rstudio.com")' && \
    /opt/R/${R_VERSION}/bin/R -e 'install.packages("R.utils", repos="https://cran.rstudio.com")' && \
    /opt/R/${R_VERSION}/bin/R -e 'install.packages("rgdal", repos="https://cran.rstudio.com")' && \
    /opt/R/${R_VERSION}/bin/R -e 'install.packages("rgeos", repos="https://cran.rstudio.com")' && \
    /opt/R/${R_VERSION}/bin/R -e 'install.packages("rmarkdown", repos="https://cran.rstudio.com")' && \
    /opt/R/${R_VERSION}/bin/R -e 'install.packages("rpart", repos="https://cran.rstudio.com")' && \
    /opt/R/${R_VERSION}/bin/R -e 'install.packages("shiny", repos="https://cran.rstudio.com")' && \
    /opt/R/${R_VERSION}/bin/R -e 'install.packages("sp", repos="https://cran.rstudio.com")' && \
    /opt/R/${R_VERSION}/bin/R -e 'install.packages("spatstat.data", repos="https://cran.rstudio.com")' && \
    /opt/R/${R_VERSION}/bin/R -e 'install.packages("spatstat", repos="https://cran.rstudio.com")' && \
    /opt/R/${R_VERSION}/bin/R -e 'install.packages("survival", repos="https://cran.rstudio.com")' && \
    /opt/R/${R_VERSION}/bin/R -e 'install.packages("xgboost", repos="https://cran.rstudio.com")'
    
