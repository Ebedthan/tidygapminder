# Changelog

## tidygapminder 1.0.0

CRAN release: 2026-05-16

### Breaking changes

- [`tidy_bunch()`](https://ebedthan.github.io/tidygapminder/reference/tidy_bunch.md):
  the `merge` parameter has been renamed to `combine` to avoid shadowing
  [`base::merge()`](https://rdrr.io/r/base/merge.html). Update any
  existing calls accordingly.
- [`tidy_indice()`](https://ebedthan.github.io/tidygapminder/reference/tidy_index.md)
  is deprecated in favour of the correctly spelled
  [`tidy_index()`](https://ebedthan.github.io/tidygapminder/reference/tidy_index.md).
  It still works but will emit a deprecation warning. It will be removed
  in a future release.

### New features

- [`tidy_index()`](https://ebedthan.github.io/tidygapminder/reference/tidy_index.md)
  and
  [`tidy_bunch()`](https://ebedthan.github.io/tidygapminder/reference/tidy_bunch.md)
  now return tibbles instead of plain data frames.
- [`tidy_bunch()`](https://ebedthan.github.io/tidygapminder/reference/tidy_bunch.md)
  now returns a named list (named after each indicator file) when
  `combine = FALSE`.
- [`tidy_bunch()`](https://ebedthan.github.io/tidygapminder/reference/tidy_bunch.md)
  now supports `.xls` files in addition to `.csv` and `.xlsx`.
- Both functions now emit informative error messages for missing files,
  missing directories, unsupported file extensions, and empty
  directories.
- Year coercion to numeric now emits a warning if any values cannot be
  converted.

### Internal changes

- Migrate CI from Travis/AppVeyor to GitHub Actions.
- Drop support for R \< 4.1.0.
- Upgrade to testthat 3rd edition with expanded test coverage.
- Replace
  [`readr::read_csv()`](https://readr.tidyverse.org/reference/read_delim.html)
  with base [`read.csv()`](https://rdrr.io/r/utils/read.table.html) and
  [`tidyr::pivot_longer()`](https://tidyr.tidyverse.org/reference/pivot_longer.html)
  with base [`reshape()`](https://rdrr.io/r/stats/reshape.html),
  removing both `readr` and `tidyr` from dependencies. Package now
  depends only on `readxl` and `tibble`.
- pkgdown site upgraded to Bootstrap 5.

## tidygapminder 0.1.1

CRAN release: 2020-02-04

- Fix a bug in merging list of data frames in
  [`tidy_bunch()`](https://ebedthan.github.io/tidygapminder/reference/tidy_bunch.md).

## tidygapminder 0.1.0

CRAN release: 2019-12-06

- First release, with
  [`tidy_indice()`](https://ebedthan.github.io/tidygapminder/reference/tidy_index.md)
  and
  [`tidy_bunch()`](https://ebedthan.github.io/tidygapminder/reference/tidy_bunch.md)
  functions.
