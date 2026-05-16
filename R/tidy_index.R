#' Tidy a Gapminder indicator data sheet.
#'
#' @param filepath Path to a Gapminder indicator data sheet (.csv, .xlsx, or .xls).
#'
#' @return The indicator data sheet as a tidy data frame with columns
#'    \code{country}, \code{year}, and the indicator name.
#'
#' @examples
#' csv_filepath <- system.file("extdata/life_expectancy_years.csv",
#'                              package = "tidygapminder")
#' xlsx_filepath <- system.file(
#'                  "extdata/agriculture_land.xlsx",
#'                  package = "tidygapminder")
#'
#' tidy_index(csv_filepath)
#' tidy_index(xlsx_filepath)
#'
#' @export
tidy_index <- function(filepath) {

  # Validate input ---------------------------------
  if(!file.exists(filepath)) {
    stop("Input file not found: ", filepath)
  }

  ext <- tolower(tools::file_ext(filepath))

  # Read data --------------------------------------
  df <- switch(
    ext,
    csv = utils::read.csv(filepath, stringsAsFactors = FALSE, check.names = FALSE),
    xlsx = readxl::read_xlsx(filepath),
    xls = readxl::read_xls(filepath),
    stop("Unsupported file extension: '.", ext, "'. Supported formats are .csv, .xlsx, and .xls")
  )

  # Extract indicator name --------------------------------
  # Gapminder sheets store the indicator name in cell A1.
  # If the first column is already named "country", fall back to filename
  if (tolower(colnames(df)[1]) == "country") {
    indicator <- basename(tools::file_path_sans_ext(filepath))
  } else {
    indicator <- colnames(df)[1]
  }

  # Tidy data ---------------------------------
  names(df)[1] <- "country"

  df_long <- stats::reshape(
    as.data.frame(df),
    varying = names(df)[-1],
    v.names = "value",
    timevar = "year",
    times = names(df)[-1],
    idvar = "country",
    direction = "long"
  )
  df_long$id <- NULL
  rownames(df_long) <- NULL

  # Coerce year to numeric with warning on failure
  year_num <- suppressWarnings(as.numeric(df_long$year))
  if (anyNA(year_num)) {
    warning("Some year values could not be coerced to numeric and were set to NA.")
  }
  df_long$year <- year_num

  # Rename value column to indicator name
  names(df_long)[names(df_long) == "value"] <- indicator

  # Return data, reorder columns: country, year, indicator
  tibble::as_tibble(df_long[, c("country", "year", indicator)])
}

#' @rdname tidy_index
#' @export
tidy_indice <- function(filepath) {
  .Deprecated("tidy_index")
  tidy_index(filepath)
}
