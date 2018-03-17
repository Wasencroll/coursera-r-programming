x <- factor(c("yes", "yes", "no", "yes", "no"))   ## creating a factor
x

table(x)                                          ## count of levels
unclass(x)                                        ## display underlying representation

x <- factor(c("yes", "yes", "no", "yes", "no"))   ## levels in alphabetical order
x
x <- factor(c("yes", "yes", "no", "yes", "no"), levels = c("yes", "no"))  ## levels in order yes, no
x