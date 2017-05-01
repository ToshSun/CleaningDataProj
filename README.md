# Cleaning the data Human Activity Recognition Using Smartphones Data Set 
### Getting and Cleaning Data Course Project

The R script run_analysis.R manages the Human Activity Recognition Using Smartphones Data Set by the following processes.

### step 0
  Downloads the zip file from :
  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Then unzips it and stores the output "."

### Step 1 Merges the training and the test sets to create one data set.
Load 6 files from the unziped folder and bind them
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
load "features.txt" and screen the item which have the strings either mean() or std()
then matching it with the data_all and keep the variables which were selected above process and cimaltaneously keep the "activity" and "subject".
```R
features<-read.table("./UCI HAR Dataset/features.txt",col.names=c("ind","label"))
data_all2<-data_all[,c(grep("std\\(\\)|mean\\(\\)",features$label),562:563)]
```
### Step 3 Uses descriptive activity names to name the activities in the data set
load "activity_labels.txt" and merge it with the latest data set data_all2
```R
activity_list<-read.table("./UCI HAR Dataset/activity_labels.txt",col.names=c("activity","activity_label"))
data_all3<-merge(data_all2,activity_list,by="activity")
```

### Step 4 Appropriately labels the data set with descriptive variable names.
the names in the features are too abbreviated to see the actual meaning.
based on the readme.txt and features_info.txt, change several parts of them 
```R
features_1<-sub("^t","time.",features$label)
features_1<-sub("^f","frequency",features_1)
features_1<-sub("Acc",".Accelerometer",features_1)
features_1<-sub("Gyro",".Gyroscope",features_1)
features_1<-sub("Jerk",".Jerk",features_1)
features_1<-sub("Mag",".Magnitude",features_1)
```
### Step 5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


