#' Tidy Gapminder indices data sheets (.xlsx file) stored in a folder using \code{\link{tidy_indice}}.
#'
#' @param path Absolute path to folder containing indices data sheets.
#' @param merge A boolean. If true, combines all indices data sheets in one. Default: FALSE.
#' @return List of indices data frames tidied (if \code{merge} = FALSE) or a single data frame
#'         of all indices tidied (if \code{merge} = TRUE).
#' @examples
#' library(tidygapminder)
#' dir_path <- paste0(getwd(), "/indices_dir")
#'
#' tidy_bunch(path = dir_path, merge = TRUE)
#'
#' \href{https://aebou.rbind.io/tidygapminder}{Package documentation}
#
#' @export
tidy_bunch <- function(path = ".", merge = FALSE, ...) {

  # Data import ---------------------------------------

  # Gapminder indices files souhl be in the same directory
  # to be grouped under a same indice group.
  file_list <- list.files(path, pattern = "[.](xls|xlsx)$", full.names = TRUE)

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
