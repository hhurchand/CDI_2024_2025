# Functions


# Step 1: Define the function

name <- function(){
  print("Hello")  
}

# Step 2: Call the function

name()

# Using parameters in a function

add_number <- function(number1,number2){
  sum <- number1 + number2
  print(sum)
}

# Call the function add_number

add_number(8,9.2)
add_number(23,25)

# Default parameters

converter <- function(scale=100,number){
  convert = scale*number
  print(convert)
}

converter (6,3)
converter(number=2.5)

#Return

return_value <- function(a,b,c){
  return (a+b+c)
}

return_value(a=3,b=8,8)

# Global and local variable

x <- 5
score_of_variable <- function(x=2){
  print(x)
  
}

score_of_variable()

x <- 6
score_of_variable(10)

discriminent <- function(e=1,f,g){
  return ((-f + (sqrt((f)^2)-4*e*g))/2*e)
  return ((-f - (sqrt((f)^2)-4*e*g))/2*e)
}

discriminent(f=6,g=18)
