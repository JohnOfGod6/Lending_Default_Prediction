# Lending Data Default Rate Prediction

## Project Overview

This project focuses on predicting loan default rates using lending data. We employ linear regression techniques to model the relationship between various loan characteristics and the likelihood of default. The goal is to develop a robust and reliable model that can be used to assess risk and inform lending decisions.

## Analysis Components

The analysis pipeline encompasses the following key stages

*   **Exploratory Data Analysis (EDA):**  Comprehensive descriptive statistics and visualizations to understand the distribution of variables and identify potential relationships.
*   **Model Development:** Fitting both a full linear regression model (incorporating all relevant predictors) and refined models (potentially excluding less significant predictors).
*   **Assumption Validation:** Rigorous checking of linear regression assumptions, including examination of residuals, normality, and homoscedasticity.
*   **Model Enhancement Recommendations:** Identifying potential areas for model improvement, such as regularization techniques or the exploration of non-linear modeling approaches.

## Project Files

*   **`jeandedieu_ngirinshuti_SR2.pdf`:** This PDF document contains the complete project report, including detailed methodology, results, visualizations, and conclusions.
*   **`jeandedieu_ngirinshuti_SR2.R`:** This R script contains the code used for data analysis, model fitting, assumption checking, and generating the visualizations presented in the report.

## Reproducing the Analysis

To reproduce the analysis and generate the results described in the report, follow these steps:

1.  **Install Required R Packages:** Open R or RStudio and execute the following command to install the necessary packages

    ```r
    install.packages(c("ggplot2", "dplyr", "Amelia"))
    ```

2.  **Execute the R Script:**  Open the `jeandedieu_ngirinshuti_SR2.R` script in RStudio or another R environment and run the code.  This will re-perform the data analysis and model fitting steps.
