## standard separation with space
paste("Square", "Circle", "Triangle")

## specify separator
paste("Square", "Circle", "Triangle", sep = "++")

## no separation between strings
paste0("Square", "Circle", "Triangle")

## pasting a vector
shapes <- c("Square", "Circle", "Triangle")
paste("My favorite shape is a", shapes)

two_cities <- c("best", "worst")
paste("It was the", two_cities, "of times")

## pasting strings from a vector into single string
paste(shapes, collapse = "")

## counting characters with nchar()
nchar("This is election night")
nchar("ThisIsElectionNight")

## toupper() and tolower() functions
cases <- c("CAPS", "low", "MiXed")
toupper(cases)
tolower(cases)