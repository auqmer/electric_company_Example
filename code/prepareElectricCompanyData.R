# ***********************************************************************
# Title: Prepare Electric Company Data
# Author: William Murrah
# Description: Import and clean electric.csv for EDA and modeling.
# Created: Friday, 04 February 2022
# R version: R version 4.1.2 (2021-11-01)
# Project(working) directory: /Users/wmm0017/Projects/QMER/electric_company_Example
# ***********************************************************************

# Packages used:
library(psych)


# Import raw data (first row contains variable names).
electric <- read.csv(file = "data/electric.csv", header = TRUE)

# Remove redundant first row which contains row numbers.
electric$X <- NULL

# Create/transform categorical variables.
electric <- transform(electric, 
                   gradef = factor(grade, labels = c("Grade 1", "Grade 2",
                                                    "Grade 3", "Grade 4")),
                   condition = factor(treatment, labels = c("control", 
                                                            "treatment"))
                   )

