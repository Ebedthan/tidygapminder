#' Tidy Gapminder indicator data sheets stored in a folder
#' using \code{\link{tidy_indice}}.
#'
#' @param dirpath Absolute path to folder containing indices
#'    data sheets.
#' @param merge A boolean. If true, combines all indices data sheets
#'    in one. Default: FALSE.
#' @param ... Ellipsis.
#' @return List of indices data frames tidied (if \code{merge} = FALSE)
#'    or a single data frame of all indices tidied
#'    (if \code{merge} = TRUE).
#'
#' @examples
#'
#' folder_path <- system.file("extdata/gapminder", package = "tidygapminder")
#'
#' tidy_bunch(folder_path)
#'
#' @export
tidy_bunch <- function(dirpath = ".", merge = FALSE, ...) {

  # Data import ---------------------------------------

  # Gapminder indices files souhl be in the same directory
  # to be grouped under a same indice group.
  message("We take in only csv or xlsx files")

  file_list <- list.files(dirpath, pattern = "[.](csv|xlsx)$",
                          full.names = TRUE)

  # Tidy data ---------------------------------------

  # To tidy all data once
  df_list <- lapply(file_list, tidy_indice)

  # Return result ------------------------------------

  # Check if the user enable data frames to be merged into one
  # or not.
  if (merge == TRUE) {
    df <- dplyr::bind_rows(df_list)
    df
  } else {
    df_list
  }
}
