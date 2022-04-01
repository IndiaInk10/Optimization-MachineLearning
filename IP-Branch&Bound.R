library(lpSolve)

lpBNB <- function(lim, obj, const, dir, rhs){
  g_lim <<- lim
  g_obj <<- obj
  g_const <<- const
  g_dir <<- dir
  g_rhs <<- rhs
  
  # reset index
  g_rIdx <<- nrow(const)
  g_top <<- g_rIdx + 1
  
  g_max <<- NULL
  g_min <<- NULL
  g_first <<- TRUE
  
  g_sol <<- lp(lim, obj, const, dir, rhs)
  g_solution <<- g_sol$solution
  
  print(g_solution)
  
  if(!lpBNB.isInteger(g_solution)){
    g_max <<- g_sol$objval
    
    lpBNB.reBNB(TRUE)
    lpBNB.reBNB(FALSE)
  }
}

lpBNB.reBNB <- function(bFloor){
  sgIdx <- lpBNB.SmallGapIdx(g_solution)
  
  rhs <- ifelse(bFloor, floor(g_solution[sgIdx]), ceiling(g_solution[sgIdx]))
  const <- rep(0, length(g_solution))
  const[sgIdx] <- 1
  dir <- ifelse(bFloor, "<=", ">=")
  cat('Add const: x', sgIdx, ' ', dir, ' ', rhs, '\n', sep='')
  lpBNB.add(const, dir, rhs)
  
  lpBNB.again()
  if(lpBNB.isInteger(g_solution)){
    if(g_first){
      g_first <- FALSE
      lpBNB.remove()
    }
    if(g_sol$objval > g_min || is.null(g_min))  g_min <<- g_sol$objval
    else  lpBNB.remove()
    
    break
  }
  else{
    if(g_sol$objval < g_min){
      lpBNB.remove()
      break
    }
    lpBNB.reBNB(TRUE)
    lpBNB.reBNB(FALSE)
  }
}

lpBNB.add <- function(const_list, dir_value, rhs_value){
  g_const <<- rbind(g_const, const_list)
  g_dir <<- c(g_dir, dir_value)
  g_rhs <<- c(g_rhs, rhs_value)
  
  g_top <<- g_top + 1
}

lpBNB.remove <- function(){
  if(g_rIndex < g_top - 1){
    g_const <<- g_const[-g_top,]
    g_dir <<- g_dir[-g_top]
    g_rhs <<- g_rhs[-g_top]
    
    g_top <<- g_top - 1
  }
  else{
    print('Can\'t remove any more, this is the initial value')
    print('CONST')
    print(g_const)
    print('DIR')
    print(g_dir)
    print('RHS')
    print(g_rhs)
  }
}

lpBNB.again <- function(){
  g_sol <<- lp(g_lim, g_obj, g_const, g_dir, g_rhs)
  g_solution <<- g_sol$solution
  print(g_sol)
  print(g_solution)
}

lpBNB.reset <- function(){
  g_const <<- g_const[1:g_rIdx,]
  g_dir <<- g_dir[1:g_rIdx]
  g_rhs <<- g_rhs[1:g_rIdx]
}

lpBNB.isInteger <- function(solution_list){
  bInt <- all.equal(solution_list, as.integer(solution_list), check.attributes = FALSE)
  if(bInt == TRUE){ return(TRUE) }
  else { return(FALSE) }
}
lpBNB.SmallGapIdx <- function(solution_list){
  solGap_list <- NULL
  for(i in solution_list){
    gap1 <- (i - floor(i))
    gap2 <- (ceiling(i) - i)
    solGap_list <- c(solGap_list, ifelse(gap1 <= gap2, gap1, gap2))
  }
  
  return(which.min(solGap_list))
}

lim <- "max"
obj <- c(0.4,0.6) # max

const <- matrix(c(5,10,
                  1,1,
                  0,1,
                  1,0),
                byrow=T, ncol=2)
dir <- c("<=","<=",">=",">=")
rhs <- c(38,5,1,0)

sol <- lp("max", obj,
          const, dir, rhs) # B&B(?)

sol
sol$solution

lpBNB(lim, obj, const, dir, rhs)

