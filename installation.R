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