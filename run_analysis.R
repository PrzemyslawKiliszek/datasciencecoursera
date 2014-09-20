# Merging the training and test data sets to create one

Xtrain<- read.table("train/X_train.txt")
Ytrain<- read.table("train/y_train.txt")
Subtrain<- read.table("train/subject_train.txt")
Training<-cbind(Xtrain, Ytrain, Subtrain)

Xtest<- read.table("test/X_test.txt")
Ytest<- read.table("test/y_test.txt")
Subtest<- read.table("test/subject_test.txt")
Test<-cbind(Xtest,Ytest,Subtest)

All<-rbind(Training,Test)

# Extracting only the measurements on the mean and standard deviation for each measurement

features <- read.table("features.txt")
a<-features[,2]
grepl("mean",a)
b<-(grepl("mean",a) | grepl ("std",a) | grepl("Mean",a))
c<-features[b,]
d1<-c[,1] #number
d2<-c[,2] #name
selected.col<-c(d1,562,563)
All.select<-All[,selected.col]

# Appropriately labeling the variables 

c$V2<-as.character(c$V2)
d2<-c[,2]
d2<-sub("\\()","",d2)
d2<-sub("\\-","",d2)
d2<-sub("mean","MEAN",d2)
d2<-sub("Mean","MEAN",d2)
d2<-sub("std","SD",d2)

colnames(All.select) <- c(d2, "Activity", "Subject")

# Using descriptive activity names instead of numbers

activity<-read.table("activity_labels.txt")

x<-nrow(activity)
p<-function(x){
		for (j in 1:nrow(activity)){
			h<-activity[j,1]
			i<-activity[j,2] 	
			All.select$Activity<<-sub(h,i,All.select$Activity)	#<<- giving to global env.			
			}

}
p(x)

# Creating a tidy data set with the average of each variable for each activity and each subject.

All.select$Activity<-factor(All.select$Activity)
All.select$Subject<-factor(All.select$Subject)

tidy = aggregate(All.select, by=list(activity = All.select$Activity, subject=All.select$Subject), mean)
tidy$Activity<-NULL
tidy$Subject<-NULL
write.table(tidy, "tidy_tab.txt", row.name=FALSE, sep="\t")
