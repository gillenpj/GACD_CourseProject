##########################################################
# Getting and Cleaning Data Course Project - 24 May 2014 #
##########################################################

library(plyr) # install.packages("plyr")

#
# 0. Reads data from Samsung data directory
#

dataDirectory <- "UCI HAR Dataset"

features <- read.table(file.path(dataDirectory, "features.txt"))
activity.labels <- read.table(file.path(dataDirectory, "activity_labels.txt"))

subject.test <- read.table(file.path(dataDirectory, "test", "subject_test.txt"))
y.test <- read.table(file.path(dataDirectory, "test", "y_test.txt"))
X.test <- read.table(file.path(dataDirectory, "test", "X_test.txt"))

subject.train <- read.table(file.path(dataDirectory, "train", "subject_train.txt"))
y.train <- read.table(file.path(dataDirectory, "train", "y_train.txt"))
X.train <- read.table(file.path(dataDirectory, "train", "X_train.txt"))

#
# 1. Merges the training and the test sets to create one data set
#

subject <- rbind(subject.train, subject.test)
names(subject) <- "Subject"

y <- rbind(y.train, y.test)
names(y) <- "Activity"

X <- rbind(X.train, X.test)
names(X) <- make.names(features$V2)

HARData <- cbind(subject, y, X)

#
# 2. Extracts only the measurements on the mean and standard deviation for each measurement
#

HARData <- HARData[, grep("Subject|Activity|\\.(mean|std)\\.", names(HARData))] # keeps columns that contain Subject or Activity or .mean. or .std.

#
# 3. Uses descriptive activity names to name the activities in the data set
#

HARData <- transform(HARData, Activity = activity.labels$V2[Activity])

#
# 4. Appropriately labels the data set with descriptive names
#

# this step is mostly done already; just need to tidy up column names

names(HARData) <- gsub("\\.+", "\\.", names(HARData)) # replaces multiple periods with single periods
names(HARData) <- gsub("\\.$", "", names(HARData)) # removes single period at end of column name

#
# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject
#

HARDataAvg <- ddply(HARData,
                    .(Subject, Activity),
                    .fun = function(df)
                            sapply(df[, -c(1, 2)], mean)
                    )

write.table(HARDataAvg, file = "HARDataAvg.txt", row.names = FALSE)