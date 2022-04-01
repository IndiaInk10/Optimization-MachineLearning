library(lpSolve)

obj <- c(0.4,0.6) # max

const <- matrix(c(5,10,
                  1,1,
                  0,1,
                  1,0),
                byrow=T, ncol=2)
direction <- c("<=","<=",">=",">=")
rhs <- c(38,5,1,0)

sol <- lp("max", obj,
          const, direction, rhs, all.int = TRUE) # B&B(?)
sol
sol$solution


# my B&B start
const <- rbind(const, c(1,0))
direction <- c(direction, "<=")
rhs <- c(rhs, 2)

sol <- lp("max", obj,
          const, direction, rhs)
sol
sol$solution

const <- rbind(const, c(0,1))
direction <- c(direction, "<=")
rhs <- c(rhs, 2)

sol <- lp("max", obj,
          const, direction, rhs)
sol
sol$solution
