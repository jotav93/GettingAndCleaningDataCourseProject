# GettingAndCleaningDataCourseProject
The code run_analysis.R creates a tidy dataset that corresponds to step 5 of the course project for the coursera course of Getting and cleaning data providing a data set with the average of each variable for each activity and each subject.

This dataset is created by:
Downloading the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

Reading the testset and trainset text files and joining them into one.
The mean and standard deviations were extracted for each measurement
The activity identifiers were replaced with descriptive activity names
The variable names where replaced with descriptive variable names
The final dataset was created by providing the average of each variable for each activity and each subject.