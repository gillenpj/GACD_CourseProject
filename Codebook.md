Codebook for HARDataAvg
=======================

The derived data set was created by merging the training and  test data sets from the HAR database to create a single data set. Only mean and standard deviation measurements were extracted (step 2 in R-script). Each extracted variable was averaged for each activity and each subject (step 5 in R-script).

For a detailed description of the features measured in the HAR database, please refer to the file *features_info.txt* in the original data set.

Variables
=========

* *Subject*, identifier of each of the thirty volunteers in the HAR experiement

* *Activity*, description of each of the six activities performed by each voluneer

* *(prefix)(signal).(statistic)[.direction]*
  * \(\mbox{prefix} \in \{\mbox{t}, \mbox{f}\}\)
  * \(\mbox{signal} \in \{
  \mbox{BodyAcc},
  \mbox{GravityAcc},
  \mbox{BodyAccJerk},
  \mbox{BodyGyro},
  \mbox{BodyGyroJerk},
  \mbox{BodyAccMag},
  \mbox{GravityAccMag},
  \mbox{BodyBodyAccJerkMag},
  \mbox{BodyBodyGyroMag},
  \mbox{BodyBodyGyroJerkMag}
  \}\)
  * \(\mbox{statistic} \in \{\mbox{mean}, \mbox{std}\}\)
  * \(\mbox{direction} \in \{\mbox{X}, \mbox{Y}, \mbox{Z}\}\)
 
Note, in the original data set, the Fast Fourier Transform, indicated by the prefix *f*, was not applied to the signals *GravityAcc*, *BodyGyroJerk*, and *GravityAccMag*.