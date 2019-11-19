dir_path <- system.file("extdata", "gapminder", package = "tidygapminder")

test_that("Output a list of data frame", {
  expect_true(is.list(tidy_bunch(dir_path)))
})

test_that("Output a big data frame", {
  expect_true(is.data.frame(tidy_bunch(dir_path, merge = TRUE)))
})
