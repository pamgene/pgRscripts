# Handy scripts


The two main folders
 * bin
 * R
 
The bin folder allows users to launch script command line (without R studio)

The R folder contains the following R scripts.

| name                       |  R script
| ----------------           | --- 
| check annotation           | `checkannot.R`
| collect annotation         | `collectannot.R`
| extract peptides           | `filter2peps.R`
| create a filter            | `generate_filter.R`
| generate kinase score plot | `generate_score_plot.R`
| rename images              | `rename_images.R`


## rename images

It uses a rename pattern file (see test/rename_pattern.txt).
The file defines a regexp pattern to find and replace text in the filesnames.
