library(dplyr)
library(knitr)
library(ggplot2)
here::i_am("code/01make_tables.R")

# load clean data
data <- readRDS(file = here::here("output/clean_data.rds"))

# creat table 1 
# Convert 'Gender' to a factor
data$Gender <- as.factor(data$Gender)

# Convert 'Dataset' (Target) to a factor
data$Dataset <- factor(data$Dataset, levels = c(1, 2), labels = c("Liver Disease", "No Liver Disease"))

# Define function for summary statistics
summary_stats <- function(x) {
  n <- length(x)
  mean <- mean(x, na.rm = TRUE)
  sd <- sd(x, na.rm = TRUE)
  median <- median(x, na.rm = TRUE)
  IQR <- IQR(x, na.rm = TRUE)
  
  return(c(Count = n, Mean = mean, SD = sd, Median = median, IQR = IQR))
}

# Generate summary statistics for continuous variables
continuous_vars <- data %>%
  select(Age, Total_Bilirubin, Direct_Bilirubin, Alkaline_Phosphotase,
         Alamine_Aminotransferase, Aspartate_Aminotransferase, Total_Protiens, 
         Albumin, Albumin_and_Globulin_Ratio) %>%
  summarise_all(summary_stats)

# Transpose the table for better presentation
continuous_vars_t <- as.data.frame(t(continuous_vars))
colnames(continuous_vars_t) <- c("Count", "Mean", "SD", "Median", "IQR")

# Generate frequency tables for categorical variables
gender_table <- data %>%
  group_by(Gender) %>%
  summarise(Count = n()) %>%
  mutate(Percentage = round(Count / sum(Count) * 100, 2))

disease_table <- data %>%
  group_by(Dataset) %>%
  summarise(Count = n()) %>%
  mutate(Percentage = round(Count / sum(Count) * 100, 2))

# save table one 
saveRDS(
  continuous_vars_t,
  file = here::here("output/Summary_Statistics_Continuous.rds")
)

# save table two
saveRDS(
  gender_table,
  file = here::here("output/Gender_Distribution.rds")
)

# save table three
saveRDS(
  disease_table,
  file = here::here("output/Status_Distribution.rds")
)