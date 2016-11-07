## install.packages("faraway")
library(faraway)
data(worldcup)

## move player names from rownames to column
worldcup <- worldcup %>%
  mutate(player_name = rownames(worldcup))
worldcup %>% slice(1:5)

## create a new column with avg shots per position
worldcup <- worldcup %>%
  group_by(Position) %>%
  mutate(avg_shots = mean(Shots)) %>%
  ungroup()

worldcup %>%
  slice(1:10)

## rename a column
worldcup <- worldcup %>%
  rename(Player = player_name)

worldcup %>%
  slice(1:3)
