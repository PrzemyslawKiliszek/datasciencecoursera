How the script works
===================
##Preparation of data

- download the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip , then unzip the file and copy into R folder e.g. C:\\...\R\
- change the working directory of R to C:\\...\R\UCI HAR Dataset\ 
- run the file run_analysis.R on your computer


##How run_analysis.R works
- The script reads data and binds data sets of the same length by columns (separately training and test data sets). Then it binds together by rows training and test data, producing one big data set, named "All".
- The script reads name of the variables (features.txt) and select only names of variables related to mean or standard deviation. Then it subsets from the "All" data set only columns related to the mean or standard deviation + 2 columns with activity and subject.
- The script gives names of columns and delete: "()" or "-" (but not before X,Y or X). Furthermoe it writes "mean" and standard deviation" as "MEAN" and "SD".
- The script changes the name of activities from numbers to a description. It uses the file activity_labels.txt with the names and with the use of function p() it replace numbers with names.
- The script changes class of subject and activity to a factor class and produces a new data set with the average of each variable for each activity and each subject. Finally it writes the final data set as a txt file separated by TAB.

***
