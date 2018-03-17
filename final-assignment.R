## install.packages(c("dplyr", "tidyr", "readr", "readxl"))
library(tidyr)
library(dplyr)
library(readr)
library(readxl)

data_file <- read_csv("../data/daily_SPEC_2014.csv.bz2")

head(data_file)
str(data_file)
names(data_file) <- gsub(" +", ".", names(data_file))

## question 1
data_file %>%
  filter(State.Name == "Wisconsin",
         Parameter.Name == "Bromine PM2.5 LC") %>%
  select(State.Name, Parameter.Name, Arithmetic.Mean) %>%
  group_by(State.Name, Parameter.Name) %>%
  summarize(avg_value = mean(Arithmetic.Mean, na.rm = TRUE)) %>%
  select(State.Name, Parameter.Name, avg_value)

## question 2
data_file %>%
  select(Parameter.Name, Arithmetic.Mean) %>%
  group_by(Parameter.Name) %>%
  summarize(avg_value = mean(Arithmetic.Mean, na.rm = TRUE)) %>%
  arrange(desc(avg_value))

## question 3
data_file %>%
  filter(Parameter.Name == "Sulfate PM2.5 LC") %>%
  select(State.Code, County.Code, Site.Num, Parameter.Name, Arithmetic.Mean) %>%
  group_by(State.Code, County.Code, Site.Num) %>%
  summarize(avg_value = mean(Arithmetic.Mean, na.rm = TRUE)) %>%
  arrange(desc(avg_value)) %>%
  select(State.Code, County.Code, Site.Num, avg_value)

## question 4
no_4 <- data_file %>%
  filter(State.Name %in% c("California", "Arizona"), Parameter.Name == "EC PM2.5 LC TOR") %>%
  select(State.Name, Parameter.Name, Arithmetic.Mean) %>%
  group_by(State.Name, Parameter.Name) %>%
  summarize(avg_value = mean(Arithmetic.Mean, na.rm = TRUE)) %>%
  select(State.Name, Parameter.Name, avg_value)
diff(no_4$avg_value)

## question 5
data_file %>%
  filter(Parameter.Name=="OC PM2.5 LC TOR", Longitude < -100) %>%
  select(Parameter.Name, Arithmetic.Mean) %>%
  group_by(Parameter.Name) %>%
  summarize(median_west = median(Arithmetic.Mean, na.rm = TRUE))

## question 6
install.packages("readxl")
library(readxl)

meta_file <- read_excel("../data/aqs_sites.xlsx")
warnings()
names(meta_file) <- gsub(" +", ".", names(meta_file))

head(meta_file)
str(meta_file)

meta_file %>%
  filter(Land.Use=="RESIDENTIAL", Location.Setting=="SUBURBAN") %>%
  select(Land.Use, Location.Setting) %>%
  group_by(Land.Use, Location.Setting) %>%
  summarize(n_obs = n()) %>%
  select(Land.Use, Location.Setting, n_obs)

## question 7
library(stringr)
meta_file <- read_excel("../data/aqs_sites.xlsx")
warnings()
names(meta_file) <- gsub(" +", ".", names(meta_file))

meta_file <- meta_file %>%
  mutate(State.Code = str_pad(as.character(State.Code), width = 2, side = "left", pad = "0"),
        County.Code = str_pad(as.character(County.Code), width = 3, side = "left", pad = "0"),
        Site.Number = str_pad(as.character(Site.Number), width = 4, side = "left", pad = "0")) %>%
  rename(Site.Num = Site.Number)

data_file %>%
  ##filter(Parameter.Name == "EC PM2.5 LC TOR", 
   ##      Longitude >= -100 & !is.na(Longitude)) %>%
  select(State.Code, County.Code, Site.Num, Parameter.Name, Arithmetic.Mean) %>%
  inner_join(meta_file, by = c("State.Code", "County.Code", "Site.Num")) %>%
  select(State.Code, County.Code, Site.Num, Parameter.Name, Arithmetic.Mean, Longitude, Land.Use, Location.Setting) %>%
  filter(Parameter.Name == "EC PM2.5 LC TOR", 
         Longitude >= -100, ##& !is.na(Longitude),
         Land.Use == "RESIDENTIAL",
         Location.Setting == "SUBURBAN") %>%
  group_by(Land.Use, Location.Setting) %>%
  summarize(value = median(Arithmetic.Mean, na.rm = TRUE))

## question 8
data_file %>%
  select(State.Code, County.Code, Site.Num, Parameter.Name, Date.Local, Arithmetic.Mean) %>%
  inner_join(meta_file, by = c("State.Code", "County.Code", "Site.Num")) %>%
  select(Parameter.Name, Arithmetic.Mean, Land.Use, Date.Local) %>%
  mutate(month = months(Date.Local),
         month = factor(month, levels = c("januari", "februari", "mars", "april", "maj", "juni",
                                          "juli", "augusti", "september", "oktober", "november", "december"))) %>%
  filter(Parameter.Name == "Sulfate PM2.5 LC",
         Land.Use == "COMMERCIAL") %>%
  group_by(month, Parameter.Name) %>%
  summarize(avg_value = mean(Arithmetic.Mean, na.rm = TRUE)) %>%
  arrange(desc(avg_value))

## question 9
data_file %>%
  filter(Parameter.Name == "Sulfate PM2.5 LC" |
         Parameter.Name == "Total Nitrate PM2.5 LC",
         State.Code == "06",
         County.Code == "065",
         Site.Num == "8001") %>%
  select(State.Code, County.Code, Site.Num, Parameter.Name, Date.Local, Arithmetic.Mean) %>%
  group_by(Date.Local, Parameter.Name) %>%
  summarize(value = mean(Arithmetic.Mean, na.rm = TRUE)) %>%
  group_by(Date.Local) %>%
  summarize(value = sum(value)) %>%
  filter(value > 10)

## question 10
avg_sul <- data_file %>%
  filter(Parameter.Name == "Sulfate PM2.5 LC" ) %>% ##|
          ## Parameter.Name == "Total Nitrate PM2.5 LC") %>%
  select(State.Code, County.Code, Site.Num, Parameter.Name, Arithmetic.Mean, Date.Local) %>%
  group_by(State.Code, County.Code, Site.Num, Parameter.Name, Date.Local) %>%
  summarize(sulfate = mean(Arithmetic.Mean, na.rm = TRUE)) %>%
  group_by(State.Code, County.Code, Site.Num, Parameter.Name) %>%
  summarize(sulfate = mean(sulfate))

avg_nit <- data_file %>%
  filter(##Parameter.Name == "Sulfate PM2.5 LC" ) %>% |
   Parameter.Name == "Total Nitrate PM2.5 LC") %>%
  select(State.Code, County.Code, Site.Num, Parameter.Name, Arithmetic.Mean, Date.Local) %>%
  group_by(State.Code, County.Code, Site.Num, Parameter.Name, Date.Local) %>%
  summarize(nitrate = mean(Arithmetic.Mean, na.rm = TRUE)) %>%
  group_by(State.Code, County.Code, Site.Num, Parameter.Name) %>%
  summarize(nitrate = mean(nitrate))

cor_data <- avg_sul %>%
  select(State.Code, County.Code, Site.Num, sulfate) %>%
  inner_join(avg_nit, by = c("State.Code", "County.Code", "Site.Num")) %>%
  select(State.Code, County.Code, Site.Num, sulfate, nitrate)

cor_data %>%
  select(State.Code, County.Code, Site.Num, nitrate, sulfate) %>%
  summarize(correlation = cor_data$nitrate, cor_data$sulfate, use = "pairwise", method = "spearman") %>%
  group_by(State.Code, County.Code, Site.Num) %>%
  arrange(desc(correlation))

cor(cor_data[c(4, 5)])







