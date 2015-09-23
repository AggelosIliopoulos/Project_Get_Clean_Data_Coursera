# 1.Merge the training and the test sets to create one data set

##Read Train Sets

train_X <- read.table("X_train.txt")
train_Y <- read.table("y_train.txt")
train_Subject <- read.table("subject_train.txt")

## Read Test Sets

test_X <- read.table("X_test.txt")
test_Y <- read.table("y_test.txt")
test_Subject <- read.table("subject_test.txt")

## Create X data set

X <- rbind(train_X, test_X)

## Create Y data set

Y <- rbind(train_Y, test_Y)

## Create Subject data set

Subject <- rbind(train_Subject, test_Subject)

# 2. Extraction of only the measurements on the mean and standard deviation for each measurement

## Read Features Table

features <- read.table("features.txt")

## Get Indices of Rows with Mean and Std in their names

Mean_Std_Indices <- grep("-(mean|std)\\(\\)", features$V2)

## Subset the desired columns in X

X_subset <- X[ , Mean_Std_Indices]

## Insert the column names
names(X_subset) <- features[Mean_Std_Indices, 2]

#3. Use descriptive activity names to name the activities in the data set

## Read Activity Labels

Activity_Labels <- read.table("activity_labels.txt")

## Update Y column with the corresponding activity names

Y[, 1] <- Activity_Labels[Y[, 1], 2]

## Correct Column Name in Y

names(Y) <- "activity"

# 4. Appropriately label the data set with descriptive variable names

## ## Correct Column Name in Subject

names(Subject) <- "subject"

## Create a single data set binding all previous data
Data <- cbind(X_subset, Y, Subject)


# 5. From the data set in step 4, create a second, 
#    independent tidy data set with the average of 
#    each variable for each activity and each subject.

## Use of ddply() function, which requires the plyr package.

library(plyr)

Data_average <- ddply(Data, c("subject", "activity"), function(x) colMeans(x[, 1:66]))

## Save Data_average in .txt format

write.table(Data_average, "Data_average.txt", row.name=FALSE)
