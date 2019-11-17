# tidy_bunch
#
# This is the script of the tidy_bunch function
# that tidy up a bunch of indices retrieved from
# gapminder in .xlsx files.
#
# The function takes as arguments the folder
# containing all indices files retrieved.
#
#
# You can download Gapminder indices at
#   https://www.gapminder.org/data/
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
