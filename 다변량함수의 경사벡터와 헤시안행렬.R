install.packages("Deriv")

f <- function(x1, x2, x3)
  x1^4 + 2*x2^2 + 3*x3^2 - 4*x1 - 4*x2*x3

cF <- c()
library(Deriv)
cF <- c(cF, Deriv(f, "x1"))
cF <- c(cF, Deriv(f, "x2"))
cF <- c(cF, Deriv(f, "x3"))
print(cF)

hF <- c()
hF <- c(hF, Deriv(Deriv(f, "x1"), "x1"))
hF <- c(hF, Deriv(Deriv(f, "x1"), "x2")) # x1의 편미분한걸 x2로 미분
hF <- c(hF, Deriv(Deriv(f, "x1"), "x3"))
hF <- c(hF, Deriv(Deriv(f, "x2"), "x2"))
hF <- c(hF, Deriv(Deriv(f, "x2"), "x3"))
hF <- c(hF, Deriv(Deriv(f, "x3"),"x3"))
print(hF)

f <- function(x1, x2)
  x1^2 + x2^2

cF <- c()
cF <- c(cF, Deriv(f, "x1"))
cF <- c(cF, Deriv(f, "x2"))
print(cF)

hF <- c()
hF <- c(hF, Deriv(Deriv(f, "x1"), "x1"))
hF <- c(hF, Deriv(Deriv(f, "x1"), "x2")) # x1의 편미분한걸 x2로 미분
hF <- c(hF, Deriv(Deriv(f, "x2"), "x2"))
print(hF)
