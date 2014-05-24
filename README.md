Getting and Cleaning Data
=====================================
Course Project
=====================================

Author: Nitish Vashishtha

Email: nitishv87@gmail.com

Author's creation/test environment:

OS version: OSX 10.9.2
R version: 3.0.3 
Hardware: MacBook Pro, Late 2011
Tools: RStudio, Terminal.app

------------------------------------

Q: What can I find in this project repo?

A: 

1. README.md - Understand the repo, use the repo.
2. CodeBook.md - Explains how where the data came from, what the data means and how the data analysis was done.
3. Project_instructions.txt - Instructions copied verbatim from the Coursera project page. https://class.coursera.org/getdata-003/human_grading/view/courses/972136/assessments/3/submissions
4. run_analysis.R - R programming language script used for creating tidy data set.

-------------------------------------

Q: What's the purpose of the 'run_analysis.R' script?

A: 

As mentioned on the coursera web page for the course as well as the 'Project_instructions.txt' in this project. The script achieves the following
	1. Merges the training and the test sets to create one data set.
	2. Extracts only the measurements on the mean and standard deviation for each measurement. 
	3. Uses descriptive activity names to name the activities in the data set
	4. Appropriately labels the data set with descriptive activity names. 
	5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

-------------------------------------

Q: All that sounds good, but what exactly does this script do? Can you break it down for me?

A:

You can refer to the CodeBook.md for a more technical version for the data analysis, but here is an abridged version.

1. The script looks for the project's raw data in the current directory, if it either finds the zip file 'getdata-projectfiles-UCI HAR Dataset.zip' or the 'UCI HAR Dataset' directory, it assumes you have the raw data locally and uses it, if not it attempts to download the data from the project data source mentioned in Project_instructions.txt file or the Coursera web page for the project.
2. Load the raw data files into the programming environment.
3. Combine segregated raw data into an exhaustive combined data set.
4. Attach appropriate descriptive labels to columns.
5. Perform computations on the data set to obtain the desired tidy data set.

-------------------------------------

Q: How do I use the 'run_analysis.R' script?

A:

Assuming you have R programming language installed in your system. (if not, refer to http://cran.r-project.org/doc/manuals/r-release/R-admin.html ) 

You can use the script either by running it from command line, using the command
	
	Rscript run_analysis.R

or you can run it from the R console, using the command

	source('run_analysis.R')

Note: The script returns a tidy data set, it would be a good idea to capture this data set into a R object, or else it will flood your console!
