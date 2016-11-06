## summarize, n(), and finding max/min values
ext_tracks %>%
  summarize(n_obs = n(),
            worst_wind = max(max_wind),
            worst_pressure = min(min_pressure))

## using your own function in summarize
## function converting knots into kmh
knots_to_kmh <- function(knots) {
  kmh <- knots * 1.852
}

## now summarize
ext_tracks %>%
  summarize(n_obs = n(),
            worst_wind = knots_to_kmh(max(max_wind)),
            worst_pressure = min(min_pressure))

## grouping data
ext_tracks %>%
  group_by(storm_name, year) %>%
  head()

## grouping and summarizing
ext_tracks %>%
  group_by(storm_name, year) %>%
  summarize(n_obs = n(),
            worst_wind = knots_to_kmh(max(max_wind)),
            worst_pressure = min(min_pressure))

## using ggplot2 to plot summary
ext_tracks %>%
  group_by(storm_name) %>%
  summarize(worst_wind = knots_to_kmh(max(max_wind))) %>%
  ggplot(aes(x = worst_wind)) + geom_histogram()
