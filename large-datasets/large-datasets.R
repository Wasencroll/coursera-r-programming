library(data.table)
library(dplyr)

brazil_zika <- fread("../data/COES_Microcephaly-2016-06-25.csv")
head(brazil_zika, 2)

class(brazil_zika)

fread("data/COES_Microcephaly-2016-06-25.csv",
                     select = c("location", "value", "unit")) %>%
  dplyr::slice(1:3)

