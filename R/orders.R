# get orders


#' Get orders
#'
#' Get all past orders.
#'
#' Builds a special URL to look at all of your orders referred to by:
#'
#' @param GH
#' @param page_size
#' @param page_num
#' @param ... ...
#'
#' @return Dataframe of orders
#' @export
#'
#' @examples \dontrun{
#'
#' get_orders(gh_auth(), 90, 1)
#'
#'
#' }
get_orders <- function(
  GH = NULL,
  pageNum = 1,
  pageSize = 20,
  ...
) {

  endpoint <- paste0(
    '/diners/',
    GH$credential$ud_id,
    '/search_listing?pageNum=', pageNum,
    '&pageSize=', pageSize,
    '&facet=scheduled:false,orderType:ALL&sorts=default')

  resp <- httr::GET(
    paste0(base_url(), endpoint),
    add_headers(),
    httr::add_headers(
      'Authorization'=paste0('Bearer ', GH$session_handle$access_token)
    )
  )

  process_resp(resp)['results'] %>%
    as.data.frame() %>%
    jsonlite::flatten() %>%
    dplyr::as_tibble()

}

