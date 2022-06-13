library(lpSolve)

lim <- "max"
obj <- c(20,50) # max

const <- matrix(c(1.2,4,
                  0.5,1,
                  0,1,
                  0,1,
                  1,0),
                byrow=T, ncol=2)
dir <- c("<=","<=","<=",">=", ">=")
rhs <- c(240,81,40,0,0)

sol <- lp("max", obj,
          const, dir, rhs) # B&B(?)

sol
sol$solution


library(lpSolve)

obj <- c(20,50) # max

const <- matrix(c(1.2,4,
                  0.5,1,
                  0,1,
                  0,1,
                  1,0),
                byrow=T, ncol=2)
dir <- c("<=","<=","<=",">=", ">=")
rhs <- c(240,81,40,0,0)

sol <- lp("max", obj,
          const, dir, rhs, all.int=TRUE) # B&B(?)

sol
sol$solution