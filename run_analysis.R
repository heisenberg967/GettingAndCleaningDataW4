library(dplyr)

#reading features,activity labels
var_names<-read.table("D:/Courseware/Sem 6/Data Science/Getting and cleaning data/Week 4/UCI HAR Dataset/features.txt")
act_labels<-read.table("D:/Courseware/Sem 6/Data Science/Getting and cleaning data/Week 4/UCI HAR Dataset/activity_labels.txt")

#reading training data

x_train<-read.table("D:/Courseware/Sem 6/Data Science/Getting and cleaning data/Week 4/UCI HAR Dataset/train/X_train.txt")
y_train<-read.table("D:/Courseware/Sem 6/Data Science/Getting and cleaning data/Week 4/UCI HAR Dataset/train/Y_train.txt")
sub_train<-read.table("D:/Courseware/Sem 6/Data Science/Getting and cleaning data/Week 4/UCI HAR Dataset/train/subject_train.txt")

#reading test data

x_test<-read.table("D:/Courseware/Sem 6/Data Science/Getting and cleaning data/Week 4/UCI HAR Dataset/test/X_test.txt")
y_test<-read.table("D:/Courseware/Sem 6/Data Science/Getting and cleaning data/Week 4/UCI HAR Dataset/test/Y_test.txt")
sub_test<-read.table("D:/Courseware/Sem 6/Data Science/Getting and cleaning data/Week 4/UCI HAR Dataset/test/subject_test.txt")


#Merging training and test data sets <- 1.
x_combined<-rbind(x_train,x_test)
y_combined<-rbind(y_train,y_test)
sub_combined<-rbind(sub_train,sub_test)

#Mean and std. dev of each measurement <- 2.
a<-var_names[grep("mean\\(\\)|std\\(\\)",var_names[,2]),]
x_combined<-x_combined[,a[,1]]

#naming activities in data set <- 3.
colnames(y_combined)<-"activity"
y_combined$activitylabel<-factor(y_combined$activity, labels = as.character(act_labels[,2]))
activitylabel<-y_combined[,-1]

#Labeling dataset with descriptive variable names <- 4.
colnames(x_combined)<-var_names[a[,1],2]

#data set of average of each var for each activity and subject from 4. <- 5.
colnames(sub_combined)<-"subject"
b<-cbind(x_combined,activitylabel,sub_combined)
b_mean<-b %>% group_by(activitylabel,subject) %>% summarize_all(funs(mean))
write.table(b_mean,file="D:/Courseware/Sem 6/Data Science/Getting and cleaning data/Week 4/UCI HAR Dataset/tidy_dataset.txt", row.names = FALSE, col.names = TRUE)








