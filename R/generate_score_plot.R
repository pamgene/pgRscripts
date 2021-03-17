  file_path <- file.choose()
  kin_table   <- read.delim(file = file_path, stringsAsFactors = FALSE, check.names = FALSE)
  col_names <- colnames(kin_table)
  
  if (("Kinase Name" %in% col_names) && 
      ("Median Final score" %in% col_names) &&
      ("Mean Kinase Statistic" %in% col_names)) {
    
    suppressWarnings(library(ggplot2))
    
    kin_table   <- data.frame(Rank = 1:nrow(kin_table), kin_table["Kinase Name"], kin_table["Median Final score"], kin_table["Mean Kinase Statistic"], kin_table["Mean Specificity Score"],check.names = FALSE)
    kin_table   <- kin_table[1:20,]
    
    kin_table$clrScore = kin_table$`Mean Specificity Score`
    kin_table$clrScore[kin_table$clrScore > 2] = 2
    kin_table$clrScore = 0.5 * kin_table$clrScore
    
    
    sp = ggplot(data = kin_table) 
    sp = sp + geom_bar(aes(x = reorder(`Kinase Name`, -`Rank`), y = `Mean Kinase Statistic`, fill =  `clrScore`), stat = "identity")
    
    sp = sp + scale_fill_gradientn(name = "Mean Specificity Score", space = "Lab", 
                                   colours = c("black", "white", "red"), 
                                   values = c(0,0.65, 1),
                                   breaks = c(0,0.65, 1),
                                   limits = c(0,1),
                                   labels = c(0,0.65, 1)*2)
    
    sp = sp + xlab("Kinase Top List") + ylab("Mean Kinase Statistic")
    sp = sp + coord_flip()
    sp = sp + theme(axis.text.y = element_text(size = 10))
    
    plot(sp)
}
