library(lpSolve)

obj <- c(40,30,50,45)

const <- matrix(c(10,1,5,10,
                  10,20,30,15,
                  10,5,20,15),
                byrow=T, ncol=4)
direction <- c("<=","<=","<=")
rhs <- c(20,60,40)

sol <- lp ("max", obj,
           const, direction, rhs, binary.vec = 1:4)
sol
sol$solution
