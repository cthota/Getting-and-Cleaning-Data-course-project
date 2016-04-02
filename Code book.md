Code Book for Getting and Cleaning Data Course Project


Additional information about the variables, data and transformations used in the course project for the Johns Hopkins Getting and Cleaning Data course.

Source Data

A full description of the data used in this project can be found at The UCI Machine Learning Repository

The source data for this project can be found here.

Data Set Information

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

Attribute Information

For each record in the dataset it is provided:

Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
Triaxial Angular velocity from the gyroscope.
A 561-feature vector with time and frequency domain variables.
Its activity label.
An identifier of the subject who carried out the experiment.

This code book describes the variables, the data, and any transformations or work that is performed to clean up the data
Description

In Step 1 after setting the source directory for the files, a code was written 
* to create one data set for the following training and test sets.

subject_train.txt
x_train.txt
y_train.txt
subject_test.txt
x_test.txt
y_test.txt

In step 2 a code was written to extracts only the mean and standard deviation for each measurement.
* Mean and standards for the variables are identified using grep function.
* Joined both the mean and standard indices. Removed parentheses’ ’()’after means and standards and hyphens(-)in columns and
* capitalized first letter in means and standards using gsub function to make the data look tidy.

In step3 a code was written to 
* remove underscore(_) in activity labels and to 
* change font to lower from upper and to use descriptive activity names to name the activities. 

In step 4 a code was written to 
* bind the data after initial cleaning and to write a table by merging data and to give descriptive variable names for each measurement.

In step 5 a code was written to 
* create a second, independent tidy data set which shows the average of each variable for each activity and each subject and to save the data to "tidy data.txt"
