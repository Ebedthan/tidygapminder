#' Tidy Gapminder indicator data sheets stored in a folder.
#'
#' Applies \code{\link{tidy_index}} to all Gapminder data sheets found in a
#' directory and optionally combines them into a single data frame.
#'
#' @param dirpath Path to folder containing indices Gapminder indicator data sheets.
#'   Defaults to the current working directory.
#'
#' @param combine A boolean. If \code{TRUE}, combines all tidied data sheets
#'    into a single data frame joined on \code{country} and \code{year}.
#'    Default:  \code{FALSE}.
#'
#' @param ... Additional arguments (reserved for future use).
#'
#' @return If \code{combine = FALSE} (default), a named list of tibbles, one per file.
#'   If \code{combine = TRUE}, a single tibble with all indicators merged by
#'   \code{country} and \code{year}.
#'
#' @examples
#' folder_path <- system.file("extdata", package = "tidygapminder")
#'
#' tidy_bunch(folder_path)
#' tidy_bunch(folder_path, combine = TRUE)
#'
#' @export
tidy_bunch <- function(dirpath = ".", combine = FALSE, ...) {

  # Validate input ------------------------------------
  if(!dir.exists(dirpath)) {
    stop("Directory not found: ", dirpath)
  }

  file_list <- list.files(dirpath,
                          pattern = "[.](csv|xlsx|xls)$",
                          full.names = TRUE)

  if (length(file_list) == 0) {
    stop("No .csv, .xlsx, or .xls files found in: ", dirpath)
  }

  # Tidy each file -----------------------------------------
  df_list <- lapply(file_list, tidy_index)
  names(df_list) <- basename(tools::file_path_sans_ext(file_list))


  # Return result -------------------------------------
  if (combine) {
    tibble::as_tibble(
      Reduce(
        function(x, y) merge(x, y, by = c("country", "year"), all = TRUE),
        df_list
      )
    )
  } else {
    df_list
  }
}
