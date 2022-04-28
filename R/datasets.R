#' Mutant Ape Yacht Club Selected Assets
#'@format A data frame with 12,554 entries, one entry for individual events:
#'\describe{
#'  \item{asset_id}{ID number for a specfic collection}
#'  \item{asset_token_id}{ID number for a specific token within the collection}
#'  \item{collection_slug}{The name of the collection}
#'  \item{contract_address}{Address where the contract is deployed on ethereum}
#'  \item{created_date}{When the event was recorded}
#'  \item{event_type}{Describes the event type. This can be: created for new auctions, successful for sales, cancelled for cancelled auctions, bid_entered, bid_withdrawn, transfer, offer_entered, or approve}
#'  \item{starting_price}{The initial price of the token}
#'  \item{bid_price}{The price at which the token was bid at}
#'  \item{ending_price}{The price for which the token is sold for}
#'  \item{total_price}{The total price that the asset was bought for. This includes any royalties that might have been collected}
#'  \item{listing_time}{Date and time which the token was listed on Opensea}
#'  \item{asset_num_sales}{Total number of times that assets has been sold}
#'  \item{asset_permalink}{The link to the Opensea asset}
#'}
"mayc_assets"

#' Mutant Ape Yacht Club Average Price
#'@format A data frame with 227 entries, one entry for each day:
#'\describe{
#'  \item{date}{Date}
#'  \item{avgprice}{Average price of asset within MAYC collection}
#'  \item{volume}{Quantity of ETH traded during that day}
#'  \item{numsales}{Number of assets sold during that day}
#'}
"mayc_avg_price"
