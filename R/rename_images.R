library(fs)


rename_pattern <- read.delim2(file.choose(), header =FALSE, stringsAsFactors = FALSE) 
# see the test folder for an example rename_pattern.txt

images_folder  <- choose.dir()
in_images_long <- list.files(images_folder, pattern= "\\.tif", recursive = TRUE, full.names = TRUE)
in_images_short<- list.files(images_folder, pattern= "\\.tif", recursive = TRUE)

rename_images <- function (an_image_name, rename_pattern){ 
  idx         <- unlist(lapply(rename_pattern[[1]], grepl, an_image_name))
  pattern_txt <- rename_pattern[[1]][idx]
  replace_txt <- rename_pattern[[2]][idx]
  cat("name= ", an_image_name, " in= ", pattern_txt, " out= ",replace_txt, "\n")
  gsub(pattern = pattern_txt , replacement = replace_txt, x = an_image_name)
}

out_images_short <- unlist(lapply(in_images_short, rename_images, rename_pattern))
# out_images_long <- unlist(lapply(in_images_long, rename_images, rename_pattern))

out_dir_name <- paste0(images_folder, "-", Sys.Date())
fs::dir_create(paste0(images_folder, "-", Sys.Date()))

out_images_long <- path(out_dir_name, out_images_short)

fs::file_copy(in_images_long, out_images_long)
