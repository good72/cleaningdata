---
title: "CodeBook - Data Cleaning Project"
output:
  html_document:
    theme: null
---


Data's web site is at:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

data is from :
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip downloaded at 13 September 2014, 14:25:09

The original explaination of the data is best explained by this extract from "features_info.txt" supplied with data:

> Feature Selection 
> =================
>
> The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
> 
> Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
> 
> Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 
> 
> These signals were used to estimate variables of the feature vector for each pattern:  
> '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
> 
> * tBodyAcc-XYZ
> * tGravityAcc-XYZ
> * tBodyAccJerk-XYZ
> * tBodyGyro-XYZ
> * tBodyGyroJerk-XYZ
> * tBodyAccMag
> * tGravityAccMag
> * tBodyAccJerkMag
> * tBodyGyroMag
> * tBodyGyroJerkMag
> * fBodyAcc-XYZ
> * fBodyAccJerk-XYZ
> * fBodyGyro-XYZ
> * fBodyAccMag
> * fBodyAccJerkMag
> * fBodyGyroMag
> * fBodyGyroJerkMag
> 
> The set of variables that were estimated from these signals are: 
> 
> * mean(): Mean value
> * std(): Standard deviation
> * ...


The tided data only includes the mean and std values.  Additionally the training and test data have been combined into a single file - now distinguished by the "isTraining" column. The activity

Here's the columns in the tidied data:

Column                                | Type    | Notes
------------------------------------- | ------- | -------------------------------------------------------
 subject                              | integer | 1..30
 isTraining                           | logical | 
 activity                             | factor  | WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
 tBodyAcc.mean...X                    | double
 tBodyAcc.mean...Y                    | double
 tBodyAcc.mean...Z                    | double
 tBodyAcc.std...X                     | double
 tBodyAcc.std...Y                     | double
 tBodyAcc.std...Z                     | double
 tGravityAcc.mean...X                 | double
 tGravityAcc.mean...Y                 | double
 tGravityAcc.mean...Z                 | double
 tGravityAcc.std...X                  | double
 tGravityAcc.std...Y                  | double
 tGravityAcc.std...Z                  | double
 tBodyAccJerk.mean...X                | double
 tBodyAccJerk.mean...Y                | double
 tBodyAccJerk.mean...Z                | double
 tBodyAccJerk.std...X                 | double
 tBodyAccJerk.std...Y                 | double
 tBodyAccJerk.std...Z                 | double
 tBodyGyro.mean...X                   | double
 tBodyGyro.mean...Y                   | double
 tBodyGyro.mean...Z                   | double
 tBodyGyro.std...X                    | double
 tBodyGyro.std...Y                    | double
 tBodyGyro.std...Z                    | double
 tBodyGyroJerk.mean...X               | double
 tBodyGyroJerk.mean...Y               | double
 tBodyGyroJerk.mean...Z               | double
 tBodyGyroJerk.std...X                | double
 tBodyGyroJerk.std...Y                | double
 tBodyGyroJerk.std...Z                | double
 tBodyAccMag.mean..                   | double
 tBodyAccMag.std..                    | double
 tGravityAccMag.mean..                | double
 tGravityAccMag.std..                 | double
 tBodyAccJerkMag.mean..               | double
 tBodyAccJerkMag.std..                | double
 tBodyGyroMag.mean..                  | double
 tBodyGyroMag.std..                   | double
 tBodyGyroJerkMag.mean..              | double
 tBodyGyroJerkMag.std..               | double
 fBodyAcc.mean...X                    | double
 fBodyAcc.mean...Y                    | double
 fBodyAcc.mean...Z                    | double
 fBodyAcc.std...X                     | double
 fBodyAcc.std...Y                     | double
 fBodyAcc.std...Z                     | double
 fBodyAcc.meanFreq...X                | double
 fBodyAcc.meanFreq...Y                | double
 fBodyAcc.meanFreq...Z                | double
 fBodyAccJerk.mean...X                | double
 fBodyAccJerk.mean...Y                | double
 fBodyAccJerk.mean...Z                | double
 fBodyAccJerk.std...X                 | double
 fBodyAccJerk.std...Y                 | double
 fBodyAccJerk.std...Z                 | double
 fBodyAccJerk.meanFreq...X            | double
 fBodyAccJerk.meanFreq...Y            | double
 fBodyAccJerk.meanFreq...Z            | double
 fBodyGyro.mean...X                   | double
 fBodyGyro.mean...Y                   | double
 fBodyGyro.mean...Z                   | double
 fBodyGyro.std...X                    | double
 fBodyGyro.std...Y                    | double
 fBodyGyro.std...Z                    | double
 fBodyGyro.meanFreq...X               | double
 fBodyGyro.meanFreq...Y               | double
 fBodyGyro.meanFreq...Z               | double
 fBodyAccMag.mean..                   | double
 fBodyAccMag.std..                    | double
 fBodyAccMag.meanFreq..               | double
 fBodyBodyAccJerkMag.mean..           | double
 fBodyBodyAccJerkMag.std..            | double
 fBodyBodyAccJerkMag.meanFreq..       | double
 fBodyBodyGyroMag.mean..              | double
 fBodyBodyGyroMag.std..               | double
 fBodyBodyGyroMag.meanFreq..          | double
 fBodyBodyGyroJerkMag.mean..          | double
 fBodyBodyGyroJerkMag.std..           | double
 fBodyBodyGyroJerkMag.meanFreq..      | double
 angle.tBodyAccMean.gravity.          | double
 angle.tBodyAccJerkMean..gravityMean. | double
 angle.tBodyGyroMean.gravityMean.     | double
 angle.tBodyGyroJerkMean.gravityMean. | double
 angle.X.gravityMean.                 | double
 angle.Y.gravityMean.                 | double
 angle.Z.gravityMean.                 | double

