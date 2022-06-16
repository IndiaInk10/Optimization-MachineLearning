x1 <- c(5.22, 9.76, 2.13, 1.38, 7.80,
        2.59, 3.80, 3.84, 3.63, 6.97,
        6.80, 6.09, 6.43, 2.44, 1.07,
        5.80, 5.93, 7.85, 5.97, 4.27)

x2 <- c(2.74, 19.88, 6.16, 12.83, 11.60,
        3.79, 17.25, 16.81, 16.39, 4.89,
        6.46, 16.19, 3.78, 15.38, 9.48,
        5.51, 3.53, 13.76, 10.95, 4.81)

sqrtX2 <- sqrt(x2)

y <- c(25.43, 52.99, 26.00, 30.52, 41.76,
       21.29, 38.91, 38.06, 38.72, 33.56,
       32.88, 42.04, 30.06, 36.19, 26.97,
       31.06, 27.66, 44.62, 37.22, 27.19)

dFunction <- function(y, x1, x2, w0, w1, w2){
  return (y - (w0 + w1*x1 + w2*x2))
}

library(lpSolve)

# 지수표기를 숫자표기로 변경
options(scipen = 100)

bestParam <- c(0,0,0)
temp <- 0
max <- 0
maxList <- 0
sumMin <- 999999
sum <- 0
index <- 0
for(i in 1:20){
  obj <- c(y[i], -1, -x1[i], -sqrtX2[i])
  const <- matrix(c(1,0,0,0), byrow=T, ncol=4)
  rhs <- c(1)
  for(j in 1:20){
    const <- rbind(const, c(0, 1, x1[j], sqrtX2[j]))
    rhs <- append(rhs, y[j])
  }
  direction <- c("==")
  direction <- append(direction, rep("<=", 20))
  
  sol <- lp("min", obj, const, direction, rhs)
  
  print(i)
  print(sol)
  print(sol$solution[2:4])
  
  sum <- 0
  max <- 0
  for(j in 1:20){
    temp <- abs(dFunction(y[j], x1[j], x2[j], sol$solution[2], sol$solution[3], sol$solution[4]))
    max <- append(max, temp)
    sum <- sum + temp
  }
  if(sum < sumMin){
    sumMin = sum
    bestParam <- sol$solution[2:4]
    index <- i
  }
  if(i == 1)
    maxList <- max[which.max(max)]
  else
    maxList <- append(maxList, max[which.max(max)])
}

print(bestParam)
print(sumMin)
print(maxList)
print(maxList[index])