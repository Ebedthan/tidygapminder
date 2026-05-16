csv_path  <- system.file("extdata/life_expectancy_years.csv",
                         package = "tidygapminder")
xlsx_path <- system.file("extdata/agriculture_land.xlsx",
                         package = "tidygapminder")

# Output type -----------------------------------------------------------
test_that("returns a tibble for csv input", {
  expect_s3_class(tidy_index(csv_path), "tbl_df")
})

test_that("returns a tibble for xlsx input", {
  expect_s3_class(tidy_index(xlsx_path), "tbl_df")
})

# Column names ----------------------------------------------------------
test_that("csv output has correct column names", {
  expect_equal(colnames(tidy_index(csv_path)),
               c("country", "year", "life_expectancy_years"))
})

test_that("xlsx output has correct column names", {
  expect_equal(colnames(tidy_index(xlsx_path)),
               c("country", "year", "Agricultural land (% of land area)"))
})

# Column types ----------------------------------------------------------
test_that("year column is numeric", {
  expect_type(tidy_index(csv_path)$year, "double")
})

test_that("country column is character", {
  expect_type(tidy_index(csv_path)$country, "character")
})

# Error handling --------------------------------------------------------
test_that("errors on non-existent file", {
  expect_error(tidy_index("nonexistent/path/file.csv"),
               "Input file not found")
})

test_that("errors on unsupported file extension", {
  tmp <- tempfile(fileext = ".ods")
  file.create(tmp)
  expect_error(tidy_index(tmp), "Unsupported file extension")
  unlink(tmp)
})

# Deprecation -----------------------------------------------------------
test_that("tidy_indice is deprecated and still works", {
  expect_warning(result <- tidy_indice(csv_path), "deprecated")
  expect_s3_class(result, "tbl_df")
})
