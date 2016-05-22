#Getting And Cleaning Data Course Project
## Purpose
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

## Data
One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## run_analysis.R
### Overview
The R script called run_analysis.R does the following:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### Detailed Steps
1. The script downloads the zip file **"UCI HAR dataset.zip"** into the working directory and unzips it. 
2. It reads the training and test datasets and merges the rows using `rbind`. The dataset is stored in **x_data**.
3. Similarly, it reads the training and test activity codes and subject codes and merges the rows using `rbind`. The activity and subject codes are stored in **y_activity** and **z_subject**.
4. It checks that the number of rows for the dataset **x_data**, activity codes **y_activity** and subject codes **z_subject** have the same number of rows to ensure that each row correspond to a particular activity and subject.
5. It reads the list of features and checks that the number of features and the number of columns in the dataset **x_data** are the same to ensure that each column in the dataset **x_data** correspond to a feature.
6. It finds the row number of features which contain the words "mean" and "std" using `grep` and subsets the dataset **x_data** to obtain a dataframe with only the features which contain "mean" and "std". 
7. It renames the column names of the new dataset with the descriptive names, and makes them tidy by removing brackets and changing to lower case letters using `gsub` and `tolower`.
8. It reads the activity labels and makes the activity names tidy by removing underscores and changing to lower case letters using `gsub` and `tolower`. It replaces the activity codes in **y_activity**descriptive activity names.
9. It renames the column names of **y_activity** and **z_subject** to "activity" and "subject".
10. It merges subject code, activity and dataset into a single dataset called **x_data_compiled** using `cbind`.
11. It creates a second dataset called **average**, with the average of each variable for each activity and each subject. This is done using `aggregate` with formula = . ~ activity + subject and FUN = mean.
