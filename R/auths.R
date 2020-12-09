# auth.r
#

#' Auth
#'
#' @param user
#' @param pass
#' @param ...
#'
#' @return
#' @export
#'
#' @examples
gh_auth <- function(
  user = Sys.getenv("SEAMLESS_USER"),
  pass = Sys.getenv('SEAMLESS_PASS'),
  ...
){

  endpoint <- '/auth'
  resp <- httr::POST(
    paste0(base_url(), endpoint),
    add_headers(),
    body = jsonlite::toJSON(
      list(
        brand = 'SEAMLESS',
        client_id = "beta_seamless_ayNyuFxxVQYefSAhFYCryvXBPQc",
        email = user,
        password = pass
      ), auto_unbox = TRUE
    )
  )

  process_resp(resp)
}



process_resp <- function(resp) {

  jsonlite::fromJSON(
    httr::content(
      resp,
      'text', encoding = 'UTF-8'
    ), flatten = TRUE
  )

}
