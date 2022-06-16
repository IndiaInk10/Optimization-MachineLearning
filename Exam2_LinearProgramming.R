# 첫번째 제약식
const1 <- matrix(c(0), ncol=200)
for(i in 1:197){
  const1 <- rbind(const1, 0)
}
for(i in 1:198){
  const1[i,i] <- const1[i,i+1] <- const1[i,i+2] <- 1
}
direction1 <- rep("<=", 198)
rhs1 <- rep(2.758, 198)


# 두번째 제약식
IsPrime <- function(x){
  p <- 2
  while(p*p <= x){
    if(x %% p == 0){
      return (FALSE)
    }
    p <- p + 1
  }
  return (TRUE)
}
primes <- c()
for(i in 2:200){
  if(IsPrime(i)){
    primes <- append(primes, i)
  }
}
const2 <- matrix(c(0), ncol=200)
const2[primes[1]] <- 1
for(i in 2:(length(primes))){
  temp <- rep(0, 200)
  temp[primes[i]] <- 1
  const2 <- rbind(const2, temp)
}
direction2 <- rep("<=", length(primes))
rhs2 <- rep(1.56, length(primes))


# 세번째 제약식
const3 <- matrix(c(0), ncol=200)
for(i in 1:199){
  const3 <- rbind(const3, 0)
}
for(i in 1:200){
  const3[i,i] <- 1
}
direction3 <- rep(">=", 200)
rhs3 <- rep(0, 200)


# 모든 제약식 합치기
const <- rbind(const1, const2)
const <- rbind(const, const3)
direction <- append(direction1, direction2)
direction <- append(direction, direction3)
rhs <- append(rhs1, rhs2)
rhs <- append(rhs, rhs3)

library(lpSolve)

fun <- function(x){
  return ((sin(x))^2 + cos(x))
}

obj <- rep(0, 200)
for(i in 1:200){
  obj[i] <- fun(i)
}

sol <- lp("max", obj, const, direction, rhs)
sol
sol$solution