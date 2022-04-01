library(lpSolve)

obj <- c(15,50)

const <- matrix(c(1.2,4,
                  0.5,1,
                  0,1,
                  1,0,
                  0,1),
                byrow=T, ncol=2)
direction <- c("<=","<=","<=",">=",">=")
rhs <- c(240,81,40,0,0)

sol <- lp ("max", obj,
           const, direction, rhs, all.int = TRUE)

sol
sol$solution
