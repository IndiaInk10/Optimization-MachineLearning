x <- 1:10
y <- c(3,3,3,6,6,9,9,9,10,11)
plot(x,y)

# cov
cov(x,y)
x_bar <- mean(x)
y_bar <- mean(y)

w1 <- sum((x-x_bar) * (y-y_bar)) / sum((x-x_bar)^2)
w0 <- y_bar - w1 * x_bar

abline(w0, w1, col="red", lwd=3)

w0 + w1 * 11 

w1 == cov(x,y)/var(x)


# R provide
# lm Linear Model
# output ~ input
lm(y ~ x)
