# tidy_bunch
#
# This is the script of the tidy_bunch function
# that tidy up a bunch of indices retrieved from
# gapminder in .xlsx files.
#
# The function takes aas arguments the folder
# containing all indices files retrieved.
#
#
# You can download Gapminder indices at
#   https://www.gapminder.org/data/
#

tidy_bunch <- function(path = ".", merge = FALSE) {

  # Data import ---------------------------------------

  # Gapminder indices files souhl be in the same directory
  # to be grouped under a same indice group.
  file_list <- list.files(path, pattern = "[.](xls|xlsx)$", full.names = TRUE)

  # To read all files once
  df_list <- lapply(file_list, readxl::read_excel)

  # Data transformation -------------------------------

  desc_vec <- c()

  # Typically, gapminder data sheets contains indicator description in
  # first cell of data sheet. We read this description to use it further
  # as the column name of the indicator.
  for (df in df_list) {
    desc_vec <- c(desc_vec, colnames(df)[1])
  }

  # Core tidy up: we take the dataframe in list and assign
  # the country column name, and tidy it up using tidyr
  # appropriate function and change year column to numeric.
  df_list <- lapply(df_list, function(df) {
    names(df)[1] <- "country"
    df <- df %>% tidyr::gather(year, indice, -country)
    df$year <- as.numeric(df$year)
    df
  })

  # Assign the right name of the indicator to the right
  # data frame at the right column.
  for (i in 1:length(desc_vec)) {
    names(df_list[[i]])[3] <- desc_vec[i]
  }

  # Return result ------------------------------------

  # Check if the user enable data frames to be merged into one
  # or not.
  if (merge == TRUE){
    df <- dplyr::bind_rows(df_list)
    df
  } else {
    df_list
  }

}
