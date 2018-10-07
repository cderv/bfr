json_prevision <- "http://www.bison-fute.gouv.fr/previsions/previsions.json"

only_departements <- seq_len(94)

get_prevision_json <- function(json = json_prevision) {
  jsonlite::fromJSON(json)
}


#' Get all data available at the current date
#'
#' bison fute website uses data from past date and future date
#' for its previsions color of departement. See http://www.bison-fute.gouv.fr/previsions,10564.html
#'
#' @return a tibble
#'
#' @importFrom tibble tibble
#' @importFrom tidyr unnest
#' @importFrom purrr map modify_depth simplify_all
#' @export
get_all_previsions_available <- function() {
  res <- get_prevision_json()
  prev_bf <- tibble::tibble(
    days = res$days,
    depts = list(res$deptsLine[only_departements]),
    depart = purrr::map(res$values, ~strsplit(.x[only_departements], split = ",")) %>%
      purrr::modify_depth(2, 1) %>%
      purrr::simplify_all(),
    retour = purrr::map(res$values, ~strsplit(.x[only_departements], split = ",")) %>%
      purrr::modify_depth(2, 2) %>%
      purrr::simplify_all()
  ) %>%
    tidyr::unnest()
  prev_bf
}


