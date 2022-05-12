f <- function(x1, x2) -x1^2-x2^2+2*x1-x1*x2-1
library(Deriv)
Deriv(f, "x1")
Deriv(f, "x2")
# 개수행렬
A <- matrix(c(2,1,
              1,2)
            ,byrow=T, ncol=2)
B <- c(2,0)
solve(A,B)
# 2차 미분
Deriv(f, "x1", nderiv=2)
Deriv(f, "x2", nderiv=2)
# 2차 편미분
Deriv(Deriv(f, "x1"), "x2")
