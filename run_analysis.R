library(dplyr)

dir1<-"HAR Dataset\\UCI HAR Dataset\\";

f_features <- read.delim(file = paste(dir1, "features.txt", sep=""), header=FALSE, sep = " ");

f_activities <- read.csv(file = paste(dir1, "activity_labels.txt", sep=""), header=FALSE, sep = " ")

### load subject datas, merge into single column, add a second column to indicate Training/test
subjectTrain <- read.csv(paste(dir1, "train\\subject_train.txt", sep=""), header=FALSE, col.names=c("subject"));
subjectTest  <- read.csv(paste(dir1,   "test\\subject_test.txt", sep=""), header=FALSE, col.names=c("subject"));

lbl <- rbind( matrix(rep(TRUE , dim(subjectTrain)[1]),nrow=dim(subjectTrain)[1] ), 
              matrix(rep(FALSE, dim(subjectTest)[1]),nrow=dim(subjectTest)[1] ));
colnames(lbl) <- c("isTraining")

f <- rbind( subjectTrain, subjectTest);
f <- cbind( f, lbl);

rm(subjectTrain)
rm(subjectTest)



# 8976 is width of Train/Test X files in characters - format is fixed width 16 character fields.

# w is number of columns 
#fieldWidth <- 16 
#w <- 8976 / fieldWidth ;

# selection of columns to load
# (NB must do this in read.fwf because of massive memory requirement.)
#chosenCols <- grep("mean|std", f_features$V2)

# read.fwf ignores columns with negative width
#widths <- rep(-fieldWidth, w);
#widths[ chosenCols ] <- fieldWidth ;

# specify all as numeric (speeds up read.fwf)
#colClasses <- rep("numeric", length(chosenCols) );
#myNames <- f_features$V2[chosenCols];

# specifying the number of rows is supposed to speed up loading and reduce memory usage.
#system.time(Xtrain <- read.fwf(paste(dir1, "train\\X_train.txt", sep=""), widths=widths, header=FALSE, colClasses=colClasses, col.names=myNames, nrow=7352));
Xtrain <- read.table(paste(dir1,   "train\\X_train.txt", sep=""),colClasses=c("numeric"), header=FALSE, col.names=f_features$V2);
Xtrain <- select( Xtrain, matches("mean|std"));

#system.time(Xtest  <- read.fwf(paste(dir1,   "test\\X_test.txt", sep=""), widths=widths, header=FALSE, colClasses=colClasses, col.names=myNames, nrow=2947));
Xtest <- read.table(paste(dir1,   "test\\X_test.txt", sep=""),colClasses=c("numeric"), header=FALSE, col.names=f_features$V2);
Xtest <- select( Xtest, matches("mean|std"));

f <- cbind( f, rbind( Xtrain, Xtest ));

rm(Xtrain)
rm(Xtest)

## read in the Y train/test files and label using the activities
Ytrain <- read.csv(paste(dir1, "train\\Y_train.txt", sep=""), header=FALSE , col.names=c("activity"));
Ytest  <- read.csv(paste(dir1,   "test\\Y_test.txt", sep=""), header=FALSE , col.names=c("activity"));

# relabel from 1-6 to activities.
act <- factor( rbind(Ytrain, Ytest )$activity, labels=f_activities[,2])

f <- cbind( f,  act )

rm(act)
rm(Ytrain)
rm(Ytest)

write.table(f, file = paste(dir1, "cleandata.txt" ,sep=""), row.names=FALSE)
