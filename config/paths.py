# config/paths.py
"""
Path configuration for the TRPV1 Xenium analysis project.

Edit BASE_DIR to the location of local data directory.
"""

from pathlib import Path

# CHANGE THIS to your local data directory
BASE_DIR = Path(PATH/TO/DATA)

# Sample coordinates for peyer's patches, housed within repo
POLYGON_DIR = Path(__file__).parent / "peyers-coordinates"

# Crypt-villus axis reference (Reina-Campos et al., 2025)
REF_CV_AXIS = Path("/path/to/reference_prep_decomposition_model.h5ad") #https://github.com/Goldrathlab/Spatial-TRM-paper