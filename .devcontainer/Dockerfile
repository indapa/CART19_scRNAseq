FROM rocker/r-ver:4

# Install system dependencies for Seurat and SeuratDisk
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    wget \
    git \
    libcurl4-openssl-dev \
    wget \
    git \
    libssl-dev \
    libxml2-dev \
    libhdf5-dev \
    hdf5-tools \ 
    gfortran \
    libglpk-dev \
    patch \
    python3 \
    python3-pip \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

# Install Seurat and SeuratDisk R packages
RUN R -q -e 'install.packages(c("curl","Seurat", "remotes", "hdf5r"))' \
    && R -q -e 'remotes::install_github("mojaveazure/seurat-disk")' \
    && R -e "install.packages('BiocManager', repos='https://cloud.r-project.org/')" \
    && R -e "BiocManager::install('TCGAbiolinks')"

RUN python3 -m pip install --no-cache-dir --upgrade pip \
    && python3 -m pip install --no-cache-dir jupyter 

RUN pip install --no-cache-dir scrublet

RUN pip install --upgrade  'cellxgene_census[experimental]' scvi-tools
