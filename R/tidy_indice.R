#' Tidy Gapminder indice single data sheet.
#'
#' @param path Absolute path to folder to indice data sheet.
#'
#' @return The indice data sheet as a tidy data frame.
#'
#'
#' @export
tidy_indice <- function(filepath) {

  # Read data ---------------------------------
  # To enable reading of all format
  if (tools::file_ext(filepath) == "xlsx") {
    df <- readxl::read_xlsx(filepath)
  } else if (tools::file_ext(filepath) == "xls") {
    df <- readxl::read_xls(filepath)
  } else if (tools::file_ext(filepath) == "csv") {
    df <- data.table::fread(filepath)
  } else {
    stop("Your file is not csv or xls|xlsx formated")
  }

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
