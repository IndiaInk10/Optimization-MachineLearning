library(lpSolve)

obj <- rep(1, 7)

const <- matrix(c(1,1,1,1,0,0,0,
                  1,1,1,0,1,0,0,
                  1,1,1,1,1,1,0,
                  1,0,1,1,0,1,1,
                  0,1,1,0,1,1,0,
                  0,0,1,1,1,1,1,
                  0,0,0,1,0,1,1)
                , byrow = T, ncol = 7)
direction <- rep(">=", 7)
rhs <- rep(1,7)

sol <- lp ("min", obj
           , const, direction, rhs, all.int=TRUE)

sol
sol$solution

