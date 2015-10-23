
==================================================================

The code provided in the file run_analysis.R compiles a tidy dataset from the following files:
-X_train.txt
-y_train.txt
-X_test.txt
-y_test.txt
-activity_labels.txt
-features.txt


the sequence of the steps is as follows:
=========================================

- the necessary files are downloaded into R
- 'train' dataset is obtained by merging the train datasets with subject IDs, activities and features columnwise
- 'test' dataset is obtained by merging the test datasets with subject IDs, activities and features column wise
- 'total' dataset is obtained by merging 'train' and 'test' datasets row wise
- the first and the second column of 'total' dataset are renamed "subject" and "activity"
-activities in the second column are names with descriptive values
- columns with features values are named as in "features.txt" file
-all the columns are given names which are easier to read than the initial ones
- the first, the second column and every column which name includes "mean" or "std" is included in 'x" dataset
- the "x" dataset is grouped by subject and activity (first two columns), for the rest 86 columns the mean is calculated
- the resultant dataset is written into file "tidy_data.txt"






