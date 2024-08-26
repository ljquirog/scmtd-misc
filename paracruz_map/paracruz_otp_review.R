# Cleaning ParaCruz data

library(dplyr)
library(readxl)
library(writexl)

data <- read_excel("C:/Users/Lola/Documents/SCMTD/PARACRUZ_MAP/Completed Rides Jan through June 2024 (1).xlsx")

pick_up_counts <- data %>%
  group_by(`Pick-Up Address`) %>%
  summarise(
    `Pick-Up Zipcode` = first(`Pick-Up Zipcode`),
    `Pick-Up City` = first(`Pick-Up City`),
    `Number of Pick-Ups` = n()
  )

drop_off_counts <- data %>%
  group_by(`Drop-Off Address`) %>%
  summarise(`Number of Drop-Offs` = n())

summary_data <- pick_up_counts %>%
  left_join(drop_off_counts, by = c("Pick-Up Address" = "Drop-Off Address")) %>%
  rename(`Address` = `Pick-Up Address`) %>%
  mutate(`Number of Drop-Offs` = ifelse(is.na(`Number of Drop-Offs`), 0, `Number of Drop-Offs`),
         `Total Trips` = `Number of Drop-Offs` + `Number of Pick-Ups`)
  


write_xlsx(summary_data, "C:/Users/Lola/Documents/SCMTD/PARACRUZ_MAP/paracruz_cleaned_addresses.xlsx")

