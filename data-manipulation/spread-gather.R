data("VADeaths")
head(VADeaths)

library(tidyr)

## converting row names into separate column
VADeaths <- VADeaths %>%
  tbl_df() %>%
  mutate(age = row.names(VADeaths))
VADeaths

## gather everything but age to tidy data
VADeaths %>%
  gather(key = Category, value = death_rate, -age)

## using gather to plot data
library(tidyr)
library(ggplot2)

worldcup %>%
  select(Position, Time, Shots, Tackles, Saves) %>%
  gather(key = Type, value = Number, -Position, -Time) %>%
  ggplot(aes(x = Time, y = Number)) +
  geom_point() +
  facet_grid(Position ~ Type)

## pass summary per game for TOP4 of WorldCup 2010
install.packages("knitr")
library(knitr)


worldcup_tbl <- worldcup %>%
  filter(Team %in% c("Spain", "Germany", "Netherlands", "Uruguay")) %>%
  select(Team, Position, Passes, Time) %>%
  group_by(Team, Position) %>%
  summarize(avg_passes = mean(Passes/(Time/90)),
            min_passes = min(Passes/(Time/90)),
            max_passes = max(Passes/(Time/90)),
            pass_summary = paste0(round(avg_passes), " (",
                                  round(min_passes), ", ",
                                  round(max_passes), ")")) %>%
  select(Team, Position, pass_summary)

worldcup_tbl

## spreading data into nicer table format
worldcup_tbl %>%
  spread(Position, pass_summary) %>%
  kable()
