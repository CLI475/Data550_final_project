# Indian Liver Patient Analysis

## Project Description
This project analyzes the "Indian Liver Patient" dataset, sourced from Kaggle, to explore relationships between liver function markers and patient demographics. The dataset contains records of 583 individuals, including 416 patients diagnosed with liver disease and 167 without. The analysis aims to uncover patterns, identify risk factors, and predict liver disease likelihood.

## Data Description
The dataset provides patient data from the North East of Andhra Pradesh, India. Below are the key characteristics of the dataset:

- **Records**: 583 patients (416 with liver disease, 167 without)
- **Gender**: 441 males, 142 females
- **Key Features**:
  - **Age**: Ranges from 4 to 90 years.
  - **Gender**: Categorical variable (Male/Female).
  - **Total Bilirubin**: A measure of bilirubin in the blood, indicative of liver function or bile duct blockage.
  - **Direct Bilirubin**: A type of bilirubin processed by the liver, assessing liver health.
  - **Alkaline Phosphotase**: An enzyme linked to liver and bone health.
  - **Alamine Aminotransferase**: A liver enzyme that may indicate liver damage.
  - **Aspartate Aminotransferase**: An enzyme associated with liver injury.
  - **Total Proteins**: Evaluates overall health and liver function.
  - **Albumin**: A protein produced by the liver, indicative of liver health and nutrition.
  - **Albumin and Globulin Ratio**: Helps detect liver or kidney diseases.
  - **Dataset (Target)**: A binary classification where '1' indicates liver disease and '2' indicates no disease.

## Analysis Objectives
The primary goals of this analysis include:
1. **Exploratory Data Analysis (EDA)**:
   - Examine correlations between liver function markers (e.g., Total Bilirubin, Albumin levels) and age, gender, and liver disease status.
2. **Prediction**:
   - Build predictive models to estimate the likelihood of a patient developing liver disease.
3. **Risk Factor Identification**:
   - Identify key risk factors associated with liver disease.

## Repository Contents
- **raw_data/**: Contains the original dataset used for analysis.
- **output/**: Stores processed data and generated visualizations.
- **code/**: Contains R scripts for various steps of the analysis:
  - `00clean_data.R`: Cleans and preprocesses the raw dataset.
  - `01make_tables.R`: Generates summary statistics and tables.
  - `02make_plots.R`: Creates plots for visual analysis.
  - `03render_report.R`: Produces the final report.
- **report.Rmd**: R Markdown file used to generate the final report.
- **Makefile**: Automates the workflow for data processing and report creation.

## Requirements
To replicate the analysis, the following tools and libraries are required:
- **R version**: 4.0 or higher
- **Libraries**: 
  - `dplyr`: For data manipulation
  - `ggplot2`: For data visualization
  - `here`: For file path management
  - `rmarkdown`: For report generation

## How to Generate the Final Report
- Clone the repository
- Ensure all required R packages are installed
- Run the workflow using the Makefile

## Synchronizing the Package Repository
To synchronize the package environment and ensure all dependencies are installed:
- Clone the repository from GitHub
- In an R console, use `setwd` and `getwd` to confirm that the working directory is the project directory.
- Run `source("renv/activate.R")`
- Run `make install` to restore the package environment
