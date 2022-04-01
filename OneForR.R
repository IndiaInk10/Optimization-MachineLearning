# first letter start with char or .
# if . then next can't be number
# so variable name like this
# data.training, data.validation

# variable assign <- or <<- or =
# recommend <-

# scalar
# automatically select data type
a <- 3
b <- 4.5
c <- a + b
print(c)

# NA != NULL
# NA is none exist data
one <- 100
two <- 75
three <- 80
four <- NA
# is NA?
is.na(four)

# NULL is uninitialized variable
x <- NULL
is.null(x)
is.null(1)
is.null(NA)
is.na(NULL)

# don't have char type, only have string
a <- "hello"
print(a)

# boolean &(AND), |(OR), !(NOT)
TRUE & TRUE
TRUE & FALSE
TRUE | TRUE
TRUE | FALSE
!TRUE
!FALSE
# TRUE FALSE is reserved words
# and T, F is initialized global variable
T & F
# so can assign FALSE on T global variable
T <- FALSE
T & T

# different of between &, | and &&, ||
# calculation of vector's factors &, |
c(TRUE, TRUE) & c(TRUE, FALSE)
# calculatuion of one boolean value
# has short-circuit(if FALSE break)
c(TRUE, TRUE) && c(TRUE, FALSE)

# Factor for Categorial(범주형) variable
sex <- factor("m", c("m", "f"))
sex
# num of category
nlevels(sex)
# list of category
levels(sex)

# R: List start from 1
# index value of the category
levels(sex)[1]
levels(sex)[2]

# can change category of Factor
levels(sex) <- c("male", "female")

# factor is unordered(Nominal), it's default
# can make ordered variable(Ordinal)
ordered(c("a", "b", "c"))
factor(c("a", "b", "c"), ordered = TRUE)

# Vector == Array(?)
x <- c(1, 2, 3, 4, 5)
x
# but it must unify(통일하다) into one data type
# if not automatically unified
x <- c("1", 2, "3")
x

# only use one-demantional vector
# if use two or more, it automatically change to one
c(1, 2, 3, c(1, 2, 3))
# if need multi-demantional vector, use LIST 

# if you want start~end numeric category data vector
# x <- start:end
x <- 1:10
x
# or seq(from, to, by) while(from <= to) { from += by }
x <- seq(1, 10, 2)
x
# 인자로 주어진 데이터의 길이만큼 1, 2, 3..., vector return
x <- seq_along(x)
x
# 1~n vector seq_len(n)
x <- seq_len(3)
x
# can assign name on vector's cell
names(x) <- c("jang", "kyeong", "won")
x

# vector's index starts from 1!(ONE!)
x[1]
# can except one value with -index
x[-1]
# get many vector values
# vector[indexVector]
x[c(1,3)]
x[c(-1, -3)]
# see specfic range of vector, same with python
x[1:2]
# if assigned name on cell, can access with name
x["jang"]
# see only assigned name on cell
names(x)[2]
# length of vector, length(v) or NROW(v)
# nrow for matrix, NROW for vector!
length(x)
NROW(x)

# the value is exist in vector?
"a" %in% x
"1" %in% x

y <- c(1,3,5)
# vector deals with set(집합)으로 하여 집합간의 합집합, 교집합, 차집합을 계산
setdiff(x, y)  # 차집합
union(x, y)  # 합집합
intersect(x, y)  # 교집합

# compare between set
setequal(x, y)
y[3] <- 2
y
setequal(x, y)


# seq
# rep, loop of vector
rep(1:2, 5)
# loop of vector's each value
rep(1:2, each = 5)

# List, list(key=value, key=value, ...)
x <- list(name="foo", height=70)
x
# scalar and vector, both possible
x <- list(name="foo", height=c(1,3,5))

# double list or vector in list, anything
list(a=list(val=c(1,2,3)), b=list(val=c(1,2,3,4)))

# access to list index data
# []: return list(key=value) [[]]: return value
x[1]
x[[1]]


# Matrix
# same as vector, ONLY ONE TYPE OF SCALAR!
mVector <- seq(9)
# cut by 3 and fill it coloumn first(default)
matrix(mVector, nrow=3)
# cut by 3 and fill it row first
matrix(mVector, nrow=3, byrow=T)
# name on row and coloumn
x <- matrix(mVector, nrow=3,
          dimnames = list(c("item1", "item2", "item3"),
                          c("feature1", "feature2", "feature3")))

# access to matrix's index data
x
x[1,2]

# access specific range of matrix
x[1:2, ]  # row 1 2, coloumn all
x[-3, ]  # row except 3, coloumn all
x[c(1,3), c(1,3)]
# access with name
x["item1", ]

# calculation of matrix
x * 2
x / 2
x - x
# multiply of matrix
x %*% x
# inverse matrix
x <- matrix(seq(4), ncol=2)
solve(x)
x %*% solve(x)
# 전치행렬 transpose matrix
x <- matrix(seq(9), nrow=3)
x
t(x)

# demansion of matrix
ncol(x)
nrow(x)