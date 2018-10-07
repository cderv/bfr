
<!-- README.md is generated from README.Rmd. Please edit that file -->

# bfr

bfr 📦 contains a set of function to retrieve data about french traffic,
published on <http://www.bison-fute.gouv.fr>

## Installation

You can install the latest version of bfr from github with:

``` r
devtools::install_github("cderv/bfr)
```

## Example

### Get all the prevision

``` r
library(bfr)
all_prev <- get_all_previsions_available()
head(all_prev)
#> # A tibble: 6 x 4
#>   days       depts depart retour
#>   <chr>      <chr> <chr>  <chr> 
#> 1 15/11/2017 75    V      V     
#> 2 15/11/2017 77    V      V     
#> 3 15/11/2017 78    V      V     
#> 4 15/11/2017 91    V      V     
#> 5 15/11/2017 92    V      V     
#> 6 15/11/2017 93    V      V
```
