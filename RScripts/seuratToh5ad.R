# Load libraries
library(Seurat)
library(SeuratDisk)

# Function to convert seurat object to h5ad
# Input: rds file of seurat object
# Output: h5ad file with name derived from input file
seuratToh5ad <- function(seuratRDS) {
  # Extract the file name without extension
  file_prefix <- tools::file_path_sans_ext(basename(seuratRDS))
  
  # Define output file names
  h5seurat_file <- paste0(file_prefix, ".h5Seurat")
  h5ad_file <- paste0(file_prefix, ".h5ad")
  
  # Check if h5seurat file exists and delete it if it does
  if (file.exists(h5seurat_file)) {
    file.remove(h5seurat_file)
    cat(sprintf("Existing %s file was deleted.\n", h5seurat_file))
  }
  
  # Load the Seurat object
  seurat_obj <- readRDS(seuratRDS)
  
  # Update your Seurat object
  seurat_obj <- UpdateSeuratObject(seurat_obj)
  
  # Save as H5Seurat
  SaveH5Seurat(seurat_obj, filename = h5seurat_file)
  
  # Convert to h5ad
  Convert(h5seurat_file, dest = "h5ad")
  
  cat(sprintf("Conversion to %s completed.\n", h5ad_file))
  
  # Optionally, remove the intermediate h5seurat file
  file.remove(h5seurat_file)
  cat(sprintf("%s file removed.\n", h5seurat_file))
}