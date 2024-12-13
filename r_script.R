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

