# humanactivityrecon
Human Activity Recognition Using Smartphones Data Set

Described below are the steps that are taken in the analysis file.

Step 1: open the libraries for the plyr and dplyr packages
Step 2: set the working directory
Step 3: read in and apply activity labels to test and train labels (i.e. uses description activity names to name the activities in the data set)
Step 4: read in column names (i.e. descriptive variable names)
Step 5: read in test data using column names previously read in (i.e. Appropriately labels the data set with descriptive variable names)
Step 6: merge test labels with test data
Step 7: read in subject and merge with other test data
Step 8: read in train data using column names previously read in (i.e. Appropriately labels the data set with descriptive variable names)
Step 9:  merge train labels with train data
Step 10: read in subject and merge with other train data
Step 11: merges the train and test sets to create one data set
Step 12: extracts only the measurements on the mean and standard deviation for each measurement
Step 13: creates a second, independent tidy data set with the average of each variable for each activity and each subject. This steps groups the data by Subjects and then by Activities and then use the summarize_each function to average the columns by group to end with only one observation (the mean in this case) for each subject-activity