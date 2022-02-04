# ***********************************************************************
# Title: Modeling Electric Company Study
# Author: William Murrah
# Description: ANCOVA Models of electric company data
# Created: Friday, 04 February 2022
# R version: R version 4.1.2 (2021-11-01)
# Project(working) directory: /Users/wmm0017/Projects/QMER/electric_company_Example
# ***********************************************************************
library(psych)
source("code/prepareElectricCompanyData.R")

ancova <- lm(post_test ~ pre_test + condition, data = electric)
ancovaX <- lm(post_test ~ pre_test * condition, data = electric)

modcomp <- anova(ancova, ancovaX)

