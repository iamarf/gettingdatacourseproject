# Script for preparing a set of tidy data as required by the Course Project
# in the Getting and Cleaning Data course.

library(data.table)

# Reading class labels with their activity names
act.labels <- read.table("activity_labels.txt")

# Reading the training measurements data set
X.train <- read.table("./train/X_train.txt")

# Transforming training measurements data frame in a data table
DX.train <- data.table(X.train)
rm(X.train)

# Reading test measurements data set
X.test <- read.table("./test/X_test.txt")

# Transforming the test measurements data frame in a data table
DX.test <- data.table(X.test)
rm(X.test)

# Reading file of subjects who performed the activity for each
# window sample in the training measurements set
subject.train <- read.table("./train/subject_train.txt")

# Reading file of subjects who performed the activity for each
# window sample in the test measurements set
subject.test <- read.table("./test/subject_test.txt")

# Reading features files
features <- read.table("features.txt")

# Merging training and test data sets
DX <- rbind(DX.train,DX.test)

# Building vector of train-or-test labels
ntrain <- rep("train", nrow(DX.train))
ntest <- rep("test", nrow(DX.test))
Train.Test <- c(ntrain, ntest)

# Merging training and test subject labels
subject <- rbind(subject.train, subject.test)
rm(subject.train)
rm(subject.test)

# Reading training labels
y.train <- read.table("./train/y_train.txt")

# Reading test labels
y.test <- read.table("./test/y_test.txt")

# Merging training and test labels
y <- rbind(y.train, y.test)
rm(y.train)
rm(y.test)

# Setting names in DX data table. Used make.names() function to 
# transform names in syntactically valid ones
setnames(DX,names(DX),make.names(as.character(features[,2])))

# Building logical vector to select only names related to "mean" or "std"
# Used grepl() function and regular expressions to achieve the result
lsubs <- grepl(paste(".*", "mean", ".*", sep = ""), features[,2], perl = TRUE, ignore.case =TRUE) | grepl(paste(".*", "std", ".*", sep = ""), features[,2], perl = TRUE, ignore.case =TRUE)

# Using lsubs logical vector to select desired "mean" and "std" variables
DX1 <- DX[,lsubs, with = FALSE]
rm(DX)

# Adding subject, activity and train-test labels columns at 
# the left of data set data table
DX2 <- data.table(cbind(subject, y, Train.Test, DX1))
rm(DX1)

# Setting "Subject" and "Activity" names for respective columns
setnames(DX2, 1, "Subject")
setnames(DX2, 2, "Activity")

# Substituting activity names to labels into the Activity column
DX3 <- data.table(DX2[, Activity:= act.labels[Activity, 2]])
rm(DX2)

# Thus, in DX3 we have a tidy version of the data set 
# to check results, for instance...
# DX[,c(1:5), with = FALSE]
# DX[,c(559:561), with = FALSE]

# Creating a second tidy data set with the average of each variable
# for each activity and each subject
AvDX3 <- DX3[,lapply(.SD, mean), by=list(Subject,Activity,Train.Test), .SDcols=4:89]
