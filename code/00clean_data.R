library(dplyr)
library(knitr)
here::i_am("code/00clean_data.R")
absolute_path_to_data <- here::here("raw_data/indian_liver_patient.csv")
data <- read.csv(absolute_path_to_data, header = TRUE)

# data cleaning
colSums(is.na(data))
data <- data %>% filter(!is.na(Albumin_and_Globulin_Ratio))

# save clean data
saveRDS(
  data,
  file = here::here("output/clean_data.rds")
)
