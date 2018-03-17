library(httr)

## reading weather data for Hamburg
meso_url <- "https://mesonet.agron.iastate.edu/cgi-bin/request/asos.py/"
hamburg <- GET(url = meso_url,
               query = list(station = "EDDH",
                            data = "tmpc",
                            year1 = "2016",
                            month1 = "6",
                            day1 = "1",
                            year2 = "2016",
                            month2 = "8",
                            day2 = "31",
                            tz = "America/New_York",
                            format = "comma")) %>%
  content() %>%
  read_csv(skip = 5, na = "M")

hamburg %>% filter(tmpc > 30) ## %>% slice(1:5)