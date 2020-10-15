library(tidyr)
library(dplyr)

file_name <- file.choose()

sample_annot <- read.delim(file = file_name, check.names = FALSE, stringsAsFactors = FALSE,  na.strings = "NA", row.name = NULL)

if ("Sample name"%in% colnames(sample_annot)) 

check_factor <- function(a_sample_annot, a_factor){
  if (!a_factor %in% colnames(a_sample_annot)) 
      cat(a_factor,"not present", "\n")
  invisible(a_sample_annot)
}

sample_annot %>% 
  check_factor("Sample name")%>% 
  check_factor("Barcode") %>%
  check_factor("PamChip Location") %>%
  check_factor("Row") %>%
  check_factor("Col") %>%
  check_factor("Array") %>%
  check_factor("Visual QC")
