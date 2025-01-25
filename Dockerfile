FROM bioconductor/bioconductor_docker:RELEASE_3_15

# Install system dependencies that might be needed for package compilation
RUN apt-get update && apt-get install -y \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    procps \
    && rm -rf /var/lib/apt/lists/*

# Change ownership to rstudio user to allow package installations
RUN chown -R rstudio:rstudio /usr/local/lib/R/library

# Switch to rstudio user for package installations
USER rstudio

# Ensure BiocManager is installed
RUN R -e "if (!requireNamespace('BiocManager', quietly = TRUE)) install.packages('BiocManager', repos = 'http://cran.us.r-project.org')"

# Install required Bioconductor packages with increased timeout
RUN R -e "options(timeout = 600); BiocManager::install(c('Biostrings','BSgenome','GenomicRanges','DESeq2','genefilter','geneplotter','COPDSexualDimorphism.data','genefu','gwascat','hgu133a.db','genomicsclass/tissuesGeneExpression','genomicsclass/ERBS','Homo.sapiens','BSgenome.Hsapiens.UCSC.hg19','GenomicFeatures','genomicsclass/ph525x'), ask = FALSE)"

# Install additional CRAN packages
RUN R -e "install.packages(c('tidyverse','dplyr','ggplot2'), repos = 'http://cran.us.r-project.org')"

# Switch back to root for final setup
USER root

# Expose RStudio
EXPOSE 8787

# Set up persistent storage
RUN mkdir -p /home/rstudio/data
WORKDIR /home/rstudio/data

# Create an entrypoint script for dynamic resource allocation
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Use the custom entrypoint
ENTRYPOINT ["/entrypoint.sh"]