# 0-preparation

library("data.table")
library("dplyr")
library("reshape2")

setwd("~/Soft/Rtest/datasciencecoursera/03_Getting_Cleaning_Data/")
path <- getwd()
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, file.path(path, 'dataFiles.zip'))
unzip(zipfile = 'data/dataFiles.zip')

# activity labels and features
activityLabels <- read.csv("data/UCI HAR Dataset/activity_labels.txt", sep = ' ')
names(activityLabels)
activityLabels <- rename(activityLabels, classLabel = X1, activityName = WALKING)

features <- read.csv("data/UCI HAR Dataset/features.txt", sep=" ")
names(features)
features <- rename(features, index = X1, featureName = tBodyAcc.mean...X)
featuresWanted <- grep("(mean|std)\\(\\)", features[, 'featureName'])
measurements <- features[featuresWanted, 'featureName']
measurements <- gsub('[()]', "", measurements)

# 1- Load train and test datasets
#train <- read.csv("data/UCI HAR Dataset/train/X_train.txt", sep=' ')
train <- fread(file.path("data/UCI HAR Dataset/train/X_train.txt"))
train <- train[, featuresWanted, with = FALSE]
setnames(train, colnames(train), measurements)

trainActivities <- read.csv("data/UCI HAR Dataset/train/y_train.txt", sep = " ", header = FALSE)
trainActivities <- rename(trainActivities, Activity = V1)

trainSubjects <- read.csv("data/UCI HAR Dataset/train/subject_train.txt", sep = " ", header = FALSE)
trainSubjects <- rename(trainSubjects,  SubjectNum = V1)

train <- cbind(trainSubjects, trainActivities, train)

test <- fread(file.path("data/UCI HAR Dataset/test/X_test.txt"))
test <- test[, featuresWanted, with = FALSE]
setnames(test, colnames(test), measurements)

testActivities <- read.csv("data/UCI HAR Dataset/test/y_test.txt", sep = " ", header = FALSE)
testActivities <- rename(testActivities, Activity = V1)

testSubjects <- read.csv("data/UCI HAR Dataset/test/subject_test.txt", sep = " ", header = FALSE)
testSubjects <- rename(testSubjects,  SubjectNum = V1)

test <- cbind(testSubjects, testActivities, test)

# 2- Merge train and test
merged <- rbind(train, test)

# 3- Convert classLabels to activityName 
merged[['Activity']] <- factor(
  merged[, 'Activity']
  , levels = activityLabels[['classLabel']]
  , labels = activityLabels[['activityName']]
)

merged[['SubjectNum']] <- as.factor(merged[, 'SubjectNum'])

merged <- reshape2::melt(data = merged
                         , id = c('SubjectNum', 'Activity')
                         )
merged <- reshape2::dcast(data = merged
                          , SubjectNum + Activity ~ variable
                          , fun.aggregate = mean)

fwrite(x = merged, file = "data/UCI HAR Dataset/tidyData.txt", quote = F)
