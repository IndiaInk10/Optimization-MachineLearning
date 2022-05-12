f <- function(x1, x2, x3) x1^4 + 2*x2^2 + 3*x3^2 - 4*x1 - 4*x2*x3
library(Deriv)
Deriv(f, "x1")
Deriv(f, "x2")
Deriv(f, "x3")

# 2차 미분
Deriv(f, "x1", nderiv=2)
Deriv(f, "x2", nderiv=2)
Deriv(f, "x3", nderiv=2)
# 2차 편미분
Deriv(Deriv(f, "x1"), "x2")
Deriv(Deriv(f, "x1"), "x3")
Deriv(Deriv(f, "x2"), "x3")
