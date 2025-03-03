# Load necessary libraries
library(ggplot2)
library(dplyr)
library(Amelia)

# Load the dataset
lending_data <- read.csv("C://Users//user//Downloads//SR Material//ASSIGMENT//lending_dataset1_aggr.csv")

# Task 1: Descriptive Analysis

# Display structure and first few rows of the dataset
str(lending_data)  
head(lending_data)

# Summary statistics for numeric variables
summary(lending_data)

# Summary for categorical variables (Frequency counts)
lapply(lending_data, function(x) if (is.factor(x) || is.character(x)) table(x))


# Check for missing values
print("Missing Values in Each Column:")
colSums(is.na(lending_data))

# Numeric Variables: Plot Histograms
numeric_vars <- sapply(lending_data, is.numeric)
for (var_name in names(lending_data)[numeric_vars]) {
  p <- ggplot(lending_data, aes_string(x = var_name)) + 
    geom_histogram(binwidth = 5, fill = "skyblue", color = "black", alpha = 0.7) + 
    ggtitle(paste("Histogram of", var_name)) + 
    xlab(var_name) + 
    ylab("Frequency") +
    theme_minimal()
  print(p)
}

# Categorical Variables: Plot Bar Charts
categorical_vars <- sapply(lending_data, is.factor) | sapply(lending_data, is.character)
for (var_name in names(lending_data)[categorical_vars]) {
  p <- ggplot(lending_data, aes_string(x = var_name)) + 
    geom_bar(fill = "skyblue", color = "black", alpha = 0.7) + 
    ggtitle(paste("Bar Chart of", var_name)) + 
    xlab(var_name) + 
    ylab("Count") +
    theme_minimal()
  print(p)
}

# Visualize the target variable (Observed Default Rate)
ggplot(lending_data, aes(x = ObsRate)) + 
  geom_histogram(binwidth = 0.01, fill = "lightgreen", color = "black", alpha = 0.7) + 
  ggtitle("Distribution of ObsRate (Target Variable)") +
  xlab("Observed Default Rate") + 
  ylab("Frequency") +
  theme_minimal()

# Task 2: Build the Regression Model

# Fit the full model
model <- lm(ObsRate ~ Age + Gender + Experience + Earnings + HomeOwner +
              LandOwner + BadPastRecords + CarOwner + Defaults + Accounts,
            data = lending_data)

# View the model summary
summary(model)

# Refine the model by removing non-significant predictors
refined_model <- lm(ObsRate ~ Experience + Earnings + HomeOwner + BadPastRecords , 
                    data = lending_data)

# View the refined model summary
summary(refined_model)

# Compare the models using ANOVA
anova_result <- anova(model, refined_model)
print(anova_result)

# Task 4: Check Model Assumptions

# Residual plots  
par(mfrow = c(2, 2))  # Set up 2x2 plot layout

# Residuals vs Fitted
plot(model, which = 1, col = "blue")

# Normal Q-Q
plot(model, which = 2, col = "blue")

# Scale-Location
plot(model, which = 3, col = "blue")

# Residuals vs Leverage
plot(model, which = 5, col = "blue")

