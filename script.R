# steps that you might need to do in order to use the rtransparency package
# some of these might be unnecessary, and you might need some others besides this
# these are just things I needed to do in order to get rtransparncy to run for me
install.packages("devtools")
devtools::install_github("quest-bih/oddpub")
devtools::install_github("cran/crminer")
devtools::install_github("serghiou/metareadr")
devtools::install_github("serghiou/rtransparent", build_vignettes = T)
library(dplyr)
library(rtransparent)

# the vignettes let you get an idea for what rtransparency does
# if you download the example article and run the commands, the package will pull transparency-related information out
# of the example article

#Example usage
#only required if pdftotext shows up as missing
Sys.setenv(PATH = paste(old_path, "/usr/local/bin/", sep = ":"))
article <- rt_read_pdf("data/PMID323740764.pdf")
cat(substr(article, start = 1, stop = 200))
write(article, "PMID323740764.txt")
data_code <- rt_data_code("PMID323740764.txt")
glimpse(data_code)
all_indicators <- rt_all("PMID323740764.txt")
glimpse(all_indicators)
data_code <- rt_data_code("PMID323740764.txt")
glimpse(data_code)

#Convert PDF files to txt
files <- list.files(path="/Users/ewood/transparency/data", pattern="*.pdf", full.names=TRUE, recursive=FALSE)
lapply(files, function(file) {
  article_txt <- rt_read_pdf(file)
  cat(substr(article_txt, start = 1, stop = 200))
  file_name <- fs::path_file(file) |>
  tools::file_path_sans_ext() |>
  trimws() |>
  paste(".txt")
  print(file_name)
  file_path <- fs::path_dir(file)
  #print(file_path)
  full_file_path <- paste(file_path, file_name)
  #print(full_file_path)
  write(article, full_file_path)
})

#Read information from txt files
files <- list.files(path="/Users/ewood/transparency/data", pattern="*.txt", full.names=TRUE, recursive=FALSE)
lapply(files, function(x) {
  all_indicators <- rt_all(x)
  glimpse(all_indicators)
})

