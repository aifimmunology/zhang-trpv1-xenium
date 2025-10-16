# Zhang et al., 2025 - Xenium Spatial Transcriptomics

In this repository, we provide the code used for the processing, analysis, and visualization of Xenium spatial transcriptomics data associated with the 2025 manuscript: *“A neuronal-epithelial circuit promotes sensory convergence and intestinal immunity.”* The spatial transcriptomics component of this work was performed in collaboration between the **David Artis Laboratory** (Weill Cornell Medicine) and the **Allen Institute for Immunology**.

---

## Data Availability

Raw and processed spatial transcriptomics data are available at the Gene Expression Omnibus (GEO) under accession number: **[GEO accession here once available]**.  

---

## Notebooks
[Link](./notebooks)

This directory contains the primary Jupyter notebooks and scripts used in the analysis pipeline. Each folder contains notebooks that are numbered in the order they were run (e.g. `01a_`, `01b_`). Each step builds on outputs from the previous stage.

Before running the code, adjust file and directory paths in [`config/paths.py`](./config/paths.py) to match computing environment. 

| Subdirectory             | Description                                                                                   |
|--------------------------|-----------------------------------------------------------------------------------------------|
| `01_pre-processing`      | Scripts for initial data handling: removing Peyer's patches, QC, and doublet detection      |
| `02_integration`         | Construction of a shared latent space across samples using scVI                             |
| `03_cell-labels`         | Clustering and iterative annotation of cell types                                            |
| `04_spatial-axes`        | Modeling and prediction of spatial crypt-villus axis scores in intestinal tissue            |
| `05_spatial-neighborhoods` | Spatial neighborhood analysis using CellCharter for epithelial and immune subsets          |
| `06_statistical-testing` | Differential expression analysis and related statistical workflows                          |
| `07_figures`             | Data visualization for manuscript figures                          |

---

## Computing environments
[Link](./envs)

This directory contains environment specifications used for reproducible analyses. Each file defines the dependencies required for a particular stage of the workflow in the form of a pinned conda environment. This information is directly linked at the notebook-level.

---

#### Code development

Code developed and maintained by [@mncowan](https://github.com/mncowan).  

Selected analyses adapted from cited external sources:
- Reina-Campos, Miguel, *et al.* “Tissue-resident memory CD8 T cell diversity is spatiotemporally imprinted.” *Nature* **639**, 483–492 (2025).  
- [Goldrath Lab — Spatial TRM Paper Repository](https://github.com/Goldrathlab/Spatial-TRM-paper)