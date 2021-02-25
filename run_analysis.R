library(plyr)
library(dplyr)
setwd("./homework/UCI HAR Dataset")

#read in and apply activity labels to test and train labels (i.e. uses description activity names to name the activities in the data set)
activitylabels <-read.table("./activity_labels.txt")
testlabels <- read.table("./test/y_test.txt")
testactivities <- join(testlabels,activitylabels)

trainlabels <- read.table("./train/y_train.txt")
trainactivities <- join(trainlabels,activitylabels)

#read in column names (i.e. descriptive variable names)
columnnames <- read.table("./features.txt")

#read in test data using column names previously read in (i.e. Appropriately labels the data set with descriptive variable names)
testdata <- read.table("./test/X_test.txt",col.names=columnnames$V2)

#merge test labels with test data
mergedtest <- cbind(testactivities,testdata)
mergedtest <- rename(mergedtest,activitynumber=V1,activitydescription=V2)

#read in subject and merge with other test data
subjecttest <- read.table("./test/subject_test.txt")
subjecttest <- rename(subjecttest,subjectid=V1)
subjecttestdata <- cbind(subjecttest, mergedtest)

#read in train data using column names previously read in (i.e. Appropriately labels the data set with descriptive variable names)
traindata <- read.table("./train/X_train.txt",col.names=columnnames$V2)

#merge train labels with train data
mergedtrain <- cbind(trainactivities,traindata)
mergedtrain <- rename(mergedtrain,activitynumber=V1,activitydescription=V2)

#read in subject and merge with other train data
subjecttrain <- read.table("./train/subject_train.txt")
subjecttrain <- rename(subjecttrain,subjectid=V1)
subjecttraindata <- cbind(subjecttrain,mergedtrain)

#merges the train and test sets to create one data set
MergeData <- rbind(subjecttestdata,subjecttraindata)

# extracts only the measurements on the mean and standard deviation for each measurement
MeanStdData<-select(MergeData,subjectid,activitydescription,grep("mean",names(MergeData))|grep("std",names(MergeData)))

# creates a second, independent tidy data set with the average of each variable for each activity and each subject.
# This steps groups the data by Subjects and then by Activities and then use the summarize_each function to average the columns by group to end with only one observation (the mean in this case) for each subject-activity
subjectactivitygroups <- group_by(MeanStdData,subjectid,activitydescription) %>%
 summarise_each(mean)%>%
  print()


