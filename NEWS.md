# tidygapminder 1.0.0

## Breaking changes
* `tidy_bunch()`: the `merge` parameter has been renamed to `combine` to avoid
  shadowing `base::merge()`. Update any existing calls accordingly.
* `tidy_indice()` is deprecated in favour of the correctly spelled `tidy_index()`.
  It still works but will emit a deprecation warning. It will be removed in a
  future release.

## New features
* `tidy_index()` and `tidy_bunch()` now return tibbles instead of plain data frames.
* `tidy_bunch()` now returns a named list (named after each indicator file) when
  `combine = FALSE`.
* `tidy_bunch()` now supports `.xls` files in addition to `.csv` and `.xlsx`.
* Both functions now emit informative error messages for missing files, missing
  directories, unsupported file extensions, and empty directories.
* Year coercion to numeric now emits a warning if any values cannot be converted.

## Internal changes
* Migrate CI from Travis/AppVeyor to GitHub Actions.
* Drop support for R < 4.1.0.
* Upgrade to testthat 3rd edition with expanded test coverage.
* Replace `readr::read_csv()` with base `read.csv()` and `tidyr::pivot_longer()`
  with base `reshape()`, removing both `readr` and `tidyr` from dependencies.
  Package now depends only on `readxl` and `tibble`.
* pkgdown site upgraded to Bootstrap 5.

# tidygapminder 0.1.1
* Fix a bug in merging list of data frames in `tidy_bunch()`.

# tidygapminder 0.1.0
* First release, with `tidy_indice()` and `tidy_bunch()` functions.
