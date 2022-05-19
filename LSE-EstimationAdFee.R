x <- c(36.5, 28.0, 42.9, 52.0, 51.5, 53.8, 25.4, 37.2, 50.9, 29.2)
y <- c(14, 9, 15, 20, 21, 25, 9, 13, 20, 10)
plot(x,y, pch=16, xlab="광고비", ylab="신규고객수")

cov(x,y)
x_bar <- mean(x)
y_bar <- mean(y)

w1 <- sum((x-x_bar) * (y-y_bar)) / sum((x-x_bar)^2)
w0 <- y_bar - w1 * x_bar

abline(w0, w1, col="red", lwd=3)

reg1 <- lm(y ~ x)
abline(reg1, col="red")
w0 <- reg1$coefficients[1]
w1 <- reg1$coefficients[2]

(17 - w0) / w1

# Residual
reg1$residuals
sum(reg1$residuals)

plot(reg1$residuals)
abline(h=0, col="red", lwd=3)
