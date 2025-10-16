library(tidyverse)
library(zellkonverter)
library(scater)
library(scran)
library(scuttle)
library(SingleCellExperiment)

theme_custom <- function(base_size = 12){ 
  theme_bw(base_size = base_size) %+replace%
    theme(
      panel.grid = element_blank(), 
      strip.background = element_rect(fill = "#F2F2F2", colour = NA)
    )
}
theme_set(theme_custom())
options(repr.plot.width = 8, repr.plot.height = 5, repr.plot.res = 250)

########################################################################

# Paths

repo_root <- normalizePath(file.path(getwd(), ".."))

cmd <- paste0(
  "PYTHONPATH=", repo_root,
  " python3 -c 'import sys; from pathlib import Path; sys.path.append(str(Path.cwd().resolve().parents[1])); ",
  "from config.paths import BASE_DIR; print(BASE_DIR)'"
)

base_dir <- system(cmd, intern = TRUE)
cat("Detected BASE_DIR:", base_dir, "\n")

# working directories
input_dir <- file.path(base_dir, "R", "cv_axis", "IEC")
output_dir <- file.path(input_dir, "log1p", "cv_plots")

if (!dir.exists(output_dir)) dir.create(output_dir, recursive = TRUE)

setwd(file.path(base_dir, "R", "cv_axis", "IEC"))
sce <- readH5AD('iec-subset-resolvi-cc-v2.h5ad')
setwd(file.path(base_dir, "R", "cv_axis", "IEC", "log1p"))

########################################################################

# Functions

create_df_single <- function(gene, sce) {
  df <- data.frame(
    "Group" = retrieveCellInfo(sce, exprs_values = "X", by = "group")$value,
    "Subtype" = retrieveCellInfo(sce, exprs_values = "X", by = "cell_type")$value,
    "Axis_value" = retrieveCellInfo(sce, exprs_values = "X", by = "crypt_villus_axis_scaled")$value,
    "Expression" = retrieveCellInfo(sce, exprs_values = "X", by = gene)$value,
    "Gene" = gene
  )
  return(df)
}

# define colors
group_colors <- c(
  "Control" = "black",
  "Trpv1-cre" = "#E15759"
)

# Plot and save function
plot_gene <- function(df, gene, output_path) {
  p <- ggplot(df, aes(x = Axis_value, y = Expression, color = Group)) +
    geom_smooth(se = FALSE, linewidth = 1.2) +
    scale_x_continuous(
      breaks = c(0, 1),
      labels = c("Bottom", "Top"),
      limits = c(0, 1)
    ) +
    scale_color_manual(
      values = group_colors,
      labels = c("Control" = "hM3Dq", "Trpv1-cre" = expression(TRPV1^hM3Dq))
    ) +
    theme(
      axis.title = element_blank(),
      axis.text.y = element_text(size = 12),
      axis.text.x = element_text(size = 12),
      legend.title = element_blank(),
      legend.text = element_text(size = 12),
      strip.text = element_blank(),
      plot.title = element_text(hjust = 0.5, size = 16)
    ) +
    ggtitle(gene)
  
  ggsave(filename = file.path(output_path, paste0(gene, "_mean.pdf")),
         plot = p, width = 6, height = 4)
}

########################################################################

# Create plots

# Specify gene list
gene_list <- c("Epcam", "Mki67", "Cdc20", "Stmn1", "Dll1", "Il13ra1", # Figure 3
               "Il4ra", "Egr1", "Lgr5", "Olfm4", "Ramp1", "Calcrl") # Extended Figure 8

for (g in gene_list) {
  message("Plotting: ", g)
  df <- create_df_single(g, sce)
  
  # Skip if all expression is 0 or NA
  if (all(is.na(df$Expression)) || all(df$Expression == 0, na.rm = TRUE)) {
    message("Skipping gene (no expression): ", g)
    next
  }
  
  plot_gene(df, g, output_dir)
}