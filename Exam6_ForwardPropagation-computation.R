# Forward propagation computation
x <- matrix(c(2,9))
y <- 0.82

f1 <- function(z) 1/(1+exp(-z))
f2 <- function(z) tanh(z)

a.0 <- x
b.1 <- matrix(c(0.1, 0.5))
b.2 <- matrix(c(3.9))
W.1 <- matrix(c(3, 0.7,
                0.5, 2), byrow = T, ncol=2)
W.2 <- matrix(c(1.2, -7), byrow = T, ncol=2)

df <- data.frame(t(rep(NA,10)))
names(df) <- c("b1.1", "b2.1",
               "w11.1", "w12.1","w21.1","w22.1",
               "b2.1",
               "w11.2","w12.2",
               "y.hat")

for(i in 1:30) {
  a.1 <- f(b.1 + W.1 %*% a.0)
  if(i == 1) print(a.1);
  a.2 <- as.vector(f(b.2 + W.2 %*% a.1))
  if(i == 1) print(a.2);
  y.hat <- a.2
  df[i,] <- c(b.1[1,],b.1[2,],
              W.1[1,1],W.1[1,2],W.1[2,1],W.1[2,2],
              b.2[1,],
              W.2[1,1],W.2[1,2],
              y.hat)
  
  # Back propagation computation
  alpha <- 0.37
  delta.2 <- a.2 - y
  
  gr.2 <- delta.2*a.2*(1-a.2) * rbind(1,a.1)
  
  b.2 <- b.2 - alpha*gr.2[1]      # b.2 update
  W.2 <- W.2 - alpha*gr.2[-1]     # W.2 update
  
  delta.1 <- delta.2 * a.2 * (1-a.2) * W.2 
  
  gr.1 <- (t(delta.1)*a.1*(1-a.1)) %*% cbind(1,t(a.0))
  
  b.1 <- b.1 - alpha*gr.1[,1]      # b.1 update
  W.1 <- W.1 - alpha*gr.1[,-1]     # W.1 update
}
a.1 <- f1(b.1 + W.1 %*% a.0)
y.hat <- a.2 <- as.vector(f2(b.2 + W.2 %*% a.1))
df <- rbind.data.frame(df, c(b.1[1,],b.1[2,], 
                             W.1[1,1],W.1[1,2],W.1[2,1],W.1[2,2],
                             b.2[1,],
                             W.2[1,1],W.2[1,2],
                             y.hat))
View(df)

