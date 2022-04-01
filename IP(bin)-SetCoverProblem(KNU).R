library(lpSolve)

obj <- rep(1,9) # min

const <- matrix(c(1,0,1,0,0,0,0,0,0,
                  0,1,1,0,0,0,0,0,0,
                  0,0,1,1,0,0,0,0,0,
                  0,0,0,0,1,1,1,0,0,
                  0,0,0,0,0,0,1,0,1,
                  0,0,0,0,1,1,0,0,0,
                  0,0,0,0,0,0,1,1,1),
                byrow=T, ncol=9)
direction <- rep(">=",9)
rhs <- rep(1,9)

sol <- lp("min", obj,
          const, direction, rhs, all.bin = TRUE)
sol
sol$solution
