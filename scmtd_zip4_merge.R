# Merge Worker Home Address Data with USPS ZIP4 dataset to get 9 digit zipcodes

library(dplyr)
library(readxl)
library(writexl)
library(tidyverse)

worker_addr <- read_excel("C:/Users/Lola/Downloads/Worker_Home_Address_Job_title_union_cost_center 08.19.2024 MD.xlsx")
zip4_dataset <- read_excel("C:/Users/Lola/Downloads/USPS ZIP4.xls")

zip_merge <- merge(worker_addr, zip4_dataset[, c("ZIPCODE", "ZIP4")], by = "ZIPCODE", all.x = TRUE)