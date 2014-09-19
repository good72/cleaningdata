library(dplyr)

dir1<-"HAR Dataset\\UCI HAR Dataset\\";

f_features   <- read.delim(file = paste(dir1, "features.txt"       , sep=""), header=FALSE, sep = " ")
f_activities <- read.csv  (file = paste(dir1, "activity_labels.txt", sep=""), header=FALSE, sep = " ")

###
### read subject files
###
subjectTrain <- read.csv(paste(dir1, "train\\subject_train.txt", sep=""), header=FALSE, col.names=c("subject"))
subjectTest  <- read.csv(paste(dir1,   "test\\subject_test.txt", sep=""), header=FALSE, col.names=c("subject"))

f <- rbind( subjectTrain, subjectTest)

### create a new logical column "isTraining" 
lbl <- rbind( matrix(rep(TRUE , dim(subjectTrain)[1]),nrow=dim(subjectTrain)[1] ), 
              matrix(rep(FALSE, dim(subjectTest )[1]),nrow=dim(subjectTest )[1] ))
colnames(lbl) <- c("isTraining")

f <- cbind( f, lbl)

rm(subjectTrain)
rm(subjectTest)

###
### read the X train/test data values
###
Xtrain <- read.table(paste(dir1, "train\\X_train.txt", sep=""), colClasses=c("numeric"), header=FALSE, col.names=f_features$V2)
Xtest  <- read.table(paste(dir1, "test\\X_test.txt"  , sep=""), colClasses=c("numeric"), header=FALSE, col.names=f_features$V2)

Xtrain <- select( Xtrain, matches("mean|std"))
Xtest  <- select( Xtest,  matches("mean|std"))

f <- cbind( f, rbind( Xtrain, Xtest ))

rm(Xtrain)
rm(Xtest)

###
### read the "Y" train/test files and which contain the activity value column 
###
Ytrain <- read.csv(paste(dir1, "train\\Y_train.txt", sep=""), header=FALSE , col.names=c("activity"))
Ytest  <- read.csv(paste(dir1, "test\\Y_test.txt"  , sep=""), header=FALSE , col.names=c("activity"))

# relabel from 1-6 to activities (e.g. STANDING, WALKING....)
act <- factor( 
    rbind(Ytrain, Ytest )$activity, 
    labels=f_activities[,2]
    )

# add activity column
f <- cbind( f,  act )

rm(act)
rm(Ytrain)
rm(Ytest)

###
### Write out tidied data
###
write.table(f, file = paste(dir1, "cleandata.txt" ,sep=""), row.names=FALSE)
