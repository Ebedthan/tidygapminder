df <- system.file("extdata", "life_expectancy_years.csv",
                  package = "tidygapminder")

test_that("Output a data frame", {
  expect_true(is.data.frame(tidy_indice(df)))
})

test_that("Colnames are right", {
  expect_equal(colnames(tidy_indice(df)),
               c("country", "year", "life_expectancy_years"))
})
