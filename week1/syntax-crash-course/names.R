x <- data.frame(foo = 1:4, bar = c(T, T, F, F))               ## data frame w/ columns foo and bar (both same length)
x
rownames(x) <- c("first", "second", "third", "forth")         ## setting row names for data frame
x

nrow(x)                                                       ## count rows of x
ncol(x)                                                       ## count columns of x

x <- 1:3                    
names(x)                                                      ## no names for 1,2,3

names(x) <- c("New York", "Seattle", "Los Angeles")           ## assigning names to 1,2,3
x
names(x)

x <- list("New York" = 1, "Boston" = 2, "Los Angeles" = 3)    ## names in lists
x
names(x)

m <- matrix(1:4, nrow = 2, ncol = 2)              
dimnames(m) <- list(c("a", "b"), c("c", "d"))                 ## names in matrix, row names first, then column names
m

rownames(m) <- c("x", "y")
colnames(m) <- c("e", "f")
m