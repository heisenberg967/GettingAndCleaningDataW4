This repo was created for the purposes of the course assignment of Week 4 of Getting and Cleaning Data.

Data for this project was obtained from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

We initially had separate training and test data, which were merged via code from run_analysis.R
Variables in X data are sensor signals obtained from 30 different subjects and varibles in Y data specifies the type of activity performed by the aforementioned subjects.
Mean and standard deviation of the merged data was calculated, each row containing the average of each type of acitivity for all subjects.

As per the given instructions, the following were performed in run_analysis.R:
1. Merged the training and the test sets to create one data set.
2. Extracted only the measurements on the mean and standard deviation for each measurement.
3. Used descriptive activity names to name the activities in the data set
4. Appropriately labeled the data set with descriptive variable names.
5. From the data set in step 4, created a second, independent tidy data set (tidy_dataset.txt) with the average of each variable for each activity and each subject.
