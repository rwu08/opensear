library(tidyverse)

mayc_avg_price$date<-as.Date(mayc_avg_price$date, "%d-%b-%y")
mayc_avg_price_filtered<-mayc_avg_price%>%
  filter(date<="2021-09-30")
example_plot<-ggplot(data = mayc_avg_price, aes(x = date, y = avgprice, color = volume))+
  geom_point()+
  scale_color_opensea(palette = "dark", discrete = FALSE, reverse = TRUE)


test_that("Printing logo on ggplot object is successful",{
  graph<-add_logo(example_plot)
  expect_error(print(graph),NA)
})
