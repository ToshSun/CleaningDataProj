# Cleaning the data Human Activity Recognition Using Smartphones Data Set 
### Getting and Cleaning Data Course Project

The R script run_analysis.R manages the Human Activity Recognition Using Smartphones Data Set by the following processes.

### step 0
  Downloads the zip file from :
  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Then unzips it and stores the output "."

### Step 1 Merges the training and the test sets to create one data set.
load 6 files from the unziped folder
```R
x_test<-read.table("./UCI HAR Dataset/test/X_test.txt")
subject_test<-read.table("./UCI HAR Dataset/test/subject_test.txt",col.names =c("subject"))
y_test<-read.table("./UCI HAR Dataset/test/y_test.txt",col.names=c("activity"))
data_test<-cbind(x_test,subject_test,y_test)
x_train<-read.table("./UCI HAR Dataset/train/X_train.txt")
subject_train<-read.table("./UCI HAR Dataset/train/subject_train.txt",col.names =c("subject"))
y_train<-read.table("./UCI HAR Dataset/train/y_train.txt",col.names=c("activity"))
data_train<-cbind(x_train,subject_train,y_train)
data_all<-rbind(data_train,data_test)

```
### Step 2 Extracts only the measurements on the mean and standard deviation for each measurement.
### Step 3 Uses descriptive activity names to name the activities in the data set
### Step 4 Appropriately labels the data set with descriptive variable names.
### Step 5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


