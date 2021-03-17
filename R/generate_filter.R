# create an exclude filter based on a list of peptides

file_name <- file.choose()
name <- paste0("- ",basename(file_name))

pep_table <- read.delim(file_name)
pep_list <- pep_table[[1]]
  
start_txt <- '<?xml version="1.0"?>
<filters>
  <filter>
    <property name="name">NNNN</property>
    <property name="validateAll">true</property>
    <property name="dimensionName">Spot</property>
    <expressions>'

bottom_txt <- '</expressions>
  </filter>
</filters>'

pep_txt <- '      <expression>
        <property name="name">[ID]</property>
        <property name="operatorName">is not equal to</property>
        <property name="value">[PPPP]</property>
      </expression>'

start_txt <- gsub(pattern = "NNNN", replacement= name, x =start_txt)
main_txt  <- unlist(lapply(pep_list, function(p){gsub(pattern = "PPPP", replacement= p, x =pep_txt)}))

total_txt <- c(start_txt, main_txt, bottom_txt)

file_out <- gsub("\\.txt", "\\.xml", file_name)
writeLines(total_txt, con = file_out)

