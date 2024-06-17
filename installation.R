# steps that you might need to do in order to use the rtransparency package
# some of these might be unnecessary, and you might need some others besides this
# these are just things I needed to do in order to get rtransparncy to run for me
install.packages("devtools")
devtools::install_github("quest-bih/oddpub")
devtools::install_github("cran/crminer")
devtools::install_github("serghiou/metareadr")
devtools::install_github("serghiou/rtransparent", build_vignettes = T)

# the vignettes let you get an idea for what rtransparency does
# if you download the example article and run the commands, the package will pull transparency-related information out
# of the example article

#Example usage
library(rtransparent)
#only required if pdftotext shows up as missing
Sys.setenv(PATH = paste(old_path, "/usr/local/bin/", sep = ":"))
article <- rt_read_pdf("/Users/ewood/Downloads/PMID323740764.pdf")
cat(substr(article, start = 1, stop = 200))
write(article, "PMID323740764.txt")
data_code <- rt_data_code("PMID323740764.txt")
library(dplyr)
glimpse(data_code)
all_indicators <- rt_all("PMID323740764.txt")
glimpse(all_indicators)

#THEORETICAL
files <- list.files(path="/Users/ewood/transparency/data", pattern="*.txt", full.names=TRUE, recursive=FALSE)


