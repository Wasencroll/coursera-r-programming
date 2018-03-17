library(lubridate)

ymd("2006-11-16")
ymd("'06 March 31")

ymd_hm("2006/3/7 6:45 am")

######

library(dplyr)
library(tidyr)

andrew_tracks <- ext_tracks %>%
  filter(storm_name == "ANDREW" & year == "1992") %>%
  select(year, month, day, hour, max_wind, min_pressure) %>%
  unite(datetime, year, month, day, hour) %>%
  mutate(datetime = ymd_h(datetime))

head(andrew_tracks, 3)

class(andrew_tracks$datetime)

## plotting data using ggplot2
andrew_tracks %>%
  gather(key = measure, value = value, -datetime) %>%
  ggplot(aes(x = datetime, y = value)) +
  geom_point() + ##geom_line() +
  facet_wrap(~ measure, nrow = 2, scales = "free_y")