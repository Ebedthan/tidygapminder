---
output: github_document
---

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
df <- readxl::read_xlsx(system.file("extdata", "agriculture_land.xlsx", package = "tidygapminder"))

df
#> # A tibble: 213 x 53
#>    `Agricultural l… `1960` `1961` `1962` `1963` `1964` `1965` `1966` `1967` `1968`
#>    <chr>            <lgl>   <dbl>  <dbl>  <dbl>  <dbl>  <dbl>  <dbl>  <dbl>  <dbl>
#>  1 Afghanistan      NA       57.8   57.9   58.0   58.1   58.1   58.1   58.2   58.2
#>  2 Albania          NA       45.0   45.0   45     44.9   45.1   45.3   45.4   45.3
#>  3 Algeria          NA       19.1   18.9   18.7   18.5   18.5   18.5   18.6   18.6
#>  4 American Samoa   NA       20     20     20     20     20     20     20     20  
#>  5 Andorra          NA       55.3   55.3   55.3   55.3   55.3   55.3   55.3   55.3
#>  6 Angola           NA       45.9   45.9   45.9   45.9   45.9   46.0   46.0   46.0
#>  7 Antigua and Bar… NA       22.7   20.5   22.7   20.5   25     25     22.7   22.7
#>  8 Argentina        NA       50.4   49.9   49.3   48.7   48.2   47.8   47.4   47.2
#>  9 Armenia          NA       NA     NA     NA     NA     NA     NA     NA     NA  
#> 10 Aruba            NA       11.1   11.1   11.1   11.1   11.1   11.1   11.1   11.1
#> # … with 203 more rows, and 43 more variables: `1969` <dbl>, `1970` <dbl>,
#> #   `1971` <dbl>, `1972` <dbl>, `1973` <dbl>, `1974` <dbl>, `1975` <dbl>,
#> #   `1976` <dbl>, `1977` <dbl>, `1978` <dbl>, `1979` <dbl>, `1980` <dbl>,
#> #   `1981` <dbl>, `1982` <dbl>, `1983` <dbl>, `1984` <dbl>, `1985` <dbl>,
#> #   `1986` <dbl>, `1987` <dbl>, `1988` <dbl>, `1989` <dbl>, `1990` <dbl>,
#> #   `1991` <dbl>, `1992` <dbl>, `1993` <dbl>, `1994` <dbl>, `1995` <dbl>,
#> #   `1996` <dbl>, `1997` <dbl>, `1998` <dbl>, `1999` <dbl>, `2000` <dbl>,
#> #   `2001` <dbl>, `2002` <dbl>, `2003` <dbl>, `2004` <dbl>, `2005` <dbl>,
#> #   `2006` <dbl>, `2007` <dbl>, `2008` <dbl>, `2009` <dbl>, `2010` <lgl>,
#> #   `2011` <lgl>

# To ...
file <- system.file("extdata", "agriculture_land.xlsx", package = "tidygapminder")

tidy_indice(file)
#> # A tibble: 11,076 x 3
#>    country      year `Agricultural land (% of land area)`
#>    <chr>       <dbl>                                <dbl>
#>  1 Afghanistan  1960                                 NA  
#>  2 Afghanistan  1961                                 57.8
#>  3 Afghanistan  1962                                 57.9
#>  4 Afghanistan  1963                                 58.0
#>  5 Afghanistan  1964                                 58.1
#>  6 Afghanistan  1965                                 58.1
#>  7 Afghanistan  1966                                 58.1
#>  8 Afghanistan  1967                                 58.2
#>  9 Afghanistan  1968                                 58.2
#> 10 Afghanistan  1969                                 58.3
#> # … with 11,066 more rows
```
