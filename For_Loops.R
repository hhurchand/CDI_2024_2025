# FOR LOOOPS

numbers <- list(2,3,4,5,6,7)

for (x in numbers){
	print(x)
}

# Identify the even numbers

number_list = seq(1,10)
number_list

for (x in number_list){

	if(x%%2 ==0){

		cat(x,"Is Even\n")
	}else{

		cat(x,"Is Odd\n")
	}
}

