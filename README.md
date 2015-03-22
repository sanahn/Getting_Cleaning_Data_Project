# Getting and Cleaning Data Project

## Project requirements
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Brief of run_analysis.R
The script is to create tidy data from raw sequence of data without specific categorizing in terms of cleaned data for analysis.

- Raw data information : http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
- Data source : https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Instruction to reproduce the tidy data
1. Download and unzip the data from the source.
2. Place run_analysis.R scrit in the parent directory of unzipped data directory.
3. Run the script. (reshape2 and data.table will be loaded through the script)
4. script will automatically generate "tidy_data.txt" in the same directory.

## Flow of script
1. data.table and reshape2 loaded
2. load data from downloaded directory
3. after the setting of column name, mean and standard devidation measurement will be extracted
4. after properly labeled, whole data will be bound in one table for each test and train
5. data merged
6. merged data will be melted and dcast-ed to format a tidy daya
