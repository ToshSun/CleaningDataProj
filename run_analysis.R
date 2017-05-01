library(dplyr)
library(reshape2)
library(tidyr)
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",destfile = "./data.zip")
unzip("./data.zip")

# step 1 Merges the training and the test sets to create one data set.
#load test data

x_test<-read.table("./UCI HAR Dataset/test/X_test.txt")
subject_test<-read.table("./UCI HAR Dataset/test/subject_test.txt",col.names =c("subject"))
y_test<-read.table("./UCI HAR Dataset/test/y_test.txt",col.names=c("activity"))

data_test<-cbind(x_test,subject_test,y_test)

#load training data
x_train<-read.table("./UCI HAR Dataset/train/X_train.txt")
subject_train<-read.table("./UCI HAR Dataset/train/subject_train.txt",col.names =c("subject"))
y_train<-read.table("./UCI HAR Dataset/train/y_train.txt",col.names=c("activity"))

data_train<-cbind(x_train,subject_train,y_train)

data_all<-rbind(data_train,data_test)
data_all$subject<-as.factor(data_all$subject)


#step2 Extracts only the measurements on the mean and standard deviation for each measurement.
features<-read.table("./UCI HAR Dataset/features.txt",col.names=c("ind","label"))
data_all2<-data_all[,c(grep("std\\(\\)|mean\\(\\)",features$label),562:563)]

#step3 Uses descriptive activity names to name the activities in the data set
#load activity labels
activity_list<-read.table("./UCI HAR Dataset/activity_labels.txt",col.names=c("activity","activity_label"))

#merge data_all with activity_list in order to add descriptive actibity names on the data
data_all3<-merge(data_all2,activity_list,by="activity")


#step4 Appropriately labels the data set with descriptive variable names.
features_1<-sub("^t","time.",features$label)
features_1<-sub("^f","frequency",features_1)
features_1<-sub("Acc",".Accelerometer",features_1)
features_1<-sub("Gyro",".Gyroscope",features_1)
features_1<-sub("Jerk",".Jerk",features_1)
features_1<-sub("Mag",".Magnitude",features_1)
names(data_all3)[2:67]<-features_1[ grep("std\\(\\)|mean\\(\\)",features$label)]

#step5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#the activity and the activity_label has the same meaning so that remove the activity from the data
data_all4<-select(data_all3,-activity)

meltedData<-melt(data_all4,id_vars=c("subject","activity_label"),value.name = "value",variable.name = "variable")
group_1<-group_by(meltedData,subject,activity_label,variable)

summ_data<-summarise(group_1,val=mean(value))
data_all5<-spread(summ_data,variable,val)

#output the tidy data to the file
write.table(data_all5,file="./tidy_data.txt",row.names = FALSE)





