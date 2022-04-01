library(lpSolve)

obj <- c(1,1)

const <- matrix(c(200,400,
                  1,0,
                  0,1,
                  1,0,
                  0,1),
                byrow=T, ncol=2)
direction <- c("<=",">=",">=",">=",">=")
rhs <- c(24000,105,30,0,0)

sol <- lp("max", obj,
          const, direction, rhs)

sol
sol$solution
