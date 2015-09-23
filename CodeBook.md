## 1. Merge the training and the test sets to create one data set
Initially, the program reads all the ".txt" files corresponding to train and test sets, namely the x_train.txt, y_train.txt, x_test.txt, y_test.txt, subject_train.txt and subject_test.txt. 

In the following the corresponding files are merged in order to produce new datasets, such as train_X, train_Y and train_Subject, as well as  test_X, test_Y and test_Subject. 

The final data variables are derived simply from the rbinding of the previous data sets. The final variables are: X,Y, Subject.

## 2. Extraction of only the measurements on the mean and standard deviation for each measurement

In order to extract only the measurements corresponding to mean and standart deviation, we select the indices of the features.txt file which correspond to mean or std rows. With these indices we subset variable X creating a new variable called X_subset. 

##3. Use descriptive activity names to name the activities in the data set

Similarly, selecting the labels of activity_labels.txt, we replace the numbers in the rows of column 1 of Y with the corresponding labels, uppdating Y.

## 4. Appropriately label the data set with descriptive variable names
After giving the appropriate names in the columns of X_subset, Y and Subject with names() function, a Data variable is generated containing three columns (X, Y, Subject)

## 5. From the data set in step 4, create a second,  independent tidy data set with the average of each variable for each activity and each subject.

In order to generate tidy data, the ddply() function is used, which requires the plyr package and the tidy data is named as Data_average which is saved in .txt format.




