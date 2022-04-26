<!-- badges: start -->
  [![R-CMD-check](https://github.com/rwu08/opensear/workflows/R-CMD-check/badge.svg)](https://github.com/rwu08/opensear/actions)
<!-- badges: end -->
## Overview 

The OpenSeaR package contains datasets and functions to use in conjunction with the OpenSea API. 

## Installation 

Install development version from GitHub: 

``` r
# If you haven't installed remotes yet, do so:
# install.packages("remotes")
remotes::install_github("rwu08/opensear")
```

## Basic usage

``` r
library(opensear)
#Returns dataset with 85 assets from the collection Mutant Ape Yacht Club. 
View(mayc_assets)

```
