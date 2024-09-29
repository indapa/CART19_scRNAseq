  # Load libraries
  library(Seurat)
  library(SeuratDisk)

#make function to convert seurat object to h5ad
# Input: rds file of seurat object, h5ad file to save
# Output: h5ad file

seuratToh5ad <- function(seuratRDS){

    gz_file <- gzcon(file("seuratRDS", "rb"))
    rds_object <- readRDS(gz_file)
    close(gz_file)

    # Update your Seurat object
    seurat_obj <- UpdateSeuratObject(seurat_obj)

    SaveH5Seurat(seurat_obj, filename = "seurat_object.h5Seurat")

    Convert("seurat_object.h5Seurat", dest = "h5ad")


}