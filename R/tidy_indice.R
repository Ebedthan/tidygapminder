#' Tidy Gapminder indicator single data sheet.
#'
#' @param filepath Path to indice data sheet.
#'
#' @return The indicator data sheet as a tidy data frame.
#'
#' @examples
#'
#' csv_filepath <- system.file("extdata/life_expectancy_years.csv",
#'                              package = "tidygapminder")
#' xlsx_filepath <- system.file(
#'                  "extdata/agriculture_land.xlsx",
#'                  package = "tidygapminder")
#'
#' tidy_indice(csv_filepath)
#' tidy_indice(xlsx_filepath)
#'
#' @export
tidy_indice <- function(filepath) {

  # Read data ---------------------------------
  # To enable reading of all format
  if (tools::file_ext(filepath) == "xlsx") {
    df <- readxl::read_xlsx(filepath)
  } else if (tools::file_ext(filepath) == "csv") {
    df <- data.table::fread(filepath, header = TRUE)
  } else {
    stop("Your file is not csv or xlsx formated")
  }

  # To store indice name and description that is in first
  # cell of gapminder sheet.
  if (colnames(df)[1] == "country") {
    file_desc <- basename(tools::file_path_sans_ext(filepath))
  } else {
    file_desc <- colnames(df)[1]
  }

  # Tidy data ---------------------------------
  names(df)[1] <- "country"
  df <- tidyr::pivot_longer(data = df,
                            cols = -"country",
                            names_to = "year",
                            values_to = "indice"
                            )
  df$year <- as.numeric(df$year)
  names(df)[3] <- file_desc

  # Return data -------------------------------
  df
}
