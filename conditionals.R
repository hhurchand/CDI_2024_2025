# If -else

a <- 5
b <- 20

#if (condition){action}

if (a < b) 
{
	print("Hello World!!")
}

# If- ElseIf - Else

vec_1 <- c(3,5,6,7)
vec_2 <- c(7,5,6,3)

mean_vec1 <- mean(vec_1)
mean_vec2 <- mean(vec_2)

if (mean_vec1 < mean_vec2)
{
	print("We have different means")
} else if(mean_vec1 > mean_vec2){
	print("We have different means")
} else {
	print("Hurray!! We have same means")
}
