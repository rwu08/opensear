#' Retrieve collection data supported by OpenSea API
#' @param queryString a list of options
#' @param api_key OpenSea API key
#' @param asset_owner Asset owner contract address
#' @param ... currently ignored

#' @references https://docs.opensea.io/reference/collection-model
#' @importFrom dplyr %>%
#' @export
#' @source OpenSea
#' @examples
#' read_os_collection()
#' read_os_collection(list(limit = "20"))
#' read_os_collection(api_key = "6dd0b79cbb934d72853ad157a14f78ca")
#' read_os_collection(asset_owner = "0x148089038088cC49CDcF26e0f96776c25e5CfACd")


read_os_collection <- function(queryString = list(offset = "0",
                                                  limit = "300"),
                               api_key = NULL,
                               asset_owner = NULL,
                               ...) {
  url <- "https://api.opensea.io/api/v1/collections"

  if (!is.null(api_key)) {
    config_list = list(httr::add_headers(X_API_KEY = api_key))
  } else {
    config_list = list()
  }
  if (!is.null(asset_owner)) {
    config_list = list(asset_owner)
  } else{
    config_list = list()
  }

  response <- httr::GET(
    url,
    config = config_list,
    query = queryString,
    httr::content_type("application/octet-stream")
  )

  x <- httr::content(response, "text")

  x %>%
    jsonlite::fromJSON() %>%
    purrr::pluck(1) %>%
    jsonlite::flatten() %>%
    tibble::as_tibble()
}
