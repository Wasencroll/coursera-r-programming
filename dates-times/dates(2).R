## pulling out date/time elements from a date-time class

andrew_tracks %>%
  select(datetime) %>%
  mutate(year = year(datetime),
         month_written = months(datetime),
         month_number = month(datetime),
         weekday = weekdays(datetime),
         yearday = yday(datetime),
         hour = hour(datetime)) %>%
  slice(1:5)

## plot different time groupings

check_tracks <- ext_tracks %>%
  select(month, day, hour, year, max_wind) %>%
  unite(datetime, year, month, day, hour) %>%
  mutate(datetime = ymd_h(datetime),
         weekday = weekdays(datetime),
         weekday = factor(weekday, levels = c("måndag", "tisdag", "onsdag", "torsdag",
                                     "fredag", "lördag", "söndag")),
         month = months(datetime),
         month = factor(month, levels = c("januari", "februari", "mars", "april", "maj", "juni",
                                 "juli", "augusti", "september", "oktober", "november", "december")))

check_weekdays <- check_tracks %>%
  group_by(weekday) %>%
  summarize(avg_max_wind = mean(max_wind)) %>%
  rename(grouping = weekday)

check_months <- check_tracks %>%
  group_by(month) %>%
  summarize(avg_max_wind = mean(max_wind)) %>%
  rename(grouping = month)

a <- ggplot(check_weekdays, aes(x = grouping, y = avg_max_wind)) +
  geom_bar(stat = "identity") + xlab("")
b <- a %+% check_months

library(gridExtra)
grid.arrange(a, b, ncol = 1)