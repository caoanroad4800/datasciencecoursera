# https://www.coursera.org/learn/regression-models/quiz/5S7KS/optional-data-analysis-practice-with-immediate-feedback-new-10-18-2017/attempt
setwd("~/Soft/Rtest/datasciencecoursera/07_Regression_Models")

install.packages("devtools")
devtools::install_github("jhudsl/collegeIncome")
library(collegeIncome)
data(college)

devtools::install_github("jhudsl/matahari")
library(matahari)

dance_start(value = FALSE, contents = FALSE)

head(college)
str(college)

college$major <- as.factor(college$major_category)
unique(college$major_category)
fit <- lm(rank ~ college$major_category - 1, data = college)
summary(fit)

head(college)
unique(college$major_category)

coef <- (fit$coefficients)
sort(coef, decreasing = FALSE)


dance_save("./data/college_major_analysis.rds")
