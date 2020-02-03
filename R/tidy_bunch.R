#' Tidy Gapminder indicator data sheets stored in a folder
#' using \code{\link{tidy_indice}}.
#'
#' @param dirpath Path to folder containing indices
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
#' folder_path <- system.file("extdata", package = "tidygapminder")
#'
#' tidy_bunch(folder_path)
#'
#' @export
tidy_bunch <- function(dirpath = ".", merge = FALSE, ...) {

  # Data import ---------------------------------------
  file_list <- list.files(dirpath,
                          pattern = "[.](csv|xlsx)$",
                          full.names = TRUE)

  # Tidy data -----------------------------------------
  df_list <- lapply(file_list, tidy_indice)


  # Return result -------------------------------------

  # Check if the user enable data frames to be
  # merged into one or not.

  if (merge == TRUE) {
    df <- Reduce(function(...) merge(..., all = T), df_list)
    df
  } else {
    df_list
  }
}
