# Set Script
# Name: burhan Date : 10 Dec 2024
mydata <- read.csv("C:/Users/14384/Downloads")

# DATA CLEANING AND TRANSFORMATIONS
# na.omit(), na.rm() and str_replace() and str_trim()

# CREATE A DATAFRAME
df <- data.frame(col1=c(3,7,8,NA,9,12),
                 col2=c(5.0,7.0,8.5,0.0,9.1,2.0),
                 col3=c("Jack", "Henry", "Mary", "Krish Bard", "Space in end    ", "Terry"))
print(df)

# na.omit() to drop rows with nulls
df_no_na <- na.omit(df)
df_no_na

# dimension of dataframe
dim(df)
dim(df_no_na)

# REPLACE NA WITH A VALUE
df_copy <- df
df_copy[is.na(df_copy)] <- 0
df_copy

# REPLACE ANY OTHER VALUE
df_copy[df_copy$col3=="Jack"] <- "Joseph"
df_copy

df_copy$col3[df_copy$col3 == "Terry"] <- "Jerry"
df_copy

df_copy[df_copy$col2 < 80]

library(stringr)
# TRIMMING WHITE SPACES
df_trim <- str_trim(df$col3)

left_trim <- str_trim("   Kerry   ", "left")
left_trim

right_trim <- str_trim("   Kerry   ", "right")
right_trim

trim_both <- str_trim("   Hello   ", "both")
trim_both

trim_other_both <- str_squish("   SQUISH    ")
trim_other_both
