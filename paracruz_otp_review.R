# Cleaning ParaCruz data

library(dplyr)
library(readxl)
library(writexl)

data <- read_excel("your_file.xlsx")


result <- data %>%
  group_by(Address) %>%
  summarise(Trips = n())

write_xlsx(result, "cleaned_addresses.xlsx")
  