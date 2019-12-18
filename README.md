<!-- README.md is generated from README.Rmd. Please edit that file -->



# tidygapminder

[![Build Status](https://travis-ci.org/Ebedthan/tidygapminder.svg)](https://travis-ci.org/Ebedthan/tidygapminder)
[![codecov](https://codecov.io/gh/Ebedthan/tidygapminder/branch/master/graph/badge.svg)](https://codecov.io/gh/Ebedthan/tidygapminder)
[![Build status](https://ci.appveyor.com/api/projects/status/01ss9tmkw5jyaqfu?svg=true)](https://ci.appveyor.com/project/Ebedthan/tidygapminder)
[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)

tidygapminder is designed to make easy to tidy data retrieved from [Gapminder](https://www.gapminder.org). Learn more in `vignette("tidygapminder")`.

## Installation

You can install the released version of tidygapminder from [CRAN](https://CRAN.R-project.org) with:


```r
install.packages("tidygapminder")
```

And the development version from [GitHub](https://github.com/) with:


```r
# install.packages("devtools")
devtools::install_github("ebedthan/tidygapminder")
```
## Example

This is a basic example which shows you how to solve a common problem:


```r
library(tidygapminder)

# From ...
df <- readxl::read_xlsx(system.file("extdata", "life_expectancy_years.csv", package = "tidygapminder"))
#> Error: Evaluation error: zip file '/home/ediman/Projects/tidygapminder/inst/extdata/life_expectancy_years.csv' cannot be opened.

df
#> function (x, df1, df2, ncp, log = FALSE) 
#> {
#>     if (missing(ncp)) 
#>         .Call(C_df, x, df1, df2, log)
#>     else .Call(C_dnf, x, df1, df2, ncp, log)
#> }
#> <bytecode: 0xcd00e00>
#> <environment: namespace:stats>

# To ...
file <- system.file("extdata", "life_expectancy_years.csv", package = "tidygapminder")

tidy_indice(file)
#> # A tibble: 40,953 x 3
#>    country      year life_expectancy_years
#>    <chr>       <dbl>                 <dbl>
#>  1 Afghanistan  1800                  28.2
#>  2 Afghanistan  1801                  28.2
#>  3 Afghanistan  1802                  28.2
#>  4 Afghanistan  1803                  28.2
#>  5 Afghanistan  1804                  28.2
#>  6 Afghanistan  1805                  28.2
#>  7 Afghanistan  1806                  28.1
#>  8 Afghanistan  1807                  28.1
#>  9 Afghanistan  1808                  28.1
#> 10 Afghanistan  1809                  28.1
#> # … with 40,943 more rows
```
