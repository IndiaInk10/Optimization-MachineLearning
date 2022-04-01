# library(lpSolve)
# 
# obj <- c(0.4,0.6) # max
# 
# const <- matrix(c(5,10,
#                   1,1,
#                   0,1,
#                   1,0),
#                 byrow=T, ncol=2)
# direction <- c("<=","<=",">=",">=")
# rhs <- c(38,5,1,0)
# 
# sol <- lp("max", obj,
#           const, direction, rhs) # B&B(?)
# sol
# sol$solution

initLP <- function(const, dir, rhs){
  g_const <- const
  g_dir <- dir
  g_rhs <- rhs
  
  g_mRow <- nrow(const)
  g_lRow <- g_mRow #lastRowIndex
}
resetLP <- function(){
  g_const <- g_const[-c(g_mRow:),]
  g_dir <- g_dir[-c(g_mRow:)]
  g_rhs <- g_rhs[-c(g_mRow:)]
}
addConstLP <- function(const_list, dir_value, rhs_value){
  g_const <- rbind(g_const, const_list)
  g_dir <- c(g_dir, dir_value)
  g_rhs <- c(g_rhs, rhs_value)
}
removeConstLP <- function(from, to){
  g_const <- g_const[-g_lRow,]
  g_dir <- g_dir[-g_lRow]
  g_rhs <- g_rhs[-g_lRow]
}