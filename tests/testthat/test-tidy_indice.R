df <- system.file("extdata", "children_per_woman_total_fertility.xlsx",
                  package = "tidygapminder")

txt <- system.file("extdata", "testfile.txt",
                  package = "tidygapminder")

test_that("Output a data frame", {
  expect_true(is.data.frame(tidy_indice(df)))
})

test_that("Colnames are right", {
  expect_equal(colnames(tidy_indice(df)),
               c("country", "year", "children_per_woman_total_fertility"))
})

test_that("Output error if ext is not csv or xlsx", {
  expect_error(tidy_indice(txt))
})
