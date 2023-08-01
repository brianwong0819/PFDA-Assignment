#Liew Kok Siang, TP068744
#Wong Rong Sheng, 
#Eng Choon Minn, 
#Chan Zhee Hern, 

#2.1 Data Import
dataset_path <- "C:\\Users\\kslie\\Desktop\\Assignment Year 2\\Sem 1\\PFDA\\House_Rent_Dataset.csv"
house_rent_dataset <- read.csv(dataset_path)
View(house_rent_dataset)

#2.2 Data Cleaning
#2.2.1 Handling null values
nums_rows_is_null <- sum(is.na(house_rent_dataset))
cat("Number of rows with null: ", nums_rows_is_null)
house_rent_dataset <- na.omit(house_rent_dataset)

#2.2.2 Remove Duplicate Data
library(dplyr)
nrow(house_rent_dataset)
house_rent_dataset <- house_rent_dataset %>% dplyr::distinct(.keep_all = TRUE)
nrow(house_rent_dataset)


#2.3 Data pre-processing
#2.3.1 Rename column
names(house_rent_dataset) <- c("Posted ON",
                               "Bedrooms_Halls_Kitchens",
                               "Rent_Price",
                               "Area_Size",
                               "Floor_Group",
                               "Type_of_Area",
                               "Locality_Group",
                               "Located_City",
                               "Furnishing_Status",
                               "Tenant_Preferred",
                               "no_of_bathrooms",
                               "Point_of_Contact")
#view each column name
colnames(house_rent_dataset)

#2.3.2 View Data type and Data Structure
class(house_rent_dataset)
typeof(house_rent_dataset)
str(house_rent_dataset)
sapply(house_rent_dataset, class)

#2.3.3 Alter data type for specific column
house_rent_dataset$`Posted ON` <- as.Date(house_rent_dataset$`Posted ON`, format = "%m/%d/%Y")
class(house_rent_dataset$`Posted ON`)
house_rent_dataset[1, "Posted ON"]

#2.4 Data Exploration
#2.4.1 View top or bottom data
head(house_rent_dataset, 10) #View top 10 data
tail(house_rent_dataset, 15) #view last 15 data

#2.4.2 Size of the data set
#Determine number of columns
length(house_rent_dataset)

#Determine number of rows
nrow(house_rent_dataset)

#Dimension of the data set
dim(house_rent_dataset)

#2.4.3 Total Area Type in the data set
no_area_type <- nlevels(factor(house_rent_dataset$Type_of_Area))
message("Total number of area type is ", no_area_type)

area_type_categories <- data.frame("Type_of_Area" = unique(house_rent_dataset$Type_of_Area))
View(area_type_categories)

#2.4.4 Filter data

#2.4.5 Count the number

#2.4.6 Min, Max, Mean, Median, Summary

#2.4.7 Ascending or Descending order