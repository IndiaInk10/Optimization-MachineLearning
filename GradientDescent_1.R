f <- function(x) x^2 - 10*x + 26
x <- 7
alpha <- 0.1
library(Deriv)
gradient <- Deriv(f, "x")

for(i in 1:100)
{
  x <- x - alpha*gradient(x)
  print(c(x, f(x)))
  Sys.sleep(0.01)
}