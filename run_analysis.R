#Download and unzip data
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, destfile = "UCI HAR dataset.zip")
unzip("UCI HAR dataset.zip")

#Reads training and test datasets and merges them into one dataset (Step 1)
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt", header=FALSE)
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt", header=FALSE)
x_data <- rbind(x_train, x_test)

#Reads training and test activity codes and merges them into one dataset
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", header=FALSE)
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt", header=FALSE)
y_activity <- rbind(y_train, y_test)

#Reads training and test subject codes and merges them into one dataset
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", header=FALSE)
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", header=FALSE)
z_subject <- rbind(subject_train, subject_test)

#Uncomment codes below to check that the dataset, activity codes and subject codes have the same number of rows
#nrow(x_data)
#nrow(y_activity)
#nrow(z_subject)

#Read list of features
features <- read.table("./UCI HAR Dataset/features.txt", header=FALSE)

#Uncomment codes below to check that the number of features and the number of variables in the dataset are the same
#nrow(features)
#ncol(x_data)

#Find row numbers of features with the words "mean" and "std"
#Subset the dataset to obtain data with these features/variables only (Step 2)
rownum_meansd <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
x_data_meansd <- x_data[, rownum_meansd]

#Rename the column names of the new dataset with the descriptive names (Step 4)
#Make the column names tidy by removing brackets and changing to lower case letters
names(x_data_meansd) <- features[rownum_meansd, 2]
names(x_data_meansd) <- gsub("\\(|\\)", "", names(x_data_meansd))
names(x_data_meansd) <- tolower(names(x_data_meansd)) 

#Make activity names tidy by removing underscores and changing to lower case letters
#Replace activity codes with descriptive activity names (Step 3)
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt", header=FALSE)
activity_labels[, 2] <- gsub("_", "", activity_labels[, 2])
activity_labels[, 2] <- tolower(activity_labels[, 2])
y_activity[, 1] <- activity_labels[(y_activity[, 1]), 2]

#Rename column names for subject and activity
names(z_subject) <- "subject"
names(y_activity) <- "activity"

#Merges subject code, activity and dataset into a single dataset
x_data_compiled <- cbind(z_subject, y_activity, x_data_meansd) 
write.table(x_data_compiled, "Data.txt", row.names=FALSE)

#Creates second dataset with the average of each variable for each activity and each subject (Step 5)
average <- aggregate(. ~ activity + subject, x_data_compiled, mean)
write.table(average, "Average.txt", row.names=FALSE)