# Name: Zhenyu Date: 10 Dec 2024
mydata <- read.csv("C:/R Projects/iris.csv")
mydata

# DATA CLEANING AND TRANSFORMATIONS
# na.omit(), na.rm(), str_replace(), str_time()

# na.omit: Remove missing values

# CREATE A DATAFRAME
col1 = c(5,7,8,NA,9,12)
col2 = c(0.5,0.7,0.8,5,0.9,1.2)
col3 = c("Jack","  Henry", "  Mary  ", "Krish Bard", "Space in the end    ", "Terry" )
print(col1)
print(col2)
print(col3)

df <- data.frame(col1,col2,col3)
df

# na.omit() to drop rows with nulls
df_no_na <- na.omit(df)
df_no_na

# dimension of dataframe
dim(df_no_na)
dim(df)

# REPLACE NA with a value
df_copy <- df
df_copy[is.na(df_copy)] <- 0

# REPLACE NA with a value
df_copy[df_copy=="Jack"] <- "Joseph"

# REPLACE NA with a value
df_copy$col3[df_copy$col3=="Terry"] <- "Jerry"

df_copy[3,'col2'] <- 80
df_copy

library(stringr)
# TRIMMING WHITE SPACES
df_trim <- df
df_trim$col3 <- str_trim(df_trim$col3)
df_trim

left_trim = str_trim("      Kerry     ","left")
left_trim

right_trim = str_trim("      Kerry     ","right")
right_trim

both_trim = str_trim("      Kerry     ","both")  #str_squish("   SQUISH    )
both_trim