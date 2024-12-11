
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

