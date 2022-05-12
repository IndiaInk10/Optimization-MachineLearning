f <- function(x1, x2, x3) (x1 - 4)^2 + x3^2*x1 + (x2 + 1)^2 + 6

x <- c(5, 5, 5)
alpha <- 0.1
f1.prime <- Deriv(f, "x1")
f2.prime <- Deriv(f, "x2")
f3.prime <- Deriv(f, "x3")

library(Deriv)


for(i in 1:100)
{
  gradient <- c(f1.prime(x[1], x[2], x[3]),
                f2.prime(x[1], x[2], x[3]),
                f3.prime(x[1], x[2], x[3]))
  x <- x - alpha*gradient
  print(x)
  print(f(x[1], x[2], x[3]))
  Sys.sleep(0.01)
}
