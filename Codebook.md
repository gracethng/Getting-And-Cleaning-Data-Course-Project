# Getting and Cleaning Data Course Project
## Codebook
###Background
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

### Files
Filename | Description
------------ | -------------
UCI HAR dataset.zip | Data for project
./train/X_train.txt | Training dataset
./test/X_test.txt | Test dataset
./train/y_train.txt | Training activity codes
./test/y_test.txt | Test activity codes
./train/subject_train.txt | Training subject codes
./test/subject_test.txt | Test subject codes
features.txt | List of features/variable names
activity_labels.txt | List of activity codes and their corresponding activity names
Data.txt | Table of the subject codes, activities names, and the training and test datasets. This is a 10299 x 68 table. The first column is the subject code, the second is the activity that the subject performed, and the next 66 colums are various mean and standard deviation measurements. Refer below for the list of measurements.
Average.txt | Table of the average of each feature/variable for each activity and each subject. This is a 180 x 68 table. The first column is the activity that the subject performed, the second is the subject code, and the next 66 columns are the average of the various measurements for each activity that a subject performed. Refer below for the list of measurements.

**Measurements:**
"tbodyacc.mean.x"
"tbodyacc.mean.y"
"tbodyacc.mean.z"
"tbodyacc.std.x"
"tbodyacc.std.y"
"tbodyacc.std.z"
"tgravityacc.mean.x"
"tgravityacc.mean.y"
"tgravityacc.mean.z"
"tgravityacc.std.x"
"tgravityacc.std.y"
"tgravityacc.std.z"
"tbodyaccjerk.mean.x"
"tbodyaccjerk.mean.y"
"tbodyaccjerk.mean.z"
"tbodyaccjerk.std.x"
"tbodyaccjerk.std.y"
"tbodyaccjerk.std.z"
"tbodygyro.mean.x"
"tbodygyro.mean.y"
"tbodygyro.mean.z"
"tbodygyro.std.x"
"tbodygyro.std.y"
"tbodygyro.std.z"
"tbodygyrojerk.mean.x"
"tbodygyrojerk.mean.y"
"tbodygyrojerk.mean.z"
"tbodygyrojerk.std.x"
"tbodygyrojerk.std.y"
"tbodygyrojerk.std.z"
"tbodyaccmag.mean"
"tbodyaccmag.std"
"tgravityaccmag.mean"
"tgravityaccmag.std"
"tbodyaccjerkmag.mean"
"tbodyaccjerkmag.std"
"tbodygyromag.mean"
"tbodygyromag.std"
"tbodygyrojerkmag.mean"
"tbodygyrojerkmag.std"
"fbodyacc.mean.x"
"fbodyacc.mean.y"
"fbodyacc.mean.z"
"fbodyacc.std.x"
"fbodyacc.std.y"
"fbodyacc.std.z"
"fbodyaccjerk.mean.x"
"fbodyaccjerk.mean.y"
"fbodyaccjerk.mean.z"
"fbodyaccjerk.std.x"
"fbodyaccjerk.std.y"
"fbodyaccjerk.std.z"
"fbodygyro.mean.x"
"fbodygyro.mean.y"
"fbodygyro.mean.z"
"fbodygyro.std.x"
"fbodygyro.std.y"
"fbodygyro.std.z"
"fbodyaccmag.mean"
"fbodyaccmag.std"
"fbodybodyaccjerkmag.mean"
"fbodybodyaccjerkmag.std"
"fbodybodygyromag.mean"
"fbodybodygyromag.std"
"fbodybodygyrojerkmag.mean"
"fbodybodygyrojerkmag.std"

### Variables
Variable Name | Description
------------ | -------------
url | URL of data for project
x_train | Contains data from ./train/X_train.txt
x_test | Contains data from ./test/X_test.txt
x_data | Is from the merging of x_train and x_test. This is the training and test dataset.
y_train | Contains data fromm ./train/y_train.txt
y_test | Contains data from ./test/y_test.txt
y_activity | Is from the merging of y_train and y_test. This is the activity codes that correspond to each row of the training and test dataset.
subject_train | Contains data from ./train/subject_train.txt
subject_test | Contains data from ./test/subject_test.txt
z_subject | is from the merging of subject_train and subject_test. This is the subject codes that correspond to each row of the traning and test dataset.
features | Contains data from features.txt
rownum_meansd | Is the row numbers where "mean" and "std" are found in the features variable
x_data_meansd | Is a subset of the training and test dataset. The subset only contains the data for features with "mean" and "std".
activity_labels | Contains data from activity_labels.txt
x_data_compiled | Is from the merging of z_subject, y_activity, x_data_meansd. This is an output table which contains the subject codes, activities names, and the training and test datasets.
average | Is from the aggregation of data in x_data_compiled. This is an output table which contains he average of each feature/variable for each activity and each subject. 
