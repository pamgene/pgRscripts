library(tidyr)
library(dplyr)

read_dataframes <- function(txt){
  read.delim(text = txt, check.names = FALSE, stringsAsFactors = FALSE,  na.strings = "NA")
}

read_col <- function(a_df, col){
  return(a_df[[col]])
}

# remove trailing tabs
remove_trailing_tabs <- function (a_txtfile){
  fix_file <- gsub(pattern = "\t$", replacement="", x= a_txtfile)
}

# remove NA
rename_na <- function (a_txtfile){
  fix_txt <- gsub(pattern = "\tNa", replacement="\tNA", x= a_txtfile)
  # fix_txt <- gsub(pattern = "\tna", replacement="\tNA", x= fix_txt)
  # fix_txt <- gsub(pattern = "\tNa$|\tna$", replacement="\tNA$", x= fix_txt)
  }


# fpath <- file.path("P:","190-000 Customer support data","190-078 Helsinki FI","Vadim","Raw data","Invadome Cells")
# file.exists(fpath)

fpath <- choose.dir()

sample_files <- list.files(fpath, pattern= ".+Sample .+\\.txt", recursive = TRUE, full.names = TRUE)

sample_text <- lapply(sample_files, readLines)
sample_text <- lapply(sample_text, remove_trailing_tabs)
sample_text <- lapply(sample_text, rename_na)
sample_annot <- lapply(sample_text, read_dataframes)

# class_names <- lapply(sample_annot, lapply, class)
# 
values <- lapply(sample_annot, read_col, "Barcode")

sample_annot_combined <- sample_annot %>% bind_rows

out_file <- file.path(fpath,"sample_annot_combined.txt")
write.table(x= sample_annot_combined, file = out_file, sep="\t", row.names = FALSE, quote = FALSE)




           