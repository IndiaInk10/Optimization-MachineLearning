f1 <- f2 <- function(z) 1/(1+exp(-z))
w.1 <- matrix(c(0.3, 0.7,
                0.5, 0.4), byrow = T, ncol = 2)
w.2 <- matrix(c(1.2, 2.6), byrow = T, ncol = 2)
b.1 <- matrix(c(0.1,
                0.5), byrow = T, ncol = 1)
b.2 <- matrix(3.9)
x <- a.0 <- matrix(c(7,
                     8), byrow = T, ncol = 1)

a.1 <- f1(b.1 + w.1 %*% a.0)
y.hat <- a.2 <- f2(b.2 + w.2 %*% a.1)
loss <- (1 - y.hat)^2
loss