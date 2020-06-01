##Coursera Week 4 Data Cleaning Project Solution

## 4 basic level data sets will be defined and created:
## 1. test data set
## 2. train data set
## 3. features data set
## 4. activity labels data set

#Reading training tables - xtrain / ytrain, subject train
xtrain <- read.table("X_train.txt", header = FALSE)
ytrain <- read.table("y_train.txt", header = FALSE) #labels 1-6
subject_train <-  read.table("subject_train.txt", header = FALSE) #subject id 1-30

#Reading the test tables
xtest <- read.table("X_test.txt", header = FALSE) 
ytest <- read.table("y_test.txt", header = FALSE) #labels 1-6
subject_test <-  read.table("subject_test.txt", header = FALSE) #subject id 1-30

#Read the features data
features <- read.table("features.txt", header = FALSE)

#Read activity labels data
activity_labels <- read.table("activity_labels.txt", header = FALSE)

#Create Sanity and Column Values to the Train Data
colnames(xtrain) <- features[,2]
colnames(ytrain) <- "activityID"
colnames(subject_train) <- "subjectID"

#Create Sanity and Column Values to the Test Data
colnames(xtest) <- features[,2]
colnames(ytest) <- "activityID"
colnames(subject_test) <- "subjectID"

#Create sanity check for the activity labels value
colnames(activity_labels) <- c('activityID','activityTYPE')

#Merging the train and test data
train_data <- cbind(ytrain, subject_train, xtrain)
test_data <- cbind(ytest, subject_test, xtest)

data <- rbind(train_data, test_data)

#Extracting only the measurements on the mean and standard deviation for each 
#measurement

colNames <- colnames(data)

mean_std <- (grepl("activityID", colNames) | grepl("subjectID", colNames) | grepl("mean..", colNames) | grepl("std..", colNames))

mean_std_data <- data[,mean_std == TRUE]

#Use descriptive activity names to name the activities in the data set

descriptive_data <- merge(mean_std_data,activity_labels, by = "activityID", all.x = TRUE)

#Appropriately labels the data set with descriptive variable names

names(descriptive_data) <- gsub("^t","Time", names(descriptive_data))
names(descriptive_data) <- gsub("^f","Frequency", names(descriptive_data))
names(descriptive_data) <- gsub("Acc","Accelerometer", names(descriptive_data))
names(descriptive_data) <- gsub("Coeff","Coefficient", names(descriptive_data))
names(descriptive_data) <- gsub("Gyro","Gyroscope", names(descriptive_data))
names(descriptive_data) <- gsub("Mag","Magnitude", names(descriptive_data))
names(descriptive_data) <- gsub("std","StandardDeviation", names(descriptive_data))
names(descriptive_data) <- gsub("BodyBody","Body", names(descriptive_data))

#From the data set in step 4, creates a second, independent tidy data set with 
#the average of each variable for each activity and each subject.

# New tidy set has to be created 
TidySet <- aggregate(. ~subjectID + activityID, descriptive_data, mean)
TidySet <- TidySet[order(TidySet$subjectID, TidySet$activityID),]

#Save the new data

write.table(TidySet, "TidySet.txt", row.name=FALSE)











