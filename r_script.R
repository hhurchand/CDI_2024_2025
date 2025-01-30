<<<<<<< HEAD

# Name: AShley Addingadoo
# DAte: 10 December 2024
# Time: 7:47 pm


# Import iris dataset from the file on your drive
# Be careful "\", as you have to change it to "/" iin the filepath

mydata <- read.csv("C:/Users/desk/Documents/Artificial Intelligence Specialist - LEA.E3/iris.csv")
mydata

# DATA CLEANING AND TRANSFORMATION
# na.omit(), na.rm(), str_replace() and str_time()

# na.omit: Remove missing values

col1 = c(5,7,8,NA,9,12)
col2 = c(0.5,0.7,0.8,5,0.9,1.2)
col3 = c("Jack","   Henry","  Mary   ","John","Ben    ","   Terry")

print (col2)
print (col1)
print (col3)

df = data.frame(col1,col2,col3)

#Create a data frame

df = data.frame(col1 = c(5,7,8,NA,9,12),
  col2 = c(0.5,0.7,0.8,5,0.9,1.2),
  col3 = c("Jack","   Henry","  Mary   ","John","Ben    ","   Terry")
)

df

# na.omit() drop the row where have null value using omit

df_no_na <- na.omit(df)
df_no_na

# Get dimension of the dataframe

dim(df_no_na)
dim(df)

# Replace the NA or value with a value
df_copy<-df
df_copy

df_copy[is.na(df_copy)] <- 0
df_copy

df_copy[df_copy == "Jack"] <- "Joseph"
df_copy

df_copy$col3[df_copy$col3 == "John"] <- "Jerry"
df_copy

# Changing 0.8 to 80

df_copy[3,'col2'] <- 80
df_copy

# triming space between words or along words

library(stringr)
df_trim <- df # Create a new dataframe / copy of the original
df_trim

df_trim$col3 <- str_trim(df_trim$col3)
df_trim

Left_trim <-  str_trim("          kerry     ","left")
Left_trim

right_trim <- str_trim("          kerry     ","right")
right_trim

trim_both <- str_trim("          kerry     ","both")
trim_both


# trim other way
trim_other_both <- str_squish ("          kerry     ")
trim_other_both

#################  DATA Filtering #########################

#Using the Iris dataset
# Selecting rows where column 1 is greater than 50

dim(mydata)

mydata_filtered <- subset(mydata,sepal.length > 5) # This is showing the col1 = "sepal.length" where the value is greater than 5, it will display.
mydata_filtered

mydata_filter1 <- mydata %>% subset(variety =="Setosa")
mydata_filter1
dim(mydata_filter1)

library(dplyr) # how to import library in R studio
# if the syntax don't work, you can go on Tools and install package

# Filtering rows based on a condition
# You have to import library "dplyr' in order to use this command

mydata_filtered <- mydata%>%filter(sepal.length>5)
mydata_filtered

# Selecting Specific columns from a dataset

mydata_selected <- mydata%>%select(sepal.width,petal.width)
mydata_selected


#################  DATA Sorting  #########################

#  R provides various functions for data sorting such as order(), sort(), and arrange().

# Sorting data based on column1 in ascending order
mydata_sorted <- mydata[order(mydata$sepal.length),]
mydata_sorted

# Sorting data based on multiple columns
# For this, you need to have the library "dplyr"  or install the package from Tools
# Since we already install the package for previous exercise, we don't need to do it again

mydata_sort <- mydata %>% arrange(sepal.length,petal.length)
mydata_sort

################# Teacher Example  #######################

mean_petal_length <- mean(mydata_filter1$petal.length)
mydata_mean <- mydata_filter1 %>% subset(petal.length>mean_petal_length)
mydata_mean

# Descending order sorting
mydata_desc <- mydata_mean %>% arrange(desc(petal.length))
mydata_desc


# Summary

#1 MAX: max(mydata$sepal.length)
max(mydata$sepal.length)

#2 MIN: min(mydata$sepal.length)
min(mydata$sepal.length)

#3 Mean : mean(mydata$sepal.length)
mean(mydata$sepal.length)

#4 Mode: doesnot exist, groupby

#5 Median: median(mydata$sepal.length)
median(mydata$sepal.length)

#6 VAriance: var(mydata$sepal.length)
var(mydata$sepal.length)

#7 Standard deviation: 

var_x <- var(mydata$sepal.length)

sqrt(var_x)

sd(mydata$sepal.length)

#8 Lower quartile, Upper Quartile, InterQuartile

#8a Upper_quartile <- quartile(mydata$sepal.length,0.75)
Upper_quar <- quantile(mydata$sepal.length,0.75)
Upper_quar

#8b Lower_quartile <- quartile(mydata$sepal.length,0.25)
Lower_quar <- quantile(mydata$sepal.length,0.25)
Lower_quar

#8c INterquartile = Upper quartile - lower quartile

Inter_quar <- Upper_quar-Lower_quar
Inter_quar




=======
# Name: Hurry Date : 10 Dec 2024
mydata <- read.csv("C:/Users/hhurchand/Downloads/iris.csv")
mydata

# DATA CLEANING AND TRANSFORMATIONS
# na.omit(), na.rm(), str_replace() and str_trim()


# CREATE A DATAFRAME

df <- data.frame(col1=c(5,7,8,NA,9,12),
col2 =c(.5,0.7,0.8,5,0.9,1.2),
col3 =c("Jack","  Henry","  Mary   ","Krish Bard","Space in end     ","Terry")
)

print(df)

# na.omit() to drop rows with nulls
df_no_na <- na.omit(df)
df_no_na

# dimension of dataframe
dim(df_no_na)
dim(df)

# REPLACE NA with a VALUE
df_copy <- df
df_copy[is.na(df_copy)] <- 0
df_copy

# REPLACE ANY OTHER VALUE

df_copy[df_copy=="Jack"] <- "Joseph"
df_copy

df_copy$col3[df_copy$col3 =="Terry"] <- "Jerry"
df_copy

df_copy[3,'col2'] <- 80
df_copy

library(stringr)
# TRIMMING WHITE SPACES
df_trim <- df
df_trim$col3 <- str_trim(df_trim$col3)
df_trim

left_trim = str_trim("    Kerry     ","left")
left_trim

right_trim = str_trim(left_trim,"right")
right_trim

trim_both = str_trim("    Hello   ","both")
trim_both

trim_other_both = str_squish("    SQUISH   ")
trim_other_both

>>>>>>> main
