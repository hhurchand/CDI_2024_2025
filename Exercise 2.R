# Exercise 2

# a) Create a sequence of integers from 5 to 10, with step 1

integer_list <- seq(5,10)
integer_list

# (b) Create a sequence of integers from 5 to 30, with step 5

integer_list1 <- seq (5,30)
integer_list1

# (c) Find the number of elements in each squence

length(integer_list)
length(integer_list1)

# (d) Find the sum of each sequence

sum(integer_list)
sum(integer_list1)

# (d) Without using the mean function calculate the mean and variance of each sequence

# Mean Section

mean_integer_list <- sum(integer_list) / length(integer_list)
mean_integer_list
mean_integer_list1 <- sum(integer_list1) / length(integer_list1)
mean_integer_list1

# Variance Section

# Calculation Variance for integer_list
sum_square <- 0

for (num in integer_list){
  square_diff <- (num - mean_integer_list)^2
  sum_square <- (sum_square + square_diff)
}

Var <- (sum_square/length(integer_list)
var

# Calculation Variance for integer_list1
sum_square1 <- 0

for (num1 in integer_list1){
  
  square_diff1 <- (num1 - mean_integer_list1)^2
  sum_square1 <- (sum_square1 + square_diff1)
}

Var1 <- sum_square1/length(integer_list1)
var1


# (e) Verify your answer using the mean and variance function in R

mean(integer_list)
mean(integer_list1)

var(integer_list)
var(integer_list1)