f1 <- function(z) 1/(1+exp(-z))
f2 <- function(z) tanh(z)
f3 <- function(z) max(0.1*z, z)

temp <- rep(rep(0.6, times=4), times=4)
w.1 <- w.2 <- matrix(temp, byrow = T, ncol = 4)
w.1
temp <- rep(2.7, times=4)
w.3 <- matrix(temp, byrow = T, ncol = 4)
w.3
temp <- rep(1.2, times=4)
b.1 <- b.2 <- matrix(temp, byrow = T, ncol = 1)
b.1
b.3 <- matrix(1.2)
b.3

x <- a.0 <- matrix(c(1.2,
                     5.9,
                     2.3,
                     0.2), byrow = T, ncol = 1)
y <- 13
a.1 <- f1(b.1 + w.1 %*% a.0)
a.1
a.2 <- f2(b.2 + w.2 %*% a.1)
a.2
y.hat <- a.3 <- f3(b.3 + w.3 %*% a.2)
y.hat

loss <- (y - y.hat)^2
loss
