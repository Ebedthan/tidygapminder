# tidy_indice
#
# This is the script of the tidy_indice function
# that tidy up a single indices file retrieved from
# gapminder in .xlsx files.
#
#
#
# You can download Gapminder indices at
#   https://www.gapminder.org/data/
#
#' @export
tidy_indice <- function(path = ".") {

  # Read data ---------------------------------
  df <- readxl::read_excel(path)

  # To store indice name and description that is in first
  # cell of gapminder sheet.
  file_desc <- colnames(df)[1]

  # Tidy data ---------------------------------
  names(df)[1] <- "country"
  df <- df %>%
    tidyr::pivot_longer(
      -country,
      names_to = "year",
      values_to = "indice"
      )
  df$year <- as.numeric(df$year)
  names(df)[3] <- file_desc

  # Return data -------------------------------
  df
}
