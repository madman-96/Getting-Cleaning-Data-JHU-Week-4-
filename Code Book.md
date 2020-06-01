---
title: "Code Book"
output: html_document
---

```
Code Book
The run_analysis.R comprises 2 major steps:
A. the data preparation process, and
B. 5 steps to create a tidy data set as described in the course project assignment's description

A. The data preparation process :

Download and extract the folder (name: UCI_HAR_DATASET) from the given source link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Assigning data to variables:

activitY_labels<- activity_labels.txt : List of activities performed when the corresponding measurements were taken. contains: 6 rows and 2 columns
features<-features.txt : List of all features. The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. contains: 561 rows and 2 columns
subject_test<-subject_test.txt : Contains test data from 9 out of 30 volunteer (30% data) being observed. contains: 2947 rows and 1 column
xtest<-X_test.txt : contains the recorded fetures of test set. contains: 2947 rows and 561 columns
ytest<-y_test.txt) : contains the activity code labels of test data. contains: 2947 rows and 1 column
subject_train<-subject_train.txt :contains train data from 21 out of 30 volunteer (70% data) being observed. contains: 7352 rows and 1 column
xtrain<-X_train.txt :contains the recorded fetures of train set. contains: 7352 rows and 561 columns
ytrain<-y_train.txt : contains the activity code labels of train data. contains: 7352 rows and 1 column

B. 5 steps to create a tidy data set as described in the course project assignment's description:

Step1: Merges the training and the test sets to create one data set (which is named data):

train_data is created by merging ytrain, subject_train, xtrain using cbind() 
test_data is created by merging ytest, subject_test, xtest using cbind()

Finally, data is created by merging subjects train_data and test_data by using rbind() contains: 

Step2: Extracts only the measurements on the mean and standard deviation for each measurement.

mean_std_data is created by: subsetting data, by only selecting columns: subjectID and activityID together with the mean and the standard deviation for each measurement. 


Step3: Uses descriptive activity names to name the activities in the data set.

Each numbers in the activity column from the descriptive_data is replaced with its corresponding activity from the second column of the activities variable
descriptive_data is created by merging mean_std_data with activity_labels to name all the activities in the dataset

Step4: Appropriately labels the data set with descriptive variable names.

All names started with t (^t) in every variable name is replaced by Time
All names started with f (^f) in every variable name is replaced by Frequency
All names contains Acc in every variable name is replaced by Accelerometer
All names contains Coeff in every variable name is replaced by Coefficient
All names contains Gyro in every variable name is replaced by Gyroscope
All names contains Mag in every variable name is replaced by Magnitude
All names contains std in every variable name is replaced by StandardDeviation
All names contains BodyBody in every variable name is replaced by Body

Step5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

TidySet is created by sumarizing descriptive_data with the means of each variable for each activity and each subject, after groupped by subjects and activity. 

Export TidySet into TidySet.txt file.
```

