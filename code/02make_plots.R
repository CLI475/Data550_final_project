library(dplyr)
library(knitr)
library(ggplot2)

here::i_am("code/02make_plots.R")

# load clean data
data <- readRDS(file = here::here("output/clean_data.rds"))

# Histogram of Age Distribution

histogram_plot <- ggplot(data, aes(x = Age)) +
  geom_histogram(binwidth = 5, fill = "lightblue", color = "black") +
  labs(title = "Age Distribution", x = "Age", y = "Count") +
  theme_minimal()

# Bar chart for Gender Distribution

bar_chart <- ggplot(data, aes(x = Gender)) +
  geom_bar(fill = c("lightblue", "pink"), color = "black") +
  labs(title = "Gender Distribution", x = "Gender", y = "Count") +
  theme_minimal()

# Violin Plot of Total Bilirubin stratified by Gender

violin_plot1 <- ggplot(data, aes(x = Gender, y = Total_Bilirubin, fill = Gender)) +
  geom_violin(trim = FALSE) +
  labs(title = "Total Bilirubin Distribution Stratified by Gender", x = "Gender", y = "Total Bilirubin (mg/dL)") +
  theme_minimal()

# Violin Plot of Total Bilirubin stratified by Liver Disease Status
violin_plot2 <- ggplot(data, aes(x = Dataset, y = Total_Bilirubin, fill = Dataset)) +
  geom_violin(trim = FALSE) +
  labs(title = "Total Bilirubin Distribution Stratified by Liver Disease Status", 
       x = "Liver Disease Status", 
       y = "Total Bilirubin (mg/dL)") +
  theme_minimal()


ggsave(
  here::here("output/histogram_plot.png"),
  plot = histogram_plot,
  device = "png"
)

ggsave(
  here::here("output/bar_chart.png"),
  plot = bar_chart,
  device = "png"
)

ggsave(
  here::here("output/violin_plot1.png"),
  plot = violin_plot1,
  device = "png"
)

ggsave(
  here::here("output/violin_plot2.png"),
  plot = violin_plot2,
  device = "png"
)