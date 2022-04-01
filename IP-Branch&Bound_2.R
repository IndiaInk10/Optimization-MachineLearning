library(lpSolve)

obj <- c(0.3,0.72) # max

const <- matrix(c(10,30,
                  1,0,
                  1,0,
                  0,1),
                byrow=T, ncol=2)
direction <- c("<=", ">=", "<=", ">=")
rhs <- c(155, 1, 5, 0)

sol <- lp("max", obj,
          const, direction, rhs, all.int=TRUE)
sol
sol$solution