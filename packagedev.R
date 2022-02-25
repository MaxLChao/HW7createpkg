# packageDev

#usethis::git_vaccinate()
#usethis::use_gpl_license(version = 3, include_future = TRUE)
#usethis::use_package("data.table")
# usethis::use_pipe(export = TRUE)
#usethis::use_package("magrittr")
# usethis::use_package("stringr")
# usethis::use_package("ggplot2")
# usethis::use_package("gridExtra")
# usethis::use_package("ggpubr")

rm(list = ls())
# # Ctrl + Shift + F10
devtools::load_all()
devtools::document()
