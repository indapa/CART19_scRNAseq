clinical_query <- GDCquery(project = "TCGA-UCEC", 
                           data.category = "Clinical", 
                           data.type = 'Clinical Supplement',
                          data.format="BCR XML")
GDCdownload(clinical_query)

clinical_data <- GDCprepare_clinic(clinical_query, clinical.info = "patient")
age_data <- clinical_data[, c("bcr_patient_barcode", "age_at_initial_pathologic_diagnosis")]
#write 


methylation_query <- GDCquery(
  project = "TCGA-UCEC",
  data.category = "DNA Methylation",
  platform = "Illumina Human Methylation 450",
  sample.type = "Normal", # Ensure you get normal tissue samples
  barcode = age_data$bcr_patient_barcode  )   # Filter based on specific patient barcodes