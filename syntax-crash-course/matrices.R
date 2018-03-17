m <- matrix(nrow = 2, ncol = 3)       ## creating empty matrix with 2 rows, 3 columns
m

dim(m)                                ## dim returns rows/columns of matrix
attributes(m)                         ## returns attributes of matrix (here the dimensions)

m <- matrix(1:6, nrow = 2, ncol = 3)  ## matrix with 2 rows, 3 columns filled with numbers 1:6
m

m <- 1:10                             ## creating sequence first
dim(m) <- c(5,2)                      ## then assigning dimensions to sequence
m

x <- 1:3
y <- 10:12
cbind(x, y)                           ## matrix using cbind, x is first, y second column
rbind(x, y)                           ## x is first, y second row

z <- 10:13
cbind(x, z)                           ## x/z vector length does not match, starting from first entry of x again