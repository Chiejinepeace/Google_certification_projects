library(tidyverse)
hotel_bookings <- read_csv("hotel_bookings.csv")
str(hotel_bookings)
##data viz to show frequestly used distribution channel
ggplot(hotel_bookings, mapping= aes (x = distribution_channel) +
  geom_bar()
##Data viz to show distribution channel frequency for each deposit type
ggplot(hotel_bookings)  +
  geom_bar(mapping= aes (x = distribution_channel)) +
  facet_wrap(~deposit_type) +
  theme(axis.text.x = element_text(angle = 45) )
##Data viz to show distribution channel frequency for each deposit type inluding
##N/A values by using facet grid
ggplot(hotel_bookings)  +
  geom_bar(mapping= aes (x = distribution_channel)) +
  facet_grid(~deposit_type) +
  theme(axis.text.x = element_text(angle = 45) )
ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x = distribution_channel)) +
  facet_wrap(~deposit_type~market_segment) +
  theme(axis.text.x = element_text(angle = 45))
##Scatterplot showing relationship between lead time and guest who have children
ggplot(data = hotel_bookings) +
  geom_point(mapping = aes(x = lead_time, y = children))
##Viz showing that guest with children are more likely to book city hotel
ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x = hotel)) +
  facet_wrap(~children)
##Data viz showing relationship between lead time and guests with children 
## for online bookings at the city hotel
filtered_hotel_bookings <- hotel_bookings %>% 
  filter(hotel =="City Hotel" & market_segment == "Online TA")
View(filtered_hotel_bookings)
ggplot(data = filtered_hotel_bookings) +
  geom_point(mapping = aes(x = lead_time, y = children))
##Comparing hotels for each market segment
min_date <- min(hotel_bookings$arrival_date_year)
maxdate <- max(hotel_bookings$arrival_date_year)
ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x = market_segment)) +
  facet_wrap(~hotel) +
  theme(axis.text.x = element_text(angle = 45))+
  labs(title = "Comparison of market segments by hotel types for hotel bookings",
       caption = paste0( "Data from: ", min_date, " to ", maxdate), x = "Market Segments",
       y = "Number of bookings")
ggsave("hotel_booking_chart.png", width = 7, height = 7)
