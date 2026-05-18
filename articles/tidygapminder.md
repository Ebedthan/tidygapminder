# Getting started with tidygapminder

``` r

library(tidygapminder)
```

[Gapminder](https://www.gapminder.org) provides hundreds of indicators,
life expectancy, income, CO₂ emissions, agricultural land, and more, as
individual data sheets downloadable in `.csv` or `.xlsx` format. These
sheets share a common structure that is convenient for distribution but
awkward for analysis: the indicator name sits in cell A1, countries are
rows, and years are spread across columns (wide format).

`tidygapminder` converts this wide format into a tidy long format where
each row is one observation (one country, one year), making the data
immediately ready for use with base R, ggplot2, or any other analysis
tool.

## What a raw Gapminder sheet looks like

Here is what a typical Gapminder sheet looks like before tidying:

``` r

csv_path <- system.file("extdata/life_expectancy_years.csv",
                         package = "tidygapminder")

raw <- read.csv(csv_path, check.names = FALSE)

# Indicator name is in the first column header
colnames(raw)[1:6]
#> [1] "country" "1800"    "1801"    "1802"    "1803"    "1804"

# Countries are rows, years are columns
head(raw[, 1:6])
#>               country 1800 1801 1802 1803 1804
#> 1         Afghanistan 28.2 28.2 28.2 28.2 28.2
#> 2             Albania 35.4 35.4 35.4 35.4 35.4
#> 3             Algeria 28.8 28.8 28.8 28.8 28.8
#> 4             Andorra   NA   NA   NA   NA   NA
#> 5              Angola 27.0 27.0 27.0 27.0 27.0
#> 6 Antigua and Barbuda 33.5 33.5 33.5 33.5 33.5
```

The first column header holds the indicator name
(`life expectancy years`), and every subsequent column is a year. This
wide format makes it hard to filter by year, plot trends, or join with
other indicators.

## Tidying a single sheet with `tidy_index()`

[`tidy_index()`](https://ebedthan.github.io/tidygapminder/reference/tidy_index.md)
takes the path to a single Gapminder sheet (`.csv`, `.xlsx`, or `.xls`)
and returns a tidy tibble with three columns: `country`, `year`, and the
indicator.

``` r

tidy_df <- tidy_index(csv_path)

head(tidy_df)
#> # A tibble: 6 × 3
#>   country              year life_expectancy_years
#>   <chr>               <dbl>                 <dbl>
#> 1 Afghanistan          1800                  28.2
#> 2 Albania              1800                  35.4
#> 3 Algeria              1800                  28.8
#> 4 Andorra              1800                  NA  
#> 5 Angola               1800                  27  
#> 6 Antigua and Barbuda  1800                  33.5
```

Each row is now one observation. The indicator column is named after the
file, which matches the Gapminder convention of naming files after their
indicator.

[`tidy_index()`](https://ebedthan.github.io/tidygapminder/reference/tidy_index.md)
also handles `.xlsx` files identically:

``` r

xlsx_path <- system.file("extdata/agriculture_land.xlsx",
                          package = "tidygapminder")

tidy_index(xlsx_path)
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

## Tidying a folder of sheets with `tidy_bunch()`

When working with multiple indicators at once,
[`tidy_bunch()`](https://ebedthan.github.io/tidygapminder/reference/tidy_bunch.md)
applies
[`tidy_index()`](https://ebedthan.github.io/tidygapminder/reference/tidy_index.md)
to every compatible file in a directory and returns a named list of
tibbles — one per file:

``` r

dir_path <- system.file("extdata", package = "tidygapminder")

result <- tidy_bunch(dir_path)

# One tibble per file, named after the indicator
names(result)
#> [1] "agriculture_land"      "life_expectancy_years"

head(result$life_expectancy_years)
#> # A tibble: 6 × 3
#>   country              year life_expectancy_years
#>   <chr>               <dbl>                 <dbl>
#> 1 Afghanistan          1800                  28.2
#> 2 Albania              1800                  35.4
#> 3 Algeria              1800                  28.8
#> 4 Andorra              1800                  NA  
#> 5 Angola               1800                  27  
#> 6 Antigua and Barbuda  1800                  33.5
```

### Combining all indicators into one data frame

Setting `combine = TRUE` merges all tibbles into a single data frame
joined on `country` and `year`, using a full outer join so no
observations are lost even when indicators cover different time ranges:

``` r

combined <- tidy_bunch(dir_path, combine = TRUE)

head(combined)
#> # A tibble: 6 × 4
#>   country      year `Agricultural land (% of land area)` life_expectancy_years
#>   <chr>       <dbl>                                <dbl>                 <dbl>
#> 1 Afghanistan  1800                                   NA                  28.2
#> 2 Afghanistan  1801                                   NA                  28.2
#> 3 Afghanistan  1802                                   NA                  28.2
#> 4 Afghanistan  1803                                   NA                  28.2
#> 5 Afghanistan  1804                                   NA                  28.2
#> 6 Afghanistan  1805                                   NA                  28.2
```

This combined format is convenient for multi-indicator analyses, for
example plotting life expectancy against agricultural land use per
country.

## Error handling

Both functions provide informative errors for common mistakes:

``` r

# File does not exist
tidy_index("path/to/missing_file.csv")
#> Error in `tidy_index()`:
#> ! Input file not found: path/to/missing_file.csv

# Unsupported format
tidy_index(tempfile(fileext = ".ods"))
#> Error in `tidy_index()`:
#> ! Input file not found: /tmp/RtmpXxoBos/file1a147698d2c.ods

# Directory does not exist
tidy_bunch("path/to/missing_dir")
#> Error in `tidy_bunch()`:
#> ! Directory not found: path/to/missing_dir
```
