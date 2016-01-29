Getting and Cleaning Data Course Project
========================================
run_analysis.R is the script that runs to combine data from different files to single one and write the output to single file. This file contains the process in which run_analysis.R works.


1. Make sure you have GettingandCleaningdata folder in your home directory.

2. Use **source("run_analysis.R")** command in RStudio. 

3. The script **run_analysis.R**
    1. Creates directory Course Project and set this directory as home directory to work for this project
    2. Downloads the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip, extracts the data and rename the folder with "data".
    3. Creates data frame with data combined from train, test, label and subject data
    4. Selects only measurements on the mean and standard deviation for each measurement.
    5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
    6. Writes the output to the file **averageTidyData.txt**.

3. Output file **averageTidyData.txt** is generated as final output of the script with 180 * 81 dimension.

© Kishan K.C. 2015 All Rights reserved.
