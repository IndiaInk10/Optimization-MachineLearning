state <- as.data.frame(state.x77)

# 벡터, 행렬로 표현
X <- cbind(1,as.matrix(state[1:4]))
X <- cbind(X, as.matrix(state[7]))
y <- as.matrix(state["Murder"])

X
# 비용함수
cost <- function(X, y, w) {
  sum( (X %*% w - y)^2 ) / (2*length(y))
}

# 학습률, 반복횟수
alpha <- 0.00000003
num_iters <- 1000

# cost, w 저장
cost_history <- double(num_iters)
w_history <- list(num_iters)

# 초기화
w <- matrix(c(0,0), nrow=ncol(X))
# gradient descent
for (i in 1:num_iters) {
  error <- (X %*% w - y)
  delta <- t(X) %*% error
  w <- w - alpha * delta / length(y)
  cost_history[i] <- cost(X, y, w)
  w_history[[i]] <- w
  if (i == num_iters) print(c(as.vector(w),cost(X, y, w)))
  # Sys.sleep(0.02)
}

# cost 변화
plot(cost_history, type='l', col='blue', lwd=2, 
     ylab='C(w)', xlab='Iterations')
