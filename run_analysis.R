#
#Check if raw data already present in the repo, if not attempt to download it from the web source
#
if(!file.exists('UCI HAR Dataset/')) {
	if(!file.exists('getdata-projectfiles-UCI HAR Dataset.zip')) {
		download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip');
		}
		unzip('getdata-projectfiles-UCI HAR Dataset.zip');
}

#
#Specify file names for all relevant data files
#
features.file <- "./UCI HAR Dataset/features.txt"
activity.label.file <- "./UCI HAR Dataset/activity_labels.txt"

train.set.file <- "./UCI HAR Dataset/train/X_train.txt"
train.subject.file <- "./UCI HAR Dataset/train/subject_train.txt"
train.activity.file <- "./UCI HAR Dataset/train/y_train.txt"

test.set.file <- "./UCI HAR Dataset/test/X_test.txt"
test.subject.file <- "./UCI HAR Dataset/test/subject_test.txt"
test.activity.file <- "./UCI HAR Dataset/test/y_test.txt"

#
#Load data into R objects from file
#
features.df <- read.table(file=features.file)
activity.df <- read.table(file=activity.label.file)

train.df <- read.table(file=train.set.file)
train.subject.df <- read.table(file=train.subject.file)
train.activity.df <- read.table(file=train.activity.file)

test.df <- read.table(file=test.set.file)
test.subject.df <- read.table(file=test.subject.file)
test.activity.df <- read.table(file=test.activity.file)

#
#Set appropriate column names for data sets
#
colnames(features.df) <- c('feature.id', 'feature.label')
colnames(activity.df) <- c('activity.id', 'activity.label')

features.df[,2] <- sapply( features.df[,2], function(arg) { arg = gsub(arg, pattern='\\(\\)', replacement='');arg = gsub(arg, pattern='[[:punct:]]', replacement='.') } )
activity.df[,2] <- sapply( activity.df[,2], function(arg) { arg = tolower(gsub(arg, pattern='\\(\\)', replacement=''));arg = gsub(arg, pattern='[[:punct:]]', replacement='.') } )

colnames(train.df) <- features.df[,2]
colnames(train.subject.df) <- 'subject.id'
colnames(train.activity.df) <- 'activity.id'

colnames(test.df) <- features.df[,2]
colnames(test.subject.df) <- 'subject.id'
colnames(test.activity.df) <- 'activity.id'

#
#Extract features with mean and standard deviation measurements
#
train.df <- subset(train.df, select= grep(colnames(train.df), pattern='mean|std', ignore.case=F))
test.df <- subset(test.df, select= grep(colnames(test.df), pattern='mean|std', ignore.case=F))

#
#Merge 'subject' and 'activity' metadata with 'feature' data
#
train.df <- cbind(train.activity.df, train.df)
train.df <- cbind(train.subject.df, train.df)
colnames(train.df)[1] <- 'subject.id'
colnames(train.df)[2] <- 'activity.id'

test.df <- cbind(test.activity.df, test.df)
test.df <- cbind(test.subject.df, test.df)
colnames(test.df)[1] <- 'subject.id'
colnames(test.df)[2] <- 'activity.id'

#
#Merge test and training datasets
#
final.df <- rbind(train.df, test.df)

#
#Add activity labels
#
suppressWarnings(final.df <- merge(activity.df, final.df, by='activity.id', sort=F))

#
#Remove activity id column, put subject id as first column
#
final.df <- subset(final.df, select = c(3, 2, 4:ncol(final.df)))

#
#Aggregate data for unique combinations of the subject and activity features
#It is similar to a group by clause in SQLs, so here we are grouping by two keys, activity and subject, 
#the aggregate function 'mean' gets applied to each of the remaining columns as specified
#now the number of rows will be determined by the combined key i.e. = (no. of activities) * (no. of subjects) = 6 * 30 = 180
#
tidy.data <- aggregate( final.df[,3:ncol(final.df)], by=final.df[,1:2], FUN=mean )

#
#Create the final tidy data, with just one variable for all the continuous features / measurement based features
#The subject and activity combination go as the keys for the rows
#The total number of rows will now be = (no. of measurement features) * (no. of activities) * (no. of subjects) = 79 * 6 * 30 = 14220
#
library(reshape2)
tidy.data = melt(tidy.data, id=colnames(tidy.data[,1:2]), measure.vars=colnames(tidy.data[,3:ncol(tidy.data)]))
#
#Return
#
tidy.data
