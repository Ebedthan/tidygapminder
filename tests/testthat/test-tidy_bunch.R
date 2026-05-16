dir_path <- system.file("extdata", package = "tidygapminder")
empty_dir <- tempfile()
dir.create(empty_dir)

# Output type -----------------------------------------------------------
test_that("returns a named list by default", {
  result <- tidy_bunch(dir_path)
  expect_true(is.list(result))
  expect_false(is.data.frame(result))
})

test_that("list elements are named after their files", {
  result <- tidy_bunch(dir_path)
  expect_true(all(nchar(names(result)) > 0))
})

test_that("list elements are tibbles", {
  result <- tidy_bunch(dir_path)
  expect_true(all(vapply(result, inherits, logical(1), "tbl_df")))
})

test_that("combine = TRUE returns a tibble", {
  expect_s3_class(tidy_bunch(dir_path, combine = TRUE), "tbl_df")
})

# Combined output structure ---------------------------------------------
test_that("combined output has country and year columns", {
  result <- tidy_bunch(dir_path, combine = TRUE)
  expect_true(all(c("country", "year") %in% colnames(result)))
})

test_that("combined output has one column per indicator", {
  result <- tidy_bunch(dir_path, combine = TRUE)
  indicators <- setdiff(colnames(result), c("country", "year"))
  expect_equal(length(indicators), length(list.files(dir_path, pattern = "[.](csv|xlsx|xls)$")))
})

# Error handling --------------------------------------------------------
test_that("errors on non-existent directory", {
  expect_error(tidy_bunch("nonexistent/path"), "Directory not found")
})

test_that("errors on empty directory", {
  expect_error(tidy_bunch(empty_dir), "No .csv, .xlsx, or .xls files found")
})

# Cleanup
unlink(empty_dir, recursive = TRUE)
