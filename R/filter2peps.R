library(xml2)

file_name <- file.choose()
filters <- xml2::read_xml(file_name)

child <- xml_children(xml_children(xml_children(xml_children(filters))))

peptide_names <- xml_text(xml_find_all(child, "//property[@name='value']"))

peptide_names <- gsub("\\[|\\]","", peptide_names)

writeLines(peptide_names, con=file.path(dirname(file_name),"peptide_names.txt"))
