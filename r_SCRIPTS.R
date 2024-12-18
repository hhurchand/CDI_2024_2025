mydata <- read.csv("C:/Users/hhurchand/Downloads/iris.csv")
mydata


# DATA CLEANING AND TRANSFORMATIONS
# na.omit(), na.rm(), str_replace() and str_trim()
 
# CREATE A DATAFRAME
df <- data.frame(col1=c(5, 7, 0, NA, 9, 12),
                 col2=c(5.5, 0.7, 0.9, 0.5, 9, 1.2),
                 col3=c("Jack", "Henry ", "Mary", "Krish Bead", "Space in end ", "Terry"))
 
print(df)
 
# na.omit() to drop rows with nulls
df_no_na <- na.omit(df)
df_no_na

dim(df_no_na)
dim(df)

df_copy <- df
df_copy
df_copy[df_copy == "NA"] <- 0
df_copy
 
# REPLACE NA with a VALUE
df_copy[df_copy=="Jack"] <- "Joseph"
df_copy
 
df_copy$col3[df_copy$col3 == "Terry"], <- "jerry"
df_copy
 
df_copy[3,'col2'] <- 80
df_copy
 
Library[stringr]
# trimmings white spaces
df_trim <- df 
df_trim$col3 <- strtrim(df_trim$col3)
df_trim

left_trim = str_trim(" 