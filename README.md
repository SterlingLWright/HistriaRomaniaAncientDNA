# "Ancient DNA and paleoproteomic analysis on Roman Imperial-era individuals from Histria, Romania"

## Overview

This repository contains the datasets, analysis scripts, and results associated with the article:  
**[Ancient DNA and paleoproteomic analysis on Roman Imperial-era individuals from Histria, Romania](https://www.sciencedirect.com/science/article/pii/S2352409X2400138X?casa_token=xE9Kw4ZfSV4AAAAA:kO4CBbiqg6tGFEJypx9NifeLnM3LGHahkmJeHsktSvu1qtWSVllDMnJXfR0Ol4JlddMvF7JIRIs)**

### Citation  
If you use this dataset or scripts, please cite the article:  
Wright, S. L. et al. Ancient DNA and paleoproteomic analysis on Roman Imperial-era individuals from Histria, Romania. Journal of Archaeological Science: Reports 56, 104510 (2024).

*. [DOI](https://doi.org/10.1016/j.dib.2024.108735)

## Repository Structure

- **`results/`** – Contains processed data, summary statistics, and visualizations used in the publication.
- **`scripts/`** – R and Python scripts used for analysis, including data processing, statistical tests, and visualization.
- **`README.md`** – Overview of the repository and how to use the files.

## Data Description  

The dataset includes oral microbiome sequencing data for individuals who were buried in present-day Romania.  
Details on sample collection, processing, and sequencing methods are available in the article.

## How to Use the Scripts  

### Requirements  
Ensure you have the following dependencies installed before running the scripts:

- R (version ≥ 4.0)
- Python (version ≥ 3.8)
- Required R packages: `phyloseq`, `vegan`, `ggplot2`, `DESeq2`, `qiime2R`, `compositions`
- Required Python packages: `pandas`, `numpy`, `scikit-learn`, `seaborn`

### Data availability
The proteomic data are publicly available on MassIVE (accession no. MSV000093976) and Zenodo (https://doi.org/10.5281/zenodo.10551784).
The raw sequencing data can be found on NCBI SRA database under the project PRJNA70418. 
