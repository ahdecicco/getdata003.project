Study Design
============delimited
The goal of the project is to learn to extract, link and summarise data to obtain a tidy data set from raw data.

The raw data for this project has been obtained from the archives of University of California Irvine's Machine Learning Repository.
Information of dataset as described on the data set's website(http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) is as follows

Abstract:
Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.

Detail:
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

Source:
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto. 
Smartlab - Non Linear Complex Systems Laboratory 
DITEN - UniversitÃ  degli Studi di Genova, Genoa I-16145, Italy. 
activityrecognition '@' smartlab.ws 
www.smartlab.ws

Raw data set download source:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


Code Book
=========

Measurement based continuous features
--------------------------
These files have 561 features, corresponding to the columns of raw data set. The descriptive names of these features are in 'features.txt'
Refer to features file as mentioned below for exact feature names.

All the features are derived from some basic measurements as described below.
1. The basic features/measurements selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.
These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise.

2. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

3. Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

4. Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).

These signals were used to estimate variables of the feature vector for each pattern:
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are:

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values.
iqr(): Interquartile range
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal
kurtosis(): kurtosis of the frequency domain signal
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

5. Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

e.g. angle(tBodyAccMean,gravity)i

Note:
- All the above mentioned feature names which have been extracted from given metadata have been used as column names in R data frame.
- All '()' i.e. empty round bracket pairs have been zapped, and all other punctuation characters have been replaced with dot character '.'
- The case of letters in the names have been left intact, this to maintain the nomenclature of the original data set.


Categorical/Nominal features
----------------

1. Subject
A numeric value that identifies the 'Subject' who performed the 'Activity' for each window sample. Its range is from 1 to 30.
R data frame column name: subject.id
R data frame column type: numeric

2. Activity
The 'Activity' which a 'Subject' was performing when the features/measurements were captured/recorded.
Refer to activity file as mentioned below for exact labels.
R data frame column name: activity.label
R data frame column type: character

Note:
- All the activity labels which have been extracted from given metadata have been used as column names in R data frame.
- All '()' i.e. empty round bracket pairs have been zapped, and all other punctuation characters have been replaced with dot character '.'
- The case of letters in the names have been changed to lower case.


Locating files for data analysis
--------------------------------
The data set has been extracted into the directory 'UCI HAR Dataset'.
Hereafter any file location mentioned is relative to this directory.

1. Features
location: ./features.txt
A space delimited list of features with feature id and feature name in each row corresponding to one of the 561 measurement based features as described earlier.

2. Activities
location: ./activity_labels.txt
A space delimited list of activities with activity id and activity label in each row corresponding to each of the 6 'Activity' which the 'Subject' is performing.

3. Raw data
Training data set location: ./train/X_train.txt
Test data set location: ./test/X_test.txt

A space delimited data file, which comprises of 561 measurement based features as described above as columns, and each row corresponds to a unique combination of a particular 'Subject' performing a particular 'Activity', both 'Subject' and 'Activity' belonging to the set of possible values as defined above.

4. Each row of the raw data is mapped to a unique combination of the two nominal features Activity and Subject.
The data in raw data is linked to the Subject and Activity metadata using the following files:

Training data set subject id for each row, location: ./train/subject_train.txt
Test data set subject id for each row, location: ./test/subject_test.txt

Training data set activity id for each row, location: ./train/y_train.txt
Test data set activity id for each row, location: ./test/y_test.txt

Note: 'Activity' ids have been removed from tidy data set, since 'Activity' label is a more descriptive value for the nominal feature.

Data analysis using R
---------------------

Here are the steps used to obtain the tidy data set as required for the project.

1. Read the raw data files for training and test data sets, as well as their respective metadata for measured features, activities and subjects into R data frame objects.
2. Assign appropriate column names to all data frames using the provided metadata.
3. Filter the raw data to extract only those features which are mean or standard deviation measurements, essentially any feature with descriptive name having strings 'mean' or 'std', case sensitive search.
4. Merge the subject and activity metadata with respective training and test raw data sets.
5. Merge the newly obtained training and test data sets, into a combined data set which now has all possible observations in the current data space.
6. Extract the tidy data set, by filtering the combined data set to get a mean of the feature values for all possible unique pairs of 'activity' and 'subject' features.
7. Format and re-order the data to a more presentable form.
8. Return tidy data set


