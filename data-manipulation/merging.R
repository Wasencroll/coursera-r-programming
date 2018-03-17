## reading team standings
team_standings <- read_csv("../data/team_standings.csv")
team_standings %>%
  slice(1:3)

left_join(worldcup, team_standings, by = "Team")

## create a table of the top 5 players by shots on goal,
## as well as the final standing for each of these player’s teams, 
## using the worldcup and team_standings data. 

data(worldcup)
worldcup <- worldcup %>%
  mutate(Player = row.names(worldcup)) %>%
  select(Team, Player, Shots) %>%
  arrange(desc(Shots)) %>%
  slice(1:5) %>%
  left_join(team_standings, by = "Team") %>%
  select(Player, Shots, Team, Standing) %>%
  rename("Team Standing" = Standing) %>%
  kable()
worldcup
