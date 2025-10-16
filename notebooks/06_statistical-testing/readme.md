## 06_statistical-testing

The notebooks in this folder perform statistical analyses of gene expression patterns along the crypt-villus axis and between experimental groups. 

| Notebook | Description |
|----------|-------------|
| `06a_prepare-deseq2-data-epithelial.ipynb` | Generates pseudobulk count and metadata files for DESeq2 using the epithelial cell subset. Aggregates raw counts by CellCharter-defined zones (Stem/Progenitor, Early, Late).|
| `06b_deseq2-epithelial.ipynb` | Runs DESeq2 separately for each epithelial zone to identify differentially expressed genes between Control and Trpv1-cre groups. |
| `06c_cv-axis-statistics-epithelial.ipynb` | Performs two global statistical analyses across the crypt-villus axis: a Kolmogorov–Smirnov (KS) test for overall expression shifts, and a delta AUC analysis to quantify spatial redistribution. Results are merged and exported. |