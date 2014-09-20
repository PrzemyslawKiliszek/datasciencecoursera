Code book
=========
The data were obtained from the URL: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

The original description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 


##Code
The R code for cleaning data is in the file Run_analysis.R in this repo.

- At first, the data were merged into one data set (10299 observation in 563 variables) in a file called "All".
- To select only columns regarding mean or SD, the description of variables was loaded from the file "features.txt" as "a" object with 477 levels. From the object "a" were selected 86 variables related to mean or SD, creating the object "c". With the use of object c, specific columns were selected from object "All", creating "All.select"
- Then the names of variables were given to the object "All.select" with the use of a derivative object of c. Subsequently, the activities were labeled with description instead of numbers with the use of file "activity_labels.txt". 
- Finally, the mean for each variable was calculated for each person and each activity, creating an object "tidy".

***
## Experimental design (based on original description)

The experiments have been carried out with a group of 30 volunteers, age: 19-48. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

*** 

## Description of variables

### activity
one of six activities: WALKING, WALKING UPSTAIRS, WALKING DOWNSTAIRS, SITTING, STANDING, LAYING peformed by a subject
### subject
volunteers labeled by ID 1-30
### code for other variables
- domain: t - time | f - frequency
- acceleration: Body | Gravity 
- instrument: Acc - accelerometr | Gyro - gyroscope
- calculation: MEAN | SD - standard deviation
- Axis in euclidean system: X, Y, Z
- other: Jerk - Jerk signals | Magn - Magnitude | Freq - Frequency | Angle - angle between 2 vectors

***
## units
- Frequency: Hz
- Time: Sec
- Angle: Radius
