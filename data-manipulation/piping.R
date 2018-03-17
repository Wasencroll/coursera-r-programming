## without piping
katrina <- filter(ext_tracks, storm_name == "KATRINA")
katrina_reduced <- select(katrina, month, day, hour, max_wind)
katrina1 <- head(katrina_reduced, 3)
katrina1

## nested functions
katrina2 <- head(select(filter(ext_tracks, storm_name == "KATRINA"), month, day, hour, max_wind), 3)
katrina2

##comparing output
identical(katrina1, katrina2)

## with piping
ext_tracks %>% 
  filter(storm_name == "KATRINA") %>%
  select(month, day, hour, max_wind) %>%
  head(3)