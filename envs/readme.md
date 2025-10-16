# Environments

This directory contains Conda environment YAML files used across the Xenium analysis. Each environment supports a specific analysis module.


| File Name           | Language | Purpose                                                                      |
|---------------------|----------|------------------------------------------------------------------------------|
| `sc-scrublet.yaml`  | Python   | Preprocessing with Scrublet for doublet detection                            |
| `sc-spatial.yaml`   | Python   | Base spatial environment used for most analyses including Scanpy             |
| `sc-charter.yaml`   | Python   | Environment for scVI, scANVI, and CellCharter with GPU support               |
| `sc-cv_axis.yaml`   | Python   | Used for modeling and predicting crypt-villus axis                           |
| `R-DE.yaml`         | R        | Differential expression testing using DESeq2                                 |
