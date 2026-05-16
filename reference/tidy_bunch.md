# Tidy Gapminder indicator data sheets stored in a folder.

Applies
[`tidy_index`](https://ebedthan.github.io/tidygapminder/reference/tidy_index.md)
to all Gapminder data sheets found in a directory and optionally
combines them into a single data frame.

## Usage

``` r
tidy_bunch(dirpath = ".", combine = FALSE, ...)
```

## Arguments

- dirpath:

  Path to folder containing indices Gapminder indicator data sheets.
  Defaults to the current working directory.

- combine:

  A boolean. If `TRUE`, combines all tidied data sheets into a single
  data frame joined on `country` and `year`. Default: `FALSE`.

- ...:

  Additional arguments (reserved for future use).

## Value

If `combine = FALSE` (default), a named list of tibbles, one per file.
If `combine = TRUE`, a single tibble with all indicators merged by
`country` and `year`.

## Examples

``` r
folder_path <- system.file("extdata", package = "tidygapminder")

tidy_bunch(folder_path)
#> $agriculture_land
#> # A tibble: 11,076 × 3
#>    country              year `Agricultural land (% of land area)`
#>    <chr>               <dbl>                                <dbl>
#>  1 Afghanistan          1960                                   NA
#>  2 Albania              1960                                   NA
#>  3 Algeria              1960                                   NA
#>  4 American Samoa       1960                                   NA
#>  5 Andorra              1960                                   NA
#>  6 Angola               1960                                   NA
#>  7 Antigua and Barbuda  1960                                   NA
#>  8 Argentina            1960                                   NA
#>  9 Armenia              1960                                   NA
#> 10 Aruba                1960                                   NA
#> # ℹ 11,066 more rows
#> 
#> $life_expectancy_years
#> # A tibble: 40,953 × 3
#>    country              year life_expectancy_years
#>    <chr>               <dbl>                 <dbl>
#>  1 Afghanistan          1800                  28.2
#>  2 Albania              1800                  35.4
#>  3 Algeria              1800                  28.8
#>  4 Andorra              1800                  NA  
#>  5 Angola               1800                  27  
#>  6 Antigua and Barbuda  1800                  33.5
#>  7 Argentina            1800                  33.2
#>  8 Armenia              1800                  34  
#>  9 Australia            1800                  34  
#> 10 Austria              1800                  34.4
#> # ℹ 40,943 more rows
#> 
tidy_bunch(folder_path, combine = TRUE)
#> # A tibble: 42,929 × 4
#>    country      year `Agricultural land (% of land area)` life_expectancy_years
#>    <chr>       <dbl>                                <dbl>                 <dbl>
#>  1 Afghanistan  1800                                   NA                  28.2
#>  2 Afghanistan  1801                                   NA                  28.2
#>  3 Afghanistan  1802                                   NA                  28.2
#>  4 Afghanistan  1803                                   NA                  28.2
#>  5 Afghanistan  1804                                   NA                  28.2
#>  6 Afghanistan  1805                                   NA                  28.2
#>  7 Afghanistan  1806                                   NA                  28.1
#>  8 Afghanistan  1807                                   NA                  28.1
#>  9 Afghanistan  1808                                   NA                  28.1
#> 10 Afghanistan  1809                                   NA                  28.1
#> # ℹ 42,919 more rows
```
