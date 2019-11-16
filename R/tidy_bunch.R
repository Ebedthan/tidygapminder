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

tidy_bunch <- function(path = ".", recursive = FALSE) {

  # Data import ---------------------------------------

  # list files in indicated directory
  file_list <- list.files(path, pattern = "[.](xls|xlsx)$", full.names = TRUE, recursive = recursive)

  # read listed file in a data frame list
  df_list <- lapply(file_list, readxl::read_excel)

  # Data transformation -------------------------------

  # initialise empty vector
  desc_vec <- c()

  # Typically, gapminder data sheets contains indicator description in
  # first cell of data sheet. We read this description to use it further
  # as the column name of the indicator
  for (df in df_list) {
    desc_vec <- c(desc_vec, colnames(df)[1])
  }

  # Core tidy up: we take the dataframe in list and assign
  # the country column name, and tidy it up using tidyr
  # appropriate function and change year column to numeric
  df_list <- lapply(df_list, function(df) {
    names(df)[1] <- "country"
    df <- df %>% dplyr::gather(year, indice, -country)
    df$year <- as.numeric(df$year)
    df
  })

  # We now loop through the desc_vec to assign the right name
  # of the indicator to the right data frame at the right column
  for (i in 1:length(desc_vec)) {
    names(df_list[[i]])[3] <- desc_vec[i]
  }

  # Return result ------------------------------------
  df_list
}
