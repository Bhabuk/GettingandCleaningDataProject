Getting and Cleaning Data Course Project
========================================

Code Book
========================================

## Subject and Activity

These variables identify the unique subject/activity pair the variables relate to:

Subject: the integer subject ID.

Activity: the string activity name

Possible values for Activity:
  Walking
  Walking Upstairs
  Walking Downstairs
  Sitting
  Standing
  Laying
  
## Measurements
All variables are the mean of a measurement for each subject and activity. These measurements are done on different axis X,Y and Z. 
  
After setting working directory, different files were read and then loaded to data frame which were used for analysis. The file that were read are 

* features.txt
* activity_labels.txt
* subject_train.txt
* x_train.txt
* y_train.txt
* subject_test.txt
* x_test.txt
* y_test.txt

1. Values of Varible Activity consist of data from "Y_train.txt" and "Y_test.txt"
2. values of Varible Subject consist of data from "subject_train.txt" and subject_test.txt"
3. Values of Varibles Features consist of data from "X_train.txt" and "X_test.txt"
4. Names of Varibles Features come from "features.txt"
5. levels of Varible Activity come from "activity_labels.txt"

**These Names are used as descriptive names.**

Data from different files are loaded and merged into one. Using ddply function of plyr package, final tidy dataset was prepared with average of each variable for each activity and each subject.

© Bhabuk Singh Kunwar 2015 All Rights reserved.
