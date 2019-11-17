#' Tidy Gapminder indice single data sheet (.xlsx file).
#'
#' @param path Absolute path to folder to indice data sheet.
#'
#' @return The indice data sheet as a tidy data frame.
#' @examples
#' library(tidygapminder)
#'
#' tidy_indice(path = "filename.xlsx")
#'
#'
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
