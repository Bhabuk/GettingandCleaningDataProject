library(plyr)
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
path_to_file <- paste(getwd(), "datafile.zip", sep="/")
if(!file.exists(path_to_file)){
    download.file(url, path_to_file)
}
if(!file.exists("data")){
unzip("datafile.zip")
file.rename("UCI HAR Dataset", "data")
}

# 1. Merges the training and the test sets to create one data set.
joinedData <- rbind(read.table("./data/train/X_train.txt"), read.table("./data/test/X_test.txt"))
joinedLabel <- rbind(read.table("./data/train/y_train.txt"), read.table("./data/test/Y_test.txt"))
joinedSubject <- rbind(read.table("./data/train/subject_train.txt"), read.table("./data/test/subject_test.txt"))


# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
features <- read.table("./data/features.txt")
selectedFeatures <- grep("mean(){1}|std(){1}", features[,2])

joinedData <- joinedData[, selectedFeatures]
names(joinedData) <- features[selectedFeatures, 2]
# Make column name more readable
names(joinedData) <- gsub("\\(\\)","", names(joinedData))
names(joinedData) <- gsub("mean","Mean", names(joinedData))
names(joinedData) <- gsub("std","Std", names(joinedData))
names(joinedData) <- gsub("-","", names(joinedData))

# 3. Uses descriptive activity names to name the activities in the data set
activity <- read.table("./data/activity_labels.txt")
activityLabel <- activity[joinedLabel[,1], 2]
joinedLabel[,1] <- activityLabel
names(joinedLabel) <- "activity"

# 4. Appropriately labels the data set with descriptive variable names. 
names(joinedSubject) <- "subject"
tidydata <- cbind(joinedSubject, joinedLabel, joinedData)

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
finalData <- ddply(tidydata, .(subject, activity), function(x) colMeans(x[, 3:81]))
names(finalData) <- c("subject","activity",paste("Mean",names(finalData[,-c(1,2)]),sep=''))
write.table(finalData, "final_output.txt", sep = "\t", row.name=FALSE)
