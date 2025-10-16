# 04_spatial-axes

Pipeline for modeling spatial organization of Xenium transcriptomic data along the crypt-villus axis (CVA), adapted from Reina-Campos et al., Nature, 2025 methodology.


| Notebook                         | Description |
|----------------------------------|-------------|
| `04a_prepare-data_1.ipynb`       | Prepares Xenium and reference datasets for modeling by performing normalization, panel matching, and class annotation. Aligns shared genes and formats data for downstream topic modeling. |
| `04b_spatial-decomposition.ipynb` | Performs neighborhood-based topic modeling using non-negative matrix factorization (NMF) on epithelial and stromal cells. Assigns topic proportions to all cells and visualizes spatial topic distributions. |
| `04c_define-cv-axis.ipynb`       | Trains a neural network regression model on reference data to predict each cell’s position along the crypt-villus axis. Applies model to query samples and stores CVA predictions. |
| `04d_transfer-cva-scores.ipynb`  | Merges CVA scores from the reduced gene panel dataset back into the full-resolution Xenium dataset, enabling further downstream analysis using full gene expression. |
| `04e_prepare-data_2.ipynb`       | Finalizes CVA annotations for analysis. Applies scaling, creates epithelial subset object, and visualizes spatial CVA patterns using custom colormaps. |