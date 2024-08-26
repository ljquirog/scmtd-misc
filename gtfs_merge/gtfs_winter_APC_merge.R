# Joining Spring and Winter APC

# Load necessary libraries
library(dplyr)
library(readxl)
library(writexl)
library(tidyverse)

winter_wd_we <- read.csv('C:/Users/Lola/Documents/SCMTD/WINTER_2024/winter_gtfs_merge.csv')
winter_wd <- read_excel('C:/Users/Lola/Documents/SCMTD/WINTER_2024/WINTER_BID_WD.xlsx')
winter_we <- read_excel('C:/Users/Lola/Documents/SCMTD/WINTER_2024/WINTER_BID_WE.xlsx')


names(winter_wd_we)[names(winter_wd_we) == 'route_id...30'] <- 'route_id'
names(winter_wd)[names(winter_wd) == 'service_Type'] <- 'service_id'
names(winter_we)[names(winter_we) == 'service_type'] <- 'service_id'

# Perform the join on spring and winter WD service_id, route_id, and stop_code columns
winter_winter_wd_join <- left_join(winter_wd_we, winter_wd, by = c("stop_code", "service_id", "route_id"), relationship = "many-to-many")

# Write the result to a new Excel file
write_xlsx(winter_winter_wd_join, "winter_winter_wd_join.xlsx")

# Perform the join on spring and winter WE service_id, route_id, and stop_code columns
winter_winter_we_join <- left_join(winter_winter_wd_join, winter_we, by = c("stop_code", "service_id", "route_id"), relationship = "many-to-many") 

# Write the result to a new Excel file
write_xlsx(winter_winter_we_join, "C:/Users/Lola/Documents/SCMTD/WINTER_2024/winter_winter_we_wd_join.xlsx")

# Write the result to a new csv file
write.csv(winter_winter_we_join,"C:/Users/Lola/Documents/SCMTD/WINTER_2024/winter_winter_we_wd_join.csv")

# Print a message confirming completion
print("Files joined successfully!!!!!!!!!!")
