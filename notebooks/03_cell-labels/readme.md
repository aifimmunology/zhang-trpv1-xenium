# 03_cell-labels: Cell Labels

This folder contains a sequential workflow for generating and refining cell type annotations in Xenium spatial transcriptomic data. It combines iterative clustering, semi-supervised label transfer (scANVI), and manual review.


## Notebooks

| Notebook                        | Description |
|---------------------------------|-------------|
| `03a_clustering.ipynb`          | Refines clustering using `X_scVI`; groups samples; subclusters selected epithelial and stromal populations for increased resolution; adds `subcluster_mapping`. |
| `03b_scanvi-labels.ipynb`       | Trains scANVI on labeled reference (Reina-Campos et al., 2025); transfers annotations (`scanvi_labels_xenium`); exports labeled object. |
| `03c_refine-annotations.ipynb`  | Using scANVI labels as a starting point, used clustering and markers to refine annotations; integrates `subcluster_mapping` into `cell_type`; validates results by visualizing populations mapped in space to tissue compartments. |
---
