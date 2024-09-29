FROM rocker/r-ver:4

# Install system dependencies for Seurat and SeuratDisk
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    wget \
    git \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    libhdf5-dev \
    hdf5-tools \ 
    gfortran \
    libglpk-dev \
    patch \
    && rm -rf /var/lib/apt/lists/*

# Install Seurat and SeuratDisk R packages
RUN R -q -e 'install.packages(c("curl","Seurat", "remotes", "hdf5r"))' \
    && R -q -e 'remotes::install_github("mojaveazure/seurat-disk")'