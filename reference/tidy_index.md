# Tidy a Gapminder indicator data sheet.

Tidy a Gapminder indicator data sheet.

## Usage

``` r
tidy_index(filepath)

tidy_indice(filepath)
```

## Arguments

- filepath:

  Path to a Gapminder indicator data sheet (.csv, .xlsx, or .xls).

## Value

The indicator data sheet as a tidy data frame with columns `country`,
`year`, and the indicator name.

## Examples

``` r
csv_filepath <- system.file("extdata/life_expectancy_years.csv",
                             package = "tidygapminder")
xlsx_filepath <- system.file(
                 "extdata/agriculture_land.xlsx",
                 package = "tidygapminder")

tidy_index(csv_filepath)
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
tidy_index(xlsx_filepath)
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
```
