library(lpSolve)

obj <- c(20,10)

const <- matrix(c(1,0,
                  0,1,
                  -1,1,
                  1,0,
                  0,1),
                byrow=T, ncol=2)
direction <- c(">=",">=","<=",">=",">=")
rhs <- c(1000,1000,500,0,0)

sol <- lp("max", obj,
          const, direction, rhs)

sol
sol$solution
