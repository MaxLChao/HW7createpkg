This is the package.

To Download: 
```
if (!require("devtools")) {
  install.packages("devtools")
}
devtools::install_github("MaxLChao/HW7createpkg",build_vignettes = TRUE)
```

To view the HTML output of the vignette:
```
library("HW7createpkg")
browseVignettes(package="HW7createpkg")
```
The output should pop up on your html browser. 
