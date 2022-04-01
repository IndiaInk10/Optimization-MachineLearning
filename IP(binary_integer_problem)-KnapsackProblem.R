install.packages("lpSolve")
library(lpSolve)

obj <- c(75,20,40,50,30,25,15)

const <- matrix(c(5,2,1.2,4,2.5,4.5,0.5),
                 byrow = T, ncol=7)
direction <- "<="
rhs <- 12

sol <- lp ("max", obj, const,
           direction, rhs, binary.vec = 1:7)
