# Genomics Data Analysis Learning Environment

## Overview

This repository provides a fully containerized development environment for the Professional Certificate in Data Analysis for Genomics, specifically designed to support the following Harvard Online courses:

### Courses Covered
* **PH525.5x: Introduction to Bioconductor**
* **PH525.6x: Case Studies in Functional Genomics**
* **PH525.7x: Advanced Bioconductor**

## Key Features

- 🧬 **Comprehensive Genomics Development Environment**
- 🐳 **Docker and DevContainer Support**
- 🖥️ **Browser-Accessible RStudio**
- 📚 **Pre-configured Bioconductor and R Libraries**
- 🚀 **Reproducible Research Setup**

## Prerequisites

- Docker
- (Optional) Visual Studio Code
- (Optional) Remote Containers Extension

## Quick Start

<!-- ### Docker Compose Method -->
```bash
docker compose build
docker compose up -d
```
Access RStudio at: `http://localhost:8787`
- **Username**: rstudio
- **Password**: rstudio

<!-- ### VSCode DevContainer Method
1. Open project in VSCode
2. Click "Reopen in Container" when prompted -->

## Current Status

🚧 **Work in Progress**
- Currently configured for **PH525.5x: Introduction to Bioconductor**
- Libraries and setup will expand as the course progresses

## Motivation

Created to streamline the learning experience by:
- Eliminating repetitive library installation
- Providing a consistent development environment
- Reducing setup time between course sections

## Keywords

`genomics` `bioinformatics` `data-science` `r-programming` `bioconductor` `docker` `devcontainer` `RNA-seq` `ChIP-seq` `DNA-methylation` `harvard-online` `genomic-data-analysis`

## Courses Description

### PH525.5x: Introduction to Bioconductor
- Explore genome-scale data analysis
- Learn data structure and annotation
- Master normalization techniques
- Understand data interpretation strategies

### PH525.6x: Case Studies in Functional Genomics
- Practical RNA-Seq analysis
- ChIP-Seq data exploration
- DNA methylation studies
- Open-source software application

### PH525.7x: Advanced Bioconductor
- Advanced genomic visualization
- Reproducible analysis techniques
- Cloud-scale genomic data exploration
- Consortium-generated data handling

## Contributing

Contributions, suggestions, and improvements are welcome! Please open an issue or submit a pull request.

## License

This project is licensed under the [MIT License](./LICENSE).

## Acknowledgments

- Harvard Online
- Bioconductor Project
- Open-source community
