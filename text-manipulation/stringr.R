library(stringr)

state_tbl <- paste(state.name, state.area, state.abb)
head(state_tbl)

str_extract(state_tbl, "[0-9]+")

head(state.name)
str_order(state.name)

head(state.abb)
str_order(state.abb)

## string operations
str_pad("Title", width = 8, side = "left", pad = "-")
str_pad("Title", width = 10, side = "right", pad = "-")
str_pad("Title", width = 20, side = "both", pad = "-")

str_to_title(c("THIS", "will", "bE", "a", "title"))

to_trim <- c("     trimming", "a    ", "    string   ")
str_trim(to_trim)

pasted_states <- paste(state.name[1:20], collapse = " ")
cat(str_wrap(pasted_states, width = 80))
cat(str_wrap(pasted_states, width = 30))

a_tale <- "It was the best of times it was the worst of times it was the age of wisdom it was the age of foolishness"
word(a_tale, 3)
word(a_tale, end = 5)
word(a_tale, start = 2, end = 5)