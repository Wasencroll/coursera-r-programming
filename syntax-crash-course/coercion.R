y <- c(1.7, "a")    ## character
y <- c(TRUE, 2)     ## numeric
y <- c("a", TRUE)   ## character 

class(y)            ## printing class of object

x <- 0:6
class(x)
as.numeric(x)       ## coercing x from integer to numeric
as.logical(x)       ## coercing x from numeric to logical
as.character(x)     ## coercing x from logical to character

z <- c("a", "b", "c")
as.numeric(z)       ## trying to coerce from character to numeric will result in NA warning 
as.logical(z)
as.complex(z)