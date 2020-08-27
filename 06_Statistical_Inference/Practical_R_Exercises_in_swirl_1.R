# install.packages("swirl")

packageVersion("swirl") # requires version >= 2.2.21

library("swirl")

swirl()

install.packages("devtools")
devtools::install_github("jhudsl/collegeIncome")
library(collegeIncome)
data(college)

devtools::install_github("jhudsl/matahari")
library(matahari)

dance_start(value = FALSE, contents = FALSE)