# Library

library(dplyr)
library(ggplot2)
library(shiny)

##-----------------------------------------Question 1 & 2  ----------------------------------------------------------------------
# Question 1.	Describe the dataset [5 marks]
# Question 2.	Load data the Canadian Cheese Directory data set, found at Canadian Cheese Directory

# Load Data Set

mydata <- read.csv("D:/Users/desk/Documents/Artificial Intelligence Specialist - LEA.E3/420 - ORS - ID - Data Science Reference Tools/cheese_data.csv")

# View some rows in order to understand that data set structure
head(mydata)

# Structure of the data set
str(mydata)

# 1. CheeseId: Integer – A unique numeric identifier for each cheese.
# 2. ManufacturerProvCode: Character – A string representing the province where the cheese is produced (e.g., "NB" for New Brunswick).
# 3. ManufacturingTypeEn: Character – A string describing the manufacturing process (e.g., "Farmstead" or "Industrial").
# 4. MoisturePercent: Numeric – A number indicating the moisture content of the cheese (e.g., 47.0%).
# 5. FlavourEn: Character – A string describing the flavor profile of the cheese (e.g., "Sharp, lactic").
# 6. CharacteristicsEn: Character – A string that gives additional information about the cheese (e.g., "Uncooked" or "Pressed and cooked").
# 7. Organic: Integer – A binary value indicating whether the cheese is organic (0 for non-organic, 1 for organic).
# 8. CategoryTypeEn: Character – A string indicating the cheese category (e.g., "Firm Cheese" or "Semi-soft Cheese").
# 9. MilkTypeEn: Character – A string describing the type of milk used (e.g., "Cow", "Ewe").
# 10. MilkTreatmentTypeEn: Character – A string describing the milk treatment process (e.g., "Raw Milk", "Pasteurized").
# 11. RindTypeEn: Character – A string describing the rind type (e.g., "Washed Rind").
# 12. CheeseName: Character – A string containing the name of the cheese (e.g., "Sieur de Duplessis").
# 13. FatLevel: Character – A string describing the fat content level of the cheese (e.g., "lower fat").


# Summary of the data set
summary(mydata)

# The Canadian Cheese Directory is an extensive and detailed database specifically focused on Canadian cheeses made from cow, goat, sheep, or buffalo milk.
# It includes over 1,450 different cheeses produced in Canada. Each cheese is categorized based on several factors, including the type of milk used 
# (cow, goat, sheep, or buffalo), the category of cheese (such as soft, hard, or semi-soft), the method of milk treatment (raw or pasteurized), the fat 
# content, the ripening or aging period, and the production method. This comprehensive directory was developed by the Canadian Dairy Information 
# Centre (CDIC) in collaboration with the Ministère de l'Agriculture, des Pêcheries et de l'Alimentation du Québec (MAPAQ).

# List of Columns:
# 1. CheeseId: Unique identifier for each cheese.
# 2. ManufacturerProvCode: The province where the cheese is produced (e.g., NB, ON).
# 3. ManufacturingTypeEn: Type of manufacturing process (e.g., Farmstead, Industrial).
# 4. MoisturePercent: The moisture content of the cheese, represented as a percentage.
# 5. FlavourEn: Descriptions of the flavor of the cheese (e.g., sharp, tangy, fruity).
# 6. CharacteristicsEn: Characteristics or additional processing details about the cheese (e.g., uncooked, pressed and cooked).
# 7. Organic: Indicates whether the cheese is organic (1 for organic, 0 for non-organic).
# 8. CategoryTypeEn: The category of cheese (e.g., firm cheese, semi-soft cheese).
# 9. MilkTypeEn: The type of milk used to make the cheese (e.g., Cow, Ewe).
# 10. MilkTreatmentTypeEn: The treatment of the milk (e.g., Raw Milk, Pasteurized).
# 11. RindTypeEn: The type of rind on the cheese (e.g., washed rind).
# 12. CheeseName: The name of the cheese (e.g., Tomme Le Champ Doré).
# 13. FatLevel: The fat content level of the cheese (e.g., lower fat).


##-----------------------------------------Question 3  ----------------------------------------------------------------------

# Question 3.	Perform statistical analysis and support your work with pertinent graphics whenever relevant. Use R functions
#             a.	The total number of each ManufacturingType in the province of BC
#             b.	The total number of cheese by province
#             c.	Produce statistics on the MoisturePercent, so as to answer the following questions
#                 i.	The cheese category type (categorytypeEN) which has the greatest moisture percent
#                 ii.	The deviation by category (categorytypeEN)  of the moisture percent

## *******************************************************************************************************************

# The Total Number of Each Manufacturing Type in the province of BC

# Subset data for BC
bc_data <- subset(mydata, ManufacturerProvCode == "BC")

# Get the count of each ManufacturingTypeEn in BC
bc_manu_count <- table(bc_data$ManufacturingTypeEn)
print(bc_manu_count)

# Visualization

bp1 <- barplot(bc_manu_count, 
        main="Total Number of Cheese by Manufacturing Type in BC", 
        col="blue", 
        las=1, 
        ylab="Count", 
        xlab="Manufacturing Type",
        ylim=c(0,50))

text(bp1, 
     bc_manu_count + 3,  
     labels=bc_manu_count, 
     col="black",                 
     cex=1.0) 

## *******************************************************************************************************************

# The Total Number of Cheese by Province

cheese_by_province <- table(mydata$ManufacturerProvCode)
print(cheese_by_province)

# Visualization

bp2 <- barplot(cheese_by_province, 
        main="Total Number of Cheese by Province", 
        col="green", 
        las=2, 
        ylab="Count", 
        xlab="Province",
        ylim=c(0,800))

text(bp2, 
     cheese_by_province + 30,  
     labels=cheese_by_province, 
     col="black",                 
     cex=1.0)  

## *******************************************************************************************************************

# Produce statistics on the Moisture Percent

moisture_stats <- mydata %>% 
  group_by(CategoryTypeEn) %>%
  summarise(max_moisture = max(MoisturePercent, na.rm = TRUE))

# Find the category with the maximum moisture percent
max_moisture_category <- moisture_stats %>% 
  filter(max_moisture == max(max_moisture))

print(max_moisture_category)

# Visualization

ggplot(moisture_stats, aes(x = CategoryTypeEn, y = max_moisture)) +
  geom_bar(stat = "identity", fill = "skyblue") + 
  geom_text(aes(label = round(max_moisture, 2)),
            vjust = -0.5, 
            color = "black", 
            size = 4) +
  theme_minimal() + 
  labs(title = "Maximum MoisturePercent by Category",
       x = "Category Type",
       y = "Maximum MoisturePercent") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

## *******************************************************************************************************************

# Deviation of Moisture Percent by Category

moisture_deviation <- mydata %>%
  group_by(CategoryTypeEn) %>%
  summarise(moisture_sd = sd(MoisturePercent, na.rm = TRUE))

print(moisture_deviation)

# Visualization

gg1 <- ggplot(moisture_deviation, aes(x = CategoryTypeEn, y = moisture_sd)) +
  geom_bar(stat = "identity", fill = "red") +
  labs(title = "Standard Deviation of Moisture Percent by Category", 
       x = "Category", y = "Standard Deviation") + 
  geom_text(aes(label = round(moisture_sd, 2)), 
            vjust = -0.5, 
            color = "black", 
            size = 4)  
print(gg1)


##-----------------------------------------Question 4  ----------------------------------------------------------------------

# Question 4.	Create a dataframe of Cheese in ON only and with these columns only CheeseID,
#             ManufacurerProvince,ManufacturingType,FlavourEn,MoisturePercent,Organic


df_on_cheese <- mydata %>% 
  filter(ManufacturerProvCode == "ON") %>%
  select(CheeseId, ManufacturerProvCode, ManufacturingTypeEn, FlavourEn, MoisturePercent, Organic)

# Sample of dataframe

head(df_on_cheese)

##-----------------------------------------Question 5  ----------------------------------------------------------------------

# Question 5.Remove all the entries with FlavourEn being NA in this dataset

rm_na_FlavourEn <- mydata %>% filter(!is.na(FlavourEn))

# Sample of the table:  
head(rm_na_FlavourEn)

# but trully cannot certify that there is no NA in that column

# verification : this will give a count for NA if ever there is
rm_na_FlavourEn %>% 
  filter(is.na(FlavourEn)) %>% 
  nrow()

##-----------------------------------------Question 6  ----------------------------------------------------------------------

# Question 6.Find the number of organic and non-organic type from this dataframe

df_new <- rm_na_FlavourEn # create a copy of the dataframe in order to avoid confusion in name

df_new$Organic <- factor(df_new$Organic, levels = c(0, 1), labels = c("Non-Organic", "Organic"))
organic_count <- table(df_new$Organic)
print(organic_count)

##-----------------------------------------Question 7  ----------------------------------------------------------------------

#Question 7.Create another dataframe with MoisturePercent which is 2SD (2  X standard deviation) within the mean of ON

# Calculate the mean and standard deviation of Moisture Percent in ON

moisture_mean <- mean(df_new$MoisturePercent, na.rm = TRUE)
moisture_sd <- sd(df_new$MoisturePercent, na.rm = TRUE)

# Filter the cheeses where Moisture Percent is within 2 SD of the mean

on_cheese_2SD <- df_new %>%
  filter(MoisturePercent >= (moisture_mean - 2 * moisture_sd) & 
           MoisturePercent <= (moisture_mean + 2 * moisture_sd))

# View the filtered dataset
head(on_cheese_2SD)

# Visualization 
ggplot(on_cheese_2SD, aes(x = MoisturePercent)) +
  geom_histogram(bins = 30, fill = "orange", color = "black", alpha = 0.7) + 
  labs(title = "Distribution of Moisture Percent within 2 SD of the Mean", 
       x = "Moisture Percent", y = "Count") +
  geom_text(stat = "bin", aes(label = ..count..), vjust = -0.5, size = 3, color = "black")






