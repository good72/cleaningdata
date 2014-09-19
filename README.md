cleaningdata
============

Create a "Project" directory, get the code from github into the "Code" directory.  

Directory Structure:

+ Project
 + Code
    * CodeBook.md
    * README.md
    * run_analysis.R
    + HAR Dataset
        + UCI HAR Dataset
          * README.txt
          * features_info.txt
          * features.txt
          * activity_labels.txt
          + test
            ...
          + train
             ...
    + cleandata.txt          
           

To run the code:
* change the directory to "Project\\code" directory 
* unzip the "HAR Dataset.zip" to give the structure above
* make sure the "dir1" variable in run_analysis.R is set correctly - e.g. dir1<-"HAR Dataset\\UCI HAR Dataset\\";
* run the code: source('run_analysis.R')
* the output is "cleandata.txt"

