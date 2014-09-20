Code book for the project
===================

## How the script works

- The script reads data and binds data sets of the same length by columns (separately training and test data sets). Then it binds together by rows training and test data, producting one big data set
- The script reads name of the variables (features.txt) and select only names of variables related to mean or standard deviation. Then it subsets from the big data set with numerical only columns related to the mean or standard deviation
- The script gives names of columns and delete: "()" or "-", but not before X,Y or X  . Furthermoe it writes "mean" and standard deviation" as "MEAN" and "SD"
- The script changes the name of activities from numbers to description. It uses the file activity_labels.txt with the names and with the use of function it replace numbers with names.
- The script changes class of subject and activity to a factor class and produces a new data set with the average of each variable for each activity and each subject. Finally it writes the final data set as txt file separated by TAB.
***
