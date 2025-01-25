# Use the Bioconductor Docker as your base
FROM bioconductor/bioconductor_docker:RELEASE_3_15

################################################
# Install system dependencies (as root)
################################################
USER root
RUN apt-get update && apt-get install -y \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    procps \
 && rm -rf /var/lib/apt/lists/*

################################################
# Install extra R or Bioconductor packages
################################################
RUN R -e "install.packages(c('tidyverse','dplyr','ggplot2'), repos='http://cran.us.r-project.org')"
RUN R -e "options(timeout=Inf); BiocManager::install(c( \
    'Biostrings', \
    'BSgenome', \
    'GenomicRanges', \
    'DESeq2', \
    'genefilter', \
    'geneplotter', \
    'COPDSexualDimorphism.data', \
    'genefu', \
    'gwascat', \
    'hgu133a.db', \
    'genomicsclass/tissuesGeneExpression', \
    'genomicsclass/ERBS', \
    'Homo.sapiens', \
    'BSgenome.Hsapiens.UCSC.hg19', \
    'GenomicFeatures', \
    'genomicsclass/ph525x'), ask=FALSE)"

################################################
# Copy our custom s6 "cont-init" script
################################################
# This script will run automatically at container startup (as root)
# before dropping down to 'rstudio' user.
COPY custom_resources.sh /etc/cont-init.d/custom_resources.sh
RUN chmod +x /etc/cont-init.d/custom_resources.sh