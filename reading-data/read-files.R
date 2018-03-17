library(readr)

## reading local files

teams <- read_csv("../data/team_standings.csv")
teams

teams <- read_csv("../data/team_standings.csv", col_types = "ic", n_max = 7)
teams

## reading online files
## assigning url
ext_tracks_files <- paste0("http://rammb.cira.colostate.edu/research/",
                           "tropical_cyclones/tc_extended_best_track_dataset/",
                           "data/ebtrk_atlc_1988_2015.txt")

## vector with column widths
ext_tracks_widths <- c(7, 10, 2, 2, 3, 5, 5, 6, 4, 5, 4, 4, 5, 3, 4, 3, 3, 3,
                       4, 3, 3, 3, 4, 3, 3, 3, 2, 6, 1)

## vector with column names
ext_tracks_colnames <- c("storm_id", "storm_name", "month", "day",
                         "hour", "year", "latitude", "longitude",
                         "max_wind", "min_pressure", "rad_max_wind",
                         "eye_diameter", "pressure_1", "pressure_2",
                         paste("radius_34", c("ne", "se", "sw", "nw"), sep = "_"),
                         paste("radius_50", c("ne", "se", "sw", "nw"), sep = "_"),
                         paste("radius_64", c("ne", "se", "sw", "nw"), sep = "_"),
                         "storm_type", "distance_to_land", "final")

## loading the file
ext_tracks <- read_fwf(ext_tracks_files, fwf_widths(ext_tracks_widths, ext_tracks_colnames), na = "-99")

## dimensions
ext_tracks[1:3, 1:9]


library(dplyr)

ext_tracks %>%
  filter(storm_name == "KATRINA") %>%
  select(month, day, hour, max_wind, min_pressure, rad_max_wind) %>%
  sample_n(8)

## loading yet another csv file from the web
zika_file <- paste0("https://raw.githubusercontent.com/cdcepi/zika/",
                    "master/Brazil/COES_Microcephaly/data/COES_Microcephaly-2016-06-25.csv")
ext_zika <- read_csv(zika_file)
ext_zika %>% select(location, value, unit)
