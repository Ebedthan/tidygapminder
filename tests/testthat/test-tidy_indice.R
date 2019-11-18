df <- system.file("extdata", "children_per_woman_total_fertility.xlsx", package = "tidygapminder")

test_that("Output a data frame", {
  expect_output(is.data.frame(tidy_indice(df)), TRUE)
})
