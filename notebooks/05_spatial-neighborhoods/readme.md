## 05_spatial-neighborhoods

| Notebook | Description |
|----------|-------------|
| `05a_epithelial-zones.ipynb` | Applies CellCharter clustering to epithelial cells to define spatial neighborhoods. Constructs spatial graphs (via Delaunay triangulation), aggregates neighbors, clusters with fixed `k=3`, and visualizes composition and spatial layout. Outputs updated AnnData object with `epithelial_cc_3` annotations. |