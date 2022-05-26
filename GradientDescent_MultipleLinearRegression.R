set.seed(1)
x1 <- sample(2:30, 25)
set.seed(2)
x2 <- sample(36:1460, 25)
set.seed(3)
y <- round(2.341 + 1.6159*x1 + 0.015*x2 + rnorm(25,0,3.25),2)
df1 <- data.frame(x1,x2,y)
View(df1)

y <- matrix(df1$y)
X <- cbind(1, as.matrix(df1[,1:2]))

# Transpose t, %*% matrix multiply, solve(traspose multiply) inverse
w <- solve(t(X) %*% X) %*% t(X) %*% y
# output ~ input1 + input2
lm(y ~ x1 + x2, data=df1)

y_hat <- X %*% w
r <- y - y_hat
sum(r)


r <- lm(y ~ x1 + x2, data=df1)$residuals
sum(r)
