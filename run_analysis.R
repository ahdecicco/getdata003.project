#Specify file names for all relevant data files
features.file <- "./UCI HAR Dataset/features.txt"
activity.label.file <- "./UCI HAR Dataset/activity_labels.txt"

train.set.file <- "./UCI HAR Dataset/train/X_train.txt"
train.subject.file <- "./UCI HAR Dataset/train/subject_train.txt"
train.activity.file <- "./UCI HAR Dataset/train/y_train.txt"

test.set.file <- "./UCI HAR Dataset/test/X_test.txt"
test.subject.file <- "./UCI HAR Dataset/test/subject_test.txt"
test.activity.file <- "./UCI HAR Dataset/test/y_test.txt"

#Load data into R objects from file
features.df <- read.table(file=features.file)
activity.df <- read.table(file=activity.label.file)

train.df <- read.table(file=train.set.file)
train.subject.df <- read.table(file=train.subject.file)
train.activity.df <- read.table(file=train.activity.file)

test.df <- read.table(file=test.set.file)
test.subject.df <- read.table(file=test.subject.file)
test.activity.df <- read.table(file=test.activity.file)

#Set appropriate column names for data sets
colnames(features.df) <- c('feature.id', 'feature.label')
colnames(activity.df) <- c('activity.id', 'activity.label')

colnames(train.df) <- features.df[,2]
colnames(train.subject.df) <- 'subject.id'
colnames(train.activity.df) <- 'activity.id'

colnames(test.df) <- features.df[,2]
colnames(test.subject.df) <- 'subject.id'
colnames(test.activity.df) <- 'activity.id'

#Extract features with mean and standard deviation measurements
train.df <- subset(train.df, select= grep(colnames(train.df), pattern='mean|std', ignore.case=F))
test.df <- subset(test.df, select= grep(colnames(test.df), pattern='mean|std', ignore.case=F))

Merge 'subject' and 'activity' data with 'feature' data
train.df <- cbind(train.activity.df, train.df)
train.df <- cbind(train.subject.df, train.df)
colnames(train.df)[1] <- 'subject.id'
colnames(train.df)[2] <- 'activity.id'

test.df <- cbind(test.activity.df, test.df)
test.df <- cbind(test.subject.df, test.df)
colnames(test.df)[1] <- 'subject.id'
colnames(test.df)[2] <- 'activity.id'


#Merge test and training datasets
final.df <- rbind(train.df, test.df)

#Add activity labels
suppressWarnings(final.df <- merge(final.df, activity.df, by='activity.id', sort=F))
#Remove activity ids
final.df <- subset(final.df, select = -c(1))
#Reorder columns to get activity label before features
final.df <- subset(final.df, select = c(1, 81, 2:80))

final.df
