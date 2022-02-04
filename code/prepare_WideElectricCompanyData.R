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
electric_wide <- read.table(file = "data/electric_wide.txt", header = TRUE)
