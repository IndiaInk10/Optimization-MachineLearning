library(lpSolve)

obj <- c(300,100,200,2,10,5)
obj
const <- matrix(c(0,0,0,1,1,1,
                  -8000,0,0,1,0,0,
                  0,-13000,0,0,1,0,
                  0,0,-14000,0,0,1)
                , byrow = T, ncol = 6)
direction <- c(">=", "<=", "<=", "<=")
rhs <- c(20000, 0, 0, 0)

sol <- lp ("min", obj
           , const, direction, rhs, binary.vec = 1:3, int.vec = 4:6)

sol
sol$solution
