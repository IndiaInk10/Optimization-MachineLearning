f <- function(x1, x2) x1^2 + x2^2 - 2*x1 + x1*x2 + 1

x <- c(5,5)
alpha <- 0.1
f1.prime <- Deriv(f, "x1")
f2.prime <- Deriv(f, "x2")

library(Deriv)


for(i in 1:100)
{
  gradient <- c(f1.prime(x[1], x[2]),
                f2.prime(x[1], x[2]))
  x <- x - alpha*gradient
  print(x)
  print(f(x[1], x[2]))
  Sys.sleep(0.01)
}
