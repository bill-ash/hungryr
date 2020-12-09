# Test orders


testthat::test_that('Grab full order history', {

  # Builds a URL using me::UUID
  me <- gh_auth()
  str(me$credential)
  me$credential$ud_id

  # Authenticates the request with a bearer token
  # Bearer token
  str(me$session_handle)
  me$session_handle$access_token


  # Builds the request for requesting past orders:
  # /diners/me::UUID/search_listing?query_parameters
  # Loop through each page until you arrive at the end. Might get mad trying
  # to request every order at once.
  # GET https://api-gtm.grubhub.com/diners/me::UUID/search_listing?pageNum=1&pageSize=20&facet=scheduled:false,orderType:ALL&sorts=default

  # Query up to 10000 items at once

  page_size <- 90
  page_num <- 1

  order_resp <- httr::GET(
    paste0(
      base_url(),
      '/diners/',
      me$credential$ud_id,
      '/search_listing?pageNum=', page_num,
      '&pageSize=', page_size,
      '&facet=scheduled:false,orderType:ALL&sorts=default'),
    add_headers(),
    httr::add_headers(
      'Authorization'=paste0('Bearer ', me$session_handle$access_token)
    ), httr::verbose()
  )


  z <- process_resp(order_resp)['results'] %>%
    as.data.frame() %>%
    flatten() %>%
    as_tibble()

  z %>% View

  response <- get_orders(me, pageNum = 1, pageSize = 100)

  response %>%
    unnest(results.restaurants)



})

