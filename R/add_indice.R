#' Tidy Gapminder indicator single data sheet.
#'
#' @param filepath Path to indice data sheet.
#' @param object Tidygapminder dataset object.
#'
#' @return Object with new file added.
#'
#'
#' @export
add_indice <- function(filepath, object){
  new_object <- tidygapminder::tidy_indice(filepath)

}
