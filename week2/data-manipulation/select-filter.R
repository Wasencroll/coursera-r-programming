## basic select of columns
ext_tracks %>%
  select(storm_name, month, day, hour, year, latitude, longitude, max_wind)

## selecting columns based on name
ext_tracks %>%
  select(storm_name, latitude, longitude, starts_with("radius_34"))

ext_tracks %>%
  select(storm_name, ends_with("tude"), ends_with("ne"))

ext_tracks %>%
  select(storm_name, contains("50"))

ext_tracks %>%
  select(storm_name, matches("_[0-9][0-9]_"))

## filtering
ext_tracks %>%
  select(storm_name, hour, max_wind) %>%
  filter(storm_name %in% c("KATRINA", "ANDREW"))

ext_tracks %>%
  select(storm_name, hour, max_wind) %>%
  filter(storm_name %in% c("KATRINA", "ANDREW"), hour == "00")

## combine summarize & filter
ext_tracks %>%
  group_by(storm_name, year) %>%
  summarize(worst_wind = knots_to_kmh(max(max_wind))) %>%
  filter(worst_wind >= 240)

## multiple logical operations
ext_tracks %>%
  select(storm_name, year, month, day, hour, latitude, longitude, max_wind) %>%
  filter(storm_name == "ANDREW" & max_wind >= 137)

