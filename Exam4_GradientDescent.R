x1 <- c(9, 12, 17, 25, 7,
        23, 27, 16, 15, 3,
        5, 20, 13, 8, 18,
        28, 11, 24, 6, 30,
        10, 21, 29, 2, 14)

X <- cbind(1, x1)

x2 <- c(7, 12, 11, 7, 14,
        14, 7, 13, 10, 10,
        10, 8, 12, 7, 9,
        13, 14, 8, 10, 6,
        11, 9, 13, 7, 9)

X <- cbind(X, x2)

y <- c(26.42, 39.44, 46.57, 52.09, 34.85,
       60.54, 56.56, 48.81, 40.36, 23.46,
       24.68, 45.53, 40.63, 26.02, 45.08,
       66.78, 40.16, 52.47, 28.26, 60.02,
       34.42, 48.83, 68.50, 14.41, 37.98)


df1 <- data.frame(X, y)
View(df1)

# 비용함수
cost <- function(X, y, w) {
  sum( (X %*% w - y)^2 ) / (2*length(y))
}

# 벡터, 행렬로 표현
X <- as.matrix(X)
y <- as.matrix(y)

# 학습률, 반복횟수
alpha <- 0.7
num_iters <- 5000

# cost, w 저장
cost_history <- double(num_iters)
w_history <- list(num_iters)
h_history <- w_history

# 초기화
w <- matrix(c(0,0,0), nrow=ncol(X))
h <- w

# gradient descent
for (i in 1:num_iters) {
  error <- (X %*% w - y)
  delta <- t(X) %*% error
  h <- h + (delta / length(y))^2
  w <- w - alpha*(1 / sqrt(h))*(delta / length(y))
  cost_history[i] <- cost(X, y, w)
  w_history[[i]] <- w
  h_history[[i]] <- h
  if(i == 1 || i == num_iters)
    print(c(as.vector(w),cost(X, y, w)))
}

# cost 변화
plot(cost_history, type='l', col='blue', lwd=2, 
     ylab='C(w)', xlab='Iterations')


