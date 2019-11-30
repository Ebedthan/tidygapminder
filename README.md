
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
df <- readxl::read_xlsx(system.file("extdata", "children_per_woman_total_fertility.xlsx", package = "tidygapminder"))

df
#> # A tibble: 184 x 220
#>    country `1800` `1801` `1802` `1803` `1804` `1805` `1806` `1807` `1808` `1809` `1810` `1811`
#>    <chr>    <dbl>  <dbl>  <dbl>  <dbl>  <dbl>  <dbl>  <dbl>  <dbl>  <dbl>  <dbl>  <dbl>  <dbl>
#>  1 Afghan…   7      7      7      7      7      7      7      7      7      7      7      7   
#>  2 Albania   4.6    4.6    4.6    4.6    4.6    4.6    4.6    4.6    4.6    4.6    4.6    4.6 
#>  3 Algeria   6.99   6.99   6.99   6.99   6.99   6.99   6.99   6.99   6.99   6.99   6.99   6.99
#>  4 Angola    6.93   6.93   6.93   6.93   6.93   6.93   6.93   6.94   6.94   6.94   6.94   6.94
#>  5 Antigu…   5      5      4.99   4.99   4.99   4.98   4.98   4.97   4.97   4.97   4.96   4.96
#>  6 Argent…   6.8    6.8    6.8    6.8    6.8    6.8    6.8    6.8    6.8    6.8    6.8    6.8 
#>  7 Armenia   7.8    7.8    7.81   7.81   7.81   7.82   7.82   7.82   7.83   7.83   7.83   7.83
#>  8 Austra…   6.5    6.48   6.46   6.44   6.42   6.4    6.38   6.36   6.34   6.32   6.3    6.28
#>  9 Austria   5.1    5.1    5.1    5.1    5.1    5.1    5.1    5.1    5.1    5.1    5.1    5.1 
#> 10 Azerba…   8.1    8.1    8.1    8.1    8.1    8.1    8.1    8.1    8.1    8.1    8.1    8.1 
#> # … with 174 more rows, and 207 more variables: `1812` <dbl>, `1813` <dbl>, `1814` <dbl>,
#> #   `1815` <dbl>, `1816` <dbl>, `1817` <dbl>, `1818` <dbl>, `1819` <dbl>, `1820` <dbl>,
#> #   `1821` <dbl>, `1822` <dbl>, `1823` <dbl>, `1824` <dbl>, `1825` <dbl>, `1826` <dbl>,
#> #   `1827` <dbl>, `1828` <dbl>, `1829` <dbl>, `1830` <dbl>, `1831` <dbl>, `1832` <dbl>,
#> #   `1833` <dbl>, `1834` <dbl>, `1835` <dbl>, `1836` <dbl>, `1837` <dbl>, `1838` <dbl>,
#> #   `1839` <dbl>, `1840` <dbl>, `1841` <dbl>, `1842` <dbl>, `1843` <dbl>, `1844` <dbl>,
#> #   `1845` <dbl>, `1846` <dbl>, `1847` <dbl>, `1848` <dbl>, `1849` <dbl>, `1850` <dbl>,
#> #   `1851` <dbl>, `1852` <dbl>, `1853` <dbl>, `1854` <dbl>, `1855` <dbl>, `1856` <dbl>,
#> #   `1857` <dbl>, `1858` <dbl>, `1859` <dbl>, `1860` <dbl>, `1861` <dbl>, `1862` <dbl>,
#> #   `1863` <dbl>, `1864` <dbl>, `1865` <dbl>, `1866` <dbl>, `1867` <dbl>, `1868` <dbl>,
#> #   `1869` <dbl>, `1870` <dbl>, `1871` <dbl>, `1872` <dbl>, `1873` <dbl>, `1874` <dbl>,
#> #   `1875` <dbl>, `1876` <dbl>, `1877` <dbl>, `1878` <dbl>, `1879` <dbl>, `1880` <dbl>,
#> #   `1881` <dbl>, `1882` <dbl>, `1883` <dbl>, `1884` <dbl>, `1885` <dbl>, `1886` <dbl>,
#> #   `1887` <dbl>, `1888` <dbl>, `1889` <dbl>, `1890` <dbl>, `1891` <dbl>, `1892` <dbl>,
#> #   `1893` <dbl>, `1894` <dbl>, `1895` <dbl>, `1896` <dbl>, `1897` <dbl>, `1898` <dbl>,
#> #   `1899` <dbl>, `1900` <dbl>, `1901` <dbl>, `1902` <dbl>, `1903` <dbl>, `1904` <dbl>,
#> #   `1905` <dbl>, `1906` <dbl>, `1907` <dbl>, `1908` <dbl>, `1909` <dbl>, `1910` <dbl>,
#> #   `1911` <dbl>, …

# To ...
file <- system.file("extdata", "children_per_woman_total_fertility.xlsx", package = "tidygapminder")

tidy_indice(file)
#> # A tibble: 40,296 x 3
#>    country      year children_per_woman_total_fertility
#>    <chr>       <dbl>                              <dbl>
#>  1 Afghanistan  1800                                  7
#>  2 Afghanistan  1801                                  7
#>  3 Afghanistan  1802                                  7
#>  4 Afghanistan  1803                                  7
#>  5 Afghanistan  1804                                  7
#>  6 Afghanistan  1805                                  7
#>  7 Afghanistan  1806                                  7
#>  8 Afghanistan  1807                                  7
#>  9 Afghanistan  1808                                  7
#> 10 Afghanistan  1809                                  7
#> # … with 40,286 more rows
```
