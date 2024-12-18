# FUNCTIONS

# Step 1: Define the function
name <- function() {
  print("Hello")
}

# Step 2: Call the function
name()

# Using parameters in a function
add_number <- function(number1, number2) {
  sum <- number1 + number2
  print(sum)
}

# Call function add_number
add_number(8, 9.2)

# DEFAULT PARAMETER

converter <- function(scale = 100, number) {
  convert = scale * number
  print(convert)
  print(number)
  print(convert)
}

converter(number = 2.5)  # 250
converter(scale = 200, number = 2.5)  # 500
converter(number=2.5,scale=100)

# RETURN
return_value <- function(a, b, c) {
  return(a + b + c)
}

y <- return_value(a = 3, b = 8, c = 8)
print(y)

# GLOBAL AND LOCAL VARIABLE
x <- 5

scope_of_variable <- function(x=2) {
 
  print(x)
}

scope_of_variable()

scope_of_variable(10)



