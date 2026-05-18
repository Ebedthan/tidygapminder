# tidygapminder <img src="man/figures/logo.png" align="right" height="139" alt="" />

[![R-CMD-check](https://github.com/ebedthan/tidygapminder/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/ebedthan/tidygapminder/actions/workflows/R-CMD-check.yaml)
[![test-coverage](https://github.com/ebedthan/tidygapminder/actions/workflows/test-coverage.yaml/badge.svg)](https://github.com/ebedthan/tidygapminder/actions/workflows/test-coverage.yaml)
[![codecov](https://app.codecov.io/gh/ebedthan/tidygapminder/branch/master/graph/badge.svg)](https://app.codecov.io/gh/ebedthan/tidygapminder)
[![CRAN status](https://www.r-pkg.org/badges/version/tidygapminder)](https://CRAN.R-project.org/package=tidygapminder)
[![CRAN downloads](http://cranlogs.r-pkg.org/badges/grand-total/tidygapminder)](https://cran.r-project.org/package=tidygapminder)
[![Project Status: Active](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)

---

> *Gapminder data, minus the mess.*

[Gapminder](https://www.gapminder.org) is a goldmine of global development
data — life expectancy, income, CO₂ emissions, literacy rates, and hundreds
more indicators spanning centuries. The catch? Every sheet looks like this:

```
life expectancy years | 1800 | 1801 | 1802 | ...
----------------------|------|------|------|----
Afghanistan           | 28.2 | 28.2 | 28.2 | ...
Albania               | 35.4 | 35.4 | 35.4 | ...
...
```

Countries as rows, years as columns, the indicator name hiding in cell A1.
Great for a spreadsheet. Terrible for R.

`tidygapminder` fixes that in one function call.

## Installation

```{r}
# From CRAN
install.packages("tidygapminder")

# Development version
pak::pak("ebedthan/tidygapminder")
```

## Two functions. That's it.

### `tidy_index()`: one file at a time

Point it at a Gapminder `.csv`, `.xlsx`, or `.xls` file and get back a clean
tibble:

```{r}
library(tidygapminder)

csv_path <- system.file("extdata/life_expectancy_years.csv", package = "tidygapminder")

tidy_index(csv_path)
```

Three columns: `country`, `year`, and the indicator, ready to filter, plot,
or model.

### `tidy_bunch()`: a whole folder at once

Downloaded ten indicators? No problem. Point `tidy_bunch()` at the folder:

```{r}
dir_path <- system.file("extdata", package = "tidygapminder")

# Returns a named list of tibbles, one per file
result <- tidy_bunch(dir_path)
names(result)
```

Want everything in one data frame joined by `country` and `year`?

```{r}
tidy_bunch(dir_path, combine = TRUE)
```

## Why tidygapminder?

- **Zero friction**: no arguments to learn beyond a file path
- **Handles the quirks**: indicator name in cell A1, non-numeric year
  columns, mixed file formats: all taken care of
- **Lightweight**: only two dependencies (`readxl` and `tibble`)
- **Informative errors**: tells you exactly what went wrong and where

## Getting help

- Read the vignette: `vignette("tidygapminder")`
- Browse the documentation: <https://ebedthan.github.io/tidygapminder/>
- Found a bug? [Open an issue](https://github.com/ebedthan/tidygapminder/issues)
