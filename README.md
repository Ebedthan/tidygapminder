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

# From ----------------------------------
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

# To ------------------------------------
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

Or more powerful: 


```r

# From ----------------------------------------

path <- system.file("extdata", package = "tidygapminder")

list.files(path)
#> [1] "agriculture_land.xlsx"     "life_expectancy_years.csv"

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

df_ <- data.table::fread(system.file("extdata", "life_expectancy_years.csv", package = "tidygapminder"))

df_
#>               V1     V2     V3     V4     V5     V6     V7     V8     V9    V10
#>   1:     country 1800.0 1801.0 1802.0 1803.0 1804.0 1805.0 1806.0 1807.0 1808.0
#>   2: Afghanistan   28.2   28.2   28.2   28.2   28.2   28.2   28.1   28.1   28.1
#>   3:     Albania   35.4   35.4   35.4   35.4   35.4   35.4   35.4   35.4   35.4
#>   4:     Algeria   28.8   28.8   28.8   28.8   28.8   28.8   28.8   28.8   28.8
#>         V11    V12    V13    V14    V15    V16    V17    V18    V19    V20    V21
#>   1: 1809.0 1810.0 1811.0 1812.0 1813.0 1814.0 1815.0 1816.0 1817.0 1818.0 1819.0
#>   2:   28.1   28.1   28.1   28.1   28.1   28.1   28.1   28.1   28.0   28.0   28.0
#>   3:   35.4   35.4   35.4   35.4   35.4   35.4   35.4   35.4   35.4   35.4   35.4
#>   4:   28.8   28.8   28.8   28.8   28.8   28.8   28.8   28.8   28.8   28.8   28.8
#>         V22    V23    V24    V25    V26    V27    V28    V29    V30    V31    V32
#>   1: 1820.0 1821.0 1822.0 1823.0 1824.0 1825.0 1826.0 1827.0 1828.0 1829.0 1830.0
#>   2:   28.0   28.0   28.0   28.0   28.0   27.9   27.9   27.9   27.9   27.9   27.9
#>   3:   35.4   35.4   35.4   35.4   35.4   35.4   35.4   35.4   35.4   35.4   35.4
#>   4:   28.8   28.8   28.8   28.8   28.8   28.8   28.8   28.8   28.8   28.8   28.8
#>         V33    V34    V35    V36    V37    V38    V39    V40    V41    V42    V43
#>   1: 1831.0 1832.0 1833.0 1834.0 1835.0 1836.0 1837.0 1838.0 1839.0 1840.0 1841.0
#>   2:   27.9   27.9   27.9   27.9   27.9   27.8   27.8   27.8   27.8   27.8   27.8
#>   3:   35.4   35.4   35.4   35.4   35.4   35.4   35.4   35.4   35.4   35.4   35.4
#>   4:   28.8   28.8   28.8   28.8   28.8   28.8   28.8   28.8   28.8   28.8   28.8
#>         V44    V45    V46    V47    V48    V49    V50    V51    V52    V53    V54
#>   1: 1842.0 1843.0 1844.0 1845.0 1846.0 1847.0 1848.0 1849.0 1850.0 1851.0 1852.0
#>   2:   27.8   27.8   27.8   27.8   27.7   27.7   27.7   27.7   27.7   27.7   27.7
#>   3:   35.4   35.4   35.4   35.4   35.4   35.4   35.4   35.4   35.4   35.4   35.4
#>   4:   28.8   28.8   28.8   28.8   28.8   28.8   28.8   20.0   15.0   22.0   28.8
#>         V55    V56    V57    V58    V59    V60    V61    V62    V63    V64    V65
#>   1: 1853.0 1854.0 1855.0 1856.0 1857.0 1858.0 1859.0 1860.0 1861.0 1862.0 1863.0
#>   2:   27.7   27.7   27.6   27.6   27.6   27.6   27.6   27.6   27.6   27.6   27.6
#>   3:   35.4   35.4   35.4   35.4   35.4   35.4   35.4   35.4   35.4   35.4   35.4
#>   4:   28.8   28.8   28.8   28.8   28.8   28.8   28.8   28.8   28.8   28.8   28.8
#>         V66    V67    V68    V69    V70    V71    V72    V73    V74    V75    V76
#>   1: 1864.0 1865.0 1866.0 1867.0 1868.0 1869.0 1870.0 1871.0 1872.0 1873.0 1874.0
#>   2:   27.6   27.5   27.5   27.5   27.5   27.5   27.5   27.6   27.6   27.7   27.7
#>   3:   35.4   35.4   35.4   35.4   35.4   35.4   35.4   35.4   35.4   35.4   35.4
#>   4:   28.8   28.8   28.8   21.0   11.0   15.0   22.0   28.9   28.9   28.9   29.0
#>         V77    V78    V79    V80    V81    V82    V83    V84    V85    V86    V87
#>   1: 1875.0 1876.0 1877.0 1878.0 1879.0 1880.0 1881.0 1882.0 1883.0 1884.0 1885.0
#>   2:   27.8   27.8   27.9   28.0   28.0   28.1   28.1   28.2   28.2   28.3   28.4
#>   3:   35.4   35.4   35.4   35.4   35.4   35.4   35.4   35.4   35.4   35.4   35.4
#>   4:   29.0   29.1   29.1   29.1   29.2   29.2   29.3   29.3   29.4   29.4   29.4
#>         V88    V89    V90    V91    V92    V93    V94    V95    V96    V97    V98
#>   1: 1886.0 1887.0 1888.0 1889.0 1890.0 1891.0 1892.0 1893.0 1894.0 1895.0 1896.0
#>   2:   28.4   28.5   28.5   28.6   28.6   28.7   28.8   28.8   28.9   28.9   29.0
#>   3:   35.4   35.4   35.4   35.4   35.5   35.5   35.5   35.5   35.5   35.5   35.5
#>   4:   29.5   29.5   29.6   29.6   29.6   29.7   29.7   29.8   29.8   29.8   29.9
#>         V99   V100   V101   V102   V103   V104   V105   V106   V107   V108   V109
#>   1: 1897.0 1898.0 1899.0 1900.0 1901.0 1902.0 1903.0 1904.0 1905.0 1906.0 1907.0
#>   2:   29.1   29.1   29.2   29.2   29.3   29.3   29.4   29.4   29.5   29.6   29.6
#>   3:   35.5   35.5   35.5   35.5   35.5   35.5   35.5   35.5   35.5   35.5   35.5
#>   4:   29.9   30.0   30.0   30.1   30.2   30.3   31.3   25.3   28.0   29.5   29.4
#>        V110   V111   V112   V113   V114   V115   V116   V117   V118   V119
#>   1: 1908.0 1909.0 1910.0 1911.0 1912.0 1913.0 1914.0 1915.0 1916.0 1917.0
#>   2:   29.7   29.7   29.8   29.8   29.9   29.9   30.0   30.1   30.1   30.2
#>   3:   35.5   35.5   35.5   35.5   35.5   35.5   35.5   35.5   35.5   35.5
#>   4:   29.3   30.9   32.5   32.3   33.7   31.5   31.0   30.5   30.1   30.2
#>         V120   V121   V122   V123   V124   V125   V126   V127   V128   V129
#>   1: 1918.00 1919.0 1920.0 1921.0 1922.0 1923.0 1924.0 1925.0 1926.0 1927.0
#>   2:    7.89   30.3   30.3   30.4   30.4   30.5   30.6   30.6   30.7   30.7
#>   3:   19.50   35.5   35.5   35.5   35.5   35.5   35.5   35.5   35.5   35.5
#>   4:   23.60   30.3   29.4   29.5   29.2   31.8   33.3   34.1   33.4   28.6
#>        V130   V131   V132   V133   V134   V135   V136   V137   V138   V139   V140
#>   1: 1928.0 1929.0 1930.0 1931.0 1932.0 1933.0 1934.0 1935.0 1936.0 1937.0 1938.0
#>   2:   30.8   30.8   30.9   30.9   31.0   31.1   31.1   31.2   31.2   31.3   31.3
#>   3:   35.5   35.5   36.4   37.3   38.2   39.1   40.0   40.9   41.8   42.8   43.6
#>   4:   32.2   32.5   33.8   31.7   33.1   34.3   33.7   35.6   36.8   34.9   34.3
#>        V141   V142   V143   V144   V145   V146   V147   V148   V149   V150   V151
#>   1: 1939.0 1940.0 1941.0 1942.0 1943.0 1944.0 1945.0 1946.0 1947.0 1948.0 1949.0
#>   2:   31.4   31.4   31.5   31.6   31.6   31.7   31.7   31.8   31.8   31.9   31.9
#>   3:   43.2   42.2   41.7   40.2   37.2   34.2   47.2   50.3   51.8   52.7   53.6
#>   4:   36.6   37.1   35.3   34.7   30.0   35.5   33.2   35.4   38.8   42.0   44.4
#>        V152   V153   V154   V155   V156   V157   V158   V159   V160   V161   V162
#>   1: 1950.0 1951.0 1952.0 1953.0 1954.0 1955.0 1956.0 1957.0 1958.0 1959.0 1960.0
#>   2:   32.0   32.4   33.0   33.7   34.4   35.1   35.8   36.5   37.2   37.9   38.6
#>   3:   54.5   54.7   55.2   55.8   56.5   57.3   58.3   59.3   60.4   61.6   62.7
#>   4:   46.9   47.1   47.6   48.1   48.6   49.2   49.7   50.3   50.9   51.4   52.0
#>        V163   V164   V165   V166   V167   V168   V169   V170   V171   V172   V173
#>   1: 1961.0 1962.0 1963.0 1964.0 1965.0 1966.0 1967.0 1968.0 1969.0 1970.0 1971.0
#>   2:   39.4   40.1   40.8   41.5   42.2   42.9   43.7   44.4   45.1   45.8   45.9
#>   3:   63.7   64.6   65.3   65.9   66.3   66.5   66.7   66.9   67.1   67.4   68.0
#>   4:   52.6   53.2   53.8   54.3   54.9   55.4   56.0   56.5   57.0   57.5   57.8
#>        V174   V175   V176   V177   V178   V179   V180   V181   V182   V183   V184
#>   1: 1972.0 1973.0 1974.0 1975.0 1976.0 1977.0 1978.0 1979.0 1980.0 1981.0 1982.0
#>   2:   45.9   46.0   46.1   46.3   46.5   46.6   45.0   43.6   43.3   44.1   43.8
#>   3:   68.6   69.2   69.8   70.3   70.8   71.3   71.7   72.0   72.3   72.4   72.5
#>   4:   58.2   58.5   59.1   59.5   60.0   60.6   61.2   61.9   62.1   63.4   64.4
#>        V185   V186   V187   V188   V189   V190   V191   V192   V193   V194   V195
#>   1: 1983.0 1984.0 1985.0 1986.0 1987.0 1988.0 1989.0 1990.0 1991.0 1992.0 1993.0
#>   2:   42.0   39.8   41.6   42.6   44.7   47.0   50.8   51.6   51.3   51.4   51.4
#>   3:   72.6   72.8   73.0   73.2   73.2   73.4   73.7   73.9   73.9   73.9   73.9
#>   4:   65.7   66.9   68.0   68.7   69.4   70.0   70.5   71.0   71.4   71.7   72.0
#>        V196   V197   V198   V199   V200   V201   V202   V203   V204   V205   V206
#>   1: 1994.0 1995.0 1996.0 1997.0 1998.0 1999.0 2000.0 2001.0 2002.0 2003.0 2004.0
#>   2:   50.7   51.1   51.4   51.1   50.1   51.5   51.6   51.7   52.4   53.0   53.5
#>   3:   74.0   74.1   74.3   72.5   74.3   74.4   74.4   74.5   74.5   74.6   74.7
#>   4:   72.1   72.3   72.8   73.0   73.1   73.5   73.9   74.1   74.4   74.5   75.1
#>        V207   V208   V209   V210   V211   V212   V213   V214   V215   V216   V217
#>   1: 2005.0 2006.0 2007.0 2008.0 2009.0 2010.0 2011.0 2012.0 2013.0 2014.0 2015.0
#>   2:   53.9   54.1   54.6   55.2   55.7   56.2   56.7   57.2   57.7   57.8   57.9
#>   3:   74.9   75.2   75.4   75.6   75.9   76.3   76.7   77.0   77.2   77.4   77.6
#>   4:   75.4   75.6   75.9   76.1   76.3   76.5   76.7   76.8   77.0   77.1   77.3
#>        V218   V219   V220
#>   1: 2016.0 2017.0 2018.0
#>   2:   58.0   58.4   58.7
#>   3:   77.7   77.9   78.0
#>   4:   77.4   77.6   77.9
#>  [ reached getOption("max.print") -- omitted 7 rows ]

# To ------------------------------------------

tidy_bunch(dirpath = path, merge = TRUE)
#> We take in only csv or xlsx files
#>         country year Agricultural land (% of land area) life_expectancy_years
#> 1   Afghanistan 1800                                 NA                 28.20
#> 2   Afghanistan 1801                                 NA                 28.20
#> 3   Afghanistan 1802                                 NA                 28.20
#> 4   Afghanistan 1803                                 NA                 28.20
#> 5   Afghanistan 1804                                 NA                 28.20
#> 6   Afghanistan 1805                                 NA                 28.20
#> 7   Afghanistan 1806                                 NA                 28.10
#> 8   Afghanistan 1807                                 NA                 28.10
#> 9   Afghanistan 1808                                 NA                 28.10
#> 10  Afghanistan 1809                                 NA                 28.10
#> 11  Afghanistan 1810                                 NA                 28.10
#> 12  Afghanistan 1811                                 NA                 28.10
#> 13  Afghanistan 1812                                 NA                 28.10
#> 14  Afghanistan 1813                                 NA                 28.10
#> 15  Afghanistan 1814                                 NA                 28.10
#> 16  Afghanistan 1815                                 NA                 28.10
#> 17  Afghanistan 1816                                 NA                 28.10
#> 18  Afghanistan 1817                                 NA                 28.00
#> 19  Afghanistan 1818                                 NA                 28.00
#> 20  Afghanistan 1819                                 NA                 28.00
#> 21  Afghanistan 1820                                 NA                 28.00
#> 22  Afghanistan 1821                                 NA                 28.00
#> 23  Afghanistan 1822                                 NA                 28.00
#> 24  Afghanistan 1823                                 NA                 28.00
#> 25  Afghanistan 1824                                 NA                 28.00
#> 26  Afghanistan 1825                                 NA                 27.90
#> 27  Afghanistan 1826                                 NA                 27.90
#> 28  Afghanistan 1827                                 NA                 27.90
#> 29  Afghanistan 1828                                 NA                 27.90
#> 30  Afghanistan 1829                                 NA                 27.90
#> 31  Afghanistan 1830                                 NA                 27.90
#> 32  Afghanistan 1831                                 NA                 27.90
#> 33  Afghanistan 1832                                 NA                 27.90
#> 34  Afghanistan 1833                                 NA                 27.90
#> 35  Afghanistan 1834                                 NA                 27.90
#> 36  Afghanistan 1835                                 NA                 27.90
#> 37  Afghanistan 1836                                 NA                 27.80
#> 38  Afghanistan 1837                                 NA                 27.80
#> 39  Afghanistan 1838                                 NA                 27.80
#> 40  Afghanistan 1839                                 NA                 27.80
#> 41  Afghanistan 1840                                 NA                 27.80
#> 42  Afghanistan 1841                                 NA                 27.80
#> 43  Afghanistan 1842                                 NA                 27.80
#> 44  Afghanistan 1843                                 NA                 27.80
#> 45  Afghanistan 1844                                 NA                 27.80
#> 46  Afghanistan 1845                                 NA                 27.80
#> 47  Afghanistan 1846                                 NA                 27.70
#> 48  Afghanistan 1847                                 NA                 27.70
#> 49  Afghanistan 1848                                 NA                 27.70
#> 50  Afghanistan 1849                                 NA                 27.70
#> 51  Afghanistan 1850                                 NA                 27.70
#> 52  Afghanistan 1851                                 NA                 27.70
#> 53  Afghanistan 1852                                 NA                 27.70
#> 54  Afghanistan 1853                                 NA                 27.70
#> 55  Afghanistan 1854                                 NA                 27.70
#> 56  Afghanistan 1855                                 NA                 27.60
#> 57  Afghanistan 1856                                 NA                 27.60
#> 58  Afghanistan 1857                                 NA                 27.60
#> 59  Afghanistan 1858                                 NA                 27.60
#> 60  Afghanistan 1859                                 NA                 27.60
#> 61  Afghanistan 1860                                 NA                 27.60
#> 62  Afghanistan 1861                                 NA                 27.60
#> 63  Afghanistan 1862                                 NA                 27.60
#> 64  Afghanistan 1863                                 NA                 27.60
#> 65  Afghanistan 1864                                 NA                 27.60
#> 66  Afghanistan 1865                                 NA                 27.50
#> 67  Afghanistan 1866                                 NA                 27.50
#> 68  Afghanistan 1867                                 NA                 27.50
#> 69  Afghanistan 1868                                 NA                 27.50
#> 70  Afghanistan 1869                                 NA                 27.50
#> 71  Afghanistan 1870                                 NA                 27.50
#> 72  Afghanistan 1871                                 NA                 27.60
#> 73  Afghanistan 1872                                 NA                 27.60
#> 74  Afghanistan 1873                                 NA                 27.70
#> 75  Afghanistan 1874                                 NA                 27.70
#> 76  Afghanistan 1875                                 NA                 27.80
#> 77  Afghanistan 1876                                 NA                 27.80
#> 78  Afghanistan 1877                                 NA                 27.90
#> 79  Afghanistan 1878                                 NA                 28.00
#> 80  Afghanistan 1879                                 NA                 28.00
#> 81  Afghanistan 1880                                 NA                 28.10
#> 82  Afghanistan 1881                                 NA                 28.10
#> 83  Afghanistan 1882                                 NA                 28.20
#> 84  Afghanistan 1883                                 NA                 28.20
#> 85  Afghanistan 1884                                 NA                 28.30
#> 86  Afghanistan 1885                                 NA                 28.40
#> 87  Afghanistan 1886                                 NA                 28.40
#> 88  Afghanistan 1887                                 NA                 28.50
#> 89  Afghanistan 1888                                 NA                 28.50
#> 90  Afghanistan 1889                                 NA                 28.60
#> 91  Afghanistan 1890                                 NA                 28.60
#> 92  Afghanistan 1891                                 NA                 28.70
#> 93  Afghanistan 1892                                 NA                 28.80
#> 94  Afghanistan 1893                                 NA                 28.80
#> 95  Afghanistan 1894                                 NA                 28.90
#> 96  Afghanistan 1895                                 NA                 28.90
#> 97  Afghanistan 1896                                 NA                 29.00
#> 98  Afghanistan 1897                                 NA                 29.10
#> 99  Afghanistan 1898                                 NA                 29.10
#> 100 Afghanistan 1899                                 NA                 29.20
#> 101 Afghanistan 1900                                 NA                 29.20
#> 102 Afghanistan 1901                                 NA                 29.30
#> 103 Afghanistan 1902                                 NA                 29.30
#> 104 Afghanistan 1903                                 NA                 29.40
#> 105 Afghanistan 1904                                 NA                 29.40
#> 106 Afghanistan 1905                                 NA                 29.50
#> 107 Afghanistan 1906                                 NA                 29.60
#> 108 Afghanistan 1907                                 NA                 29.60
#> 109 Afghanistan 1908                                 NA                 29.70
#> 110 Afghanistan 1909                                 NA                 29.70
#> 111 Afghanistan 1910                                 NA                 29.80
#> 112 Afghanistan 1911                                 NA                 29.80
#> 113 Afghanistan 1912                                 NA                 29.90
#> 114 Afghanistan 1913                                 NA                 29.90
#> 115 Afghanistan 1914                                 NA                 30.00
#> 116 Afghanistan 1915                                 NA                 30.10
#> 117 Afghanistan 1916                                 NA                 30.10
#> 118 Afghanistan 1917                                 NA                 30.20
#> 119 Afghanistan 1918                                 NA                  7.89
#> 120 Afghanistan 1919                                 NA                 30.30
#> 121 Afghanistan 1920                                 NA                 30.30
#> 122 Afghanistan 1921                                 NA                 30.40
#> 123 Afghanistan 1922                                 NA                 30.40
#> 124 Afghanistan 1923                                 NA                 30.50
#> 125 Afghanistan 1924                                 NA                 30.60
#> 126 Afghanistan 1925                                 NA                 30.60
#> 127 Afghanistan 1926                                 NA                 30.70
#> 128 Afghanistan 1927                                 NA                 30.70
#> 129 Afghanistan 1928                                 NA                 30.80
#> 130 Afghanistan 1929                                 NA                 30.80
#> 131 Afghanistan 1930                                 NA                 30.90
#> 132 Afghanistan 1931                                 NA                 30.90
#> 133 Afghanistan 1932                                 NA                 31.00
#> 134 Afghanistan 1933                                 NA                 31.10
#> 135 Afghanistan 1934                                 NA                 31.10
#> 136 Afghanistan 1935                                 NA                 31.20
#> 137 Afghanistan 1936                                 NA                 31.20
#> 138 Afghanistan 1937                                 NA                 31.30
#> 139 Afghanistan 1938                                 NA                 31.30
#> 140 Afghanistan 1939                                 NA                 31.40
#> 141 Afghanistan 1940                                 NA                 31.40
#> 142 Afghanistan 1941                                 NA                 31.50
#> 143 Afghanistan 1942                                 NA                 31.60
#> 144 Afghanistan 1943                                 NA                 31.60
#> 145 Afghanistan 1944                                 NA                 31.70
#> 146 Afghanistan 1945                                 NA                 31.70
#> 147 Afghanistan 1946                                 NA                 31.80
#> 148 Afghanistan 1947                                 NA                 31.80
#> 149 Afghanistan 1948                                 NA                 31.90
#> 150 Afghanistan 1949                                 NA                 31.90
#> 151 Afghanistan 1950                                 NA                 32.00
#> 152 Afghanistan 1951                                 NA                 32.40
#> 153 Afghanistan 1952                                 NA                 33.00
#> 154 Afghanistan 1953                                 NA                 33.70
#> 155 Afghanistan 1954                                 NA                 34.40
#> 156 Afghanistan 1955                                 NA                 35.10
#> 157 Afghanistan 1956                                 NA                 35.80
#> 158 Afghanistan 1957                                 NA                 36.50
#> 159 Afghanistan 1958                                 NA                 37.20
#> 160 Afghanistan 1959                                 NA                 37.90
#> 161 Afghanistan 1960                                 NA                 38.60
#> 162 Afghanistan 1961                           57.80170                 39.40
#> 163 Afghanistan 1962                           57.89369                 40.10
#> 164 Afghanistan 1963                           57.97035                 40.80
#> 165 Afghanistan 1964                           58.06694                 41.50
#> 166 Afghanistan 1965                           58.07001                 42.20
#> 167 Afghanistan 1966                           58.12827                 42.90
#> 168 Afghanistan 1967                           58.22946                 43.70
#> 169 Afghanistan 1968                           58.23099                 44.40
#> 170 Afghanistan 1969                           58.25552                 45.10
#> 171 Afghanistan 1970                           58.27086                 45.80
#> 172 Afghanistan 1971                           58.31685                 45.90
#> 173 Afghanistan 1972                           58.33218                 45.90
#> 174 Afghanistan 1973                           58.33525                 46.00
#> 175 Afghanistan 1974                           58.33525                 46.10
#> 176 Afghanistan 1975                           58.33525                 46.30
#> 177 Afghanistan 1976                           58.33525                 46.50
#> 178 Afghanistan 1977                           58.33832                 46.60
#> 179 Afghanistan 1978                           58.33832                 45.00
#> 180 Afghanistan 1979                           58.33678                 43.60
#> 181 Afghanistan 1980                           58.33678                 43.30
#> 182 Afghanistan 1981                           58.34292                 44.10
#> 183 Afghanistan 1982                           58.34445                 43.80
#> 184 Afghanistan 1983                           58.34445                 42.00
#> 185 Afghanistan 1984                           58.34445                 39.80
#> 186 Afghanistan 1985                           58.34445                 41.60
#> 187 Afghanistan 1986                           58.34445                 42.60
#> 188 Afghanistan 1987                           58.33065                 44.70
#> 189 Afghanistan 1988                           58.32298                 47.00
#> 190 Afghanistan 1989                           58.32298                 50.80
#> 191 Afghanistan 1990                           58.32298                 51.60
#> 192 Afghanistan 1991                           58.30765                 51.30
#> 193 Afghanistan 1992                           58.30765                 51.40
#> 194 Afghanistan 1993                           58.16046                 51.40
#> 195 Afghanistan 1994                           57.97495                 50.70
#> 196 Afghanistan 1995                           57.88296                 51.10
#> 197 Afghanistan 1996                           57.88142                 51.40
#> 198 Afghanistan 1997                           57.93968                 51.10
#> 199 Afghanistan 1998                           58.05774                 50.10
#> 200 Afghanistan 1999                           57.88296                 51.50
#> 201 Afghanistan 2000                           57.88296                 51.60
#> 202 Afghanistan 2001                           57.88296                 51.70
#> 203 Afghanistan 2002                           57.88296                 52.40
#> 204 Afghanistan 2003                           58.12367                 53.00
#> 205 Afghanistan 2004                           58.12520                 53.50
#> 206 Afghanistan 2005                           58.12367                 53.90
#> 207 Afghanistan 2006                           58.12367                 54.10
#> 208 Afghanistan 2007                           58.12367                 54.60
#> 209 Afghanistan 2008                           58.12367                 55.20
#> 210 Afghanistan 2009                           58.12367                 55.70
#> 211 Afghanistan 2010                                 NA                 56.20
#> 212 Afghanistan 2011                                 NA                 56.70
#> 213 Afghanistan 2012                                 NA                 57.20
#> 214 Afghanistan 2013                                 NA                 57.70
#> 215 Afghanistan 2014                                 NA                 57.80
#> 216 Afghanistan 2015                                 NA                 57.90
#> 217 Afghanistan 2016                                 NA                 58.00
#> 218 Afghanistan 2017                                 NA                 58.40
#> 219 Afghanistan 2018                                 NA                 58.70
#> 220     Albania 1800                                 NA                 35.40
#> 221     Albania 1801                                 NA                 35.40
#> 222     Albania 1802                                 NA                 35.40
#> 223     Albania 1803                                 NA                 35.40
#> 224     Albania 1804                                 NA                 35.40
#> 225     Albania 1805                                 NA                 35.40
#> 226     Albania 1806                                 NA                 35.40
#> 227     Albania 1807                                 NA                 35.40
#> 228     Albania 1808                                 NA                 35.40
#> 229     Albania 1809                                 NA                 35.40
#> 230     Albania 1810                                 NA                 35.40
#> 231     Albania 1811                                 NA                 35.40
#> 232     Albania 1812                                 NA                 35.40
#> 233     Albania 1813                                 NA                 35.40
#> 234     Albania 1814                                 NA                 35.40
#> 235     Albania 1815                                 NA                 35.40
#> 236     Albania 1816                                 NA                 35.40
#> 237     Albania 1817                                 NA                 35.40
#> 238     Albania 1818                                 NA                 35.40
#> 239     Albania 1819                                 NA                 35.40
#> 240     Albania 1820                                 NA                 35.40
#> 241     Albania 1821                                 NA                 35.40
#> 242     Albania 1822                                 NA                 35.40
#> 243     Albania 1823                                 NA                 35.40
#> 244     Albania 1824                                 NA                 35.40
#> 245     Albania 1825                                 NA                 35.40
#> 246     Albania 1826                                 NA                 35.40
#> 247     Albania 1827                                 NA                 35.40
#> 248     Albania 1828                                 NA                 35.40
#> 249     Albania 1829                                 NA                 35.40
#> 250     Albania 1830                                 NA                 35.40
#>  [ reached 'max' / getOption("max.print") -- omitted 42679 rows ]
```

Enjoy 😄 !!!
