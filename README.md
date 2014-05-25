Introduction
============

These data are derived from the [Human Activity Recognition (HAR) Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).  The means and standard deviations of the 33 signals from the smartphones' accelerometers and gyroscopes, worn by the 30 subjects each performing the 6 activities, were extracted from the *training* and *test* data sets and averaged for each subject and activity.

Contents
========

The repo consists of:

1. README.md, this file

2. Codebook.md, information about the variables in the derived data set

3. run_analysis.R, a script for creating the derived data set from the original data set

Instructions
============

Download the HAR data set from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). Extract the contents of the zip file into the directory *UCI HAR Dataset*, which should be in your working directory.  Source the script *run_analysis.R* to create the file *HARDataAvg.txt* containing the derived data set.