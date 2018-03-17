library(pryr)
mem_used()

ls()
object_size(worldcup)
object_size(datafile)

library(magrittr)
sapply(ls(), function(x) object_size(get(x))) %>% sort %>% tail(5)

test_delete <- 1:1000000
object_size(test_delete)
mem_change(rm(test_delete))

str(.Machine)
