
library(tidyverse)
library(stringr)
library(lubridate)
library(devtools)
library(usethis)
library(janitor)

#Adding Mutant Ape Yacht Club data for 85 assets
mayc_assets<-
  "data-raw/mayc_assets.csv"%>%
  read_csv()%>%
  clean_names()%>%
  select(asset_id,asset_token_id, collection_slug, contract_address, created_date, event_type, starting_price, bid_price, ending_price, total_price, listing_time, asset_num_sales, asset_permalink)%>%
  mutate(
    created_date = ymd_hms(created_date),
    listing_time = ymd_hms(listing_time)
  )
usethis::use_data(mayc_assets, overwrite = TRUE)






