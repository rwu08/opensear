
<!-- README.md is generated from README.Rmd. Please edit that file -->

# openseaR <img src="man/figures/logo.png" align="right" height="139" />

<!-- badges: start -->

[![R-CMD-check](https://github.com/rwu08/opensear/workflows/R-CMD-check/badge.svg)](https://github.com/rwu08/opensear/actions)
<!-- badges: end -->

## Overview

The OpenSeaR package contains datasets and functions to use in
conjunction with the [OpenSea
API](https://docs.opensea.io/reference/api-overview). The response from
the API is cleaned from the JSON format and transformed into a clean
dataframe.

The package also contains some sample data from [Mutant Ape Yacht
Club](https://opensea.io/collection/mutant-ape-yacht-club) which
contains event data for 85 unique assets. In addition, sample data
containing historical average price of some popular collections are also
included.

Functions inside the package include:

-   `read_os_collection`: Takes required API key and optional asset
    owner address and converts JSON format API call result into
    dataframe

-   `add_logo`: Adds OpenSea logo to ggplot object

-   `scale_color_opensea`: Adds OpenSea color palette to point/line
    ggplot

-   `scale_fill_opensea`: Adds OpenSea color palette to for fill option

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
```

#### Retrieve data from OpenSea API

``` r
total_collection<-read_os_collection(api_key="")
collection_one_owner<-read_os_collection(api_key="",asset_owner="")
```

#### Create graph with OpenSea Palette

``` r
example_plot<-ggplot(data = mayc_avg_price, aes(x = date, y = avgprice, color = volume))+
  geom_point()+
  scale_color_opensea(palette = "dark", discrete = FALSE, reverse = TRUE)

example_plot
```

![](README_files/figure-gfm/unnamed-chunk-6-1.png)<!-- -->

#### Add OpenSea logo to graphs

``` r
add_logo(example_plot)
```

![](README_files/figure-gfm/unnamed-chunk-7-1.png)<!-- -->
