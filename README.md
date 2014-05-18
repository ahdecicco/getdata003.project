Getting and Cleaning Data
=====================================
Course Project
=====================================

Author: Nitish Vashishtha
Email: nitishv87@gmail.com

====================================


Q: What does the 'run_analysis.R' do?
A: As mentioned on the coursera web page for the course as well as the 'Project_instructions.txt' in this project. The script achieves the following
	1. Merges the training and the test sets to create one data set.
	2. Extracts only the measurements on the mean and standard deviation for each measurement. 
	3. Uses descriptive activity names to name the activities in the data set
	4. Appropriately labels the data set with descriptive activity names. 
	5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 


Q: How to use the 'run_analysis.R' script?
A: You can use the script either by running it from command line, using the command
	Rscript run_analysis.R
or you can run it from the R console, using the command
	source('run_analysis.R')
Note: The script returns a tidy data set, it would be a good idea to capture this data set into a R object, or else it will flood your console!


