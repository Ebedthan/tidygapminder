# Changelog

## tidygapminder 1.0.0

- [`tidy_bunch()`](https://ebedthan.github.io/tidygapminder/reference/tidy_bunch.md):
  the `merge` parameter has been renamed to `combine` to avoid shadowing
  [`base::merge()`](https://rdrr.io/r/base/merge.html). Update any
  existing calls accordingly.
- Migrate CI from Travis/AppVeyor to GitHub Actions
- Drop support for R \< 4.1.0
- Upgrade to testthat 3rd edition
- Various documentation improvements

## tidygapminder 0.1.1

CRAN release: 2020-02-04

- Fix a bug in merging list of data frames in `tidy_bunch` function.

## tidygapminder 0.1.0

CRAN release: 2019-12-06

- First release, with `tidy_indice` and `tidy_bunch` functions.
