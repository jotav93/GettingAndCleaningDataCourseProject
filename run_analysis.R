# reading train and test data
Y_train <- read.table("./UCI HAR Dataset/train/Y_train.txt")
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
Y_test <- read.table("./UCI HAR Dataset/test/Y_test.txt")
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

features <- read.table("./UCI HAR Dataset/features.txt",as.is = TRUE)

activity_labels <- read.table(file.path(dataPath, "activity_labels.txt"))
colnames(activity_labels) <- c("ActivityId", "ActivityLabel")

df <- rbind(
        cbind(subject_train, X_train, Y_train),
        cbind(subject_test, X_test, Y_test)
)

colnames(df) <- c("subject", features[, 2], "activity")

keepCols <- grepl("subject|activity|mean|std", colnames(df))

df <- df[, keepCols]
        
df$activity <- factor(df$activity, levels = activity_labels[, 1]
                      , labels = activity_labels[, 2])

#step 4
columns <- colnames(df)
columns <- gsub("[\\(\\)-]", "", columns)
columns <- gsub("^f", "Frequency", columns)
columns <- gsub("^t", "Time", columns)
columns <- gsub("Mag", "Magnitude", columns)
columns <- gsub("Freq", "Frequency", columns)
columns <- gsub("std", "StandardDeviation", columns)
columns <- gsub("Gyro", "Gyroscope", columns)
columns <- gsub("mean", "Mean", columns)
columns <- gsub("Acc", "Accelerometer", columns)
columns <- gsub("BodyBody", "Body", columns)
colnames(df) <- columns


df_2 <- df %>% group_by(subject, activity) %>% summarise_each(funs(mean))

# output to file "tidy_data.txt"
write.table(humanActivityMeans, "tidy_data.txt", row.names = FALSE, 
            quote = FALSE)