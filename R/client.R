#' Base url
#'
#' @return
#' @export
base_url <- function() {
  'https://api-gtm.grubhub.com'
}


add_headers <- function() {
  httr::add_headers(
    'Accept'='text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8',
    'Accept-Encoding'=	'gzip, deflate, br',
    'Accept-Language'='en-US,en;q=0.5',
    Connection='keep-alive',
    'Content-Type'=	'application/json;charset=UTF-8',
    Host='api-gtm.grubhub.com',
    'User-Agent'='Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:83.0) Gecko/20100101 Firefox/83.0'
  )
}
