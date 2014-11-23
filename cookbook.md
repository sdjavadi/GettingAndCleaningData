* means : an integer vector to save indices of measurements on the mean for each measurements

* stds : an integer vector to save indices of measurements on the standard deviation for each measurements

* to.keep : all measurement that need to be extracted. (union of "means" and "stds")

* featNames : names of the extracted features features. (from file UCI HAR Dataset/features.txt)

* train : a data frame corresponding to train dataset.It only keeps desired columns that is stored in "to.keep" variable. names of the remained columns are assigned by "featNames".
		
* subjTrain : ID of subjects that are present in train dataset.

* actTrain : ID of activities corresponding to each record of train data set.

* train2 : final train dataset including ID of subjects and their activity ID

* test : a data frame corresponding to test dataset. It only keeps desired columns that is stored in "to.keep" variable. names of the remained columns are assigned by "featNames".

* subjtest : ID of subjects that are present in test dataset.

* actTest : ID of activities corresponding to each record of test data set.

* test2 : final test dataset including ID of subjects and their activity ID

* merged : obtained data frame by merging test2 and train2 datasets.

* Note that it was possible to merge two datasets and removed unwanted columns, but it seems merging two big datasets will require higher memory resources.

* I decided to label variables before merging any additional column (i.e. subject ID and Activity ID). If i would label them after merging, i should add 2 to all indices of variable "to.keep".

===========================================
End of Cases 1-2,4
===========================================

* actName : Name of the activity corresponding to activity ID. (UCI HAR Dataset/activity_labels.txt). i replaced each ID with its activity Name.

===========================================
End of Case 3
===========================================
* For the last case, i used aggregate() function to create a second, independent tidy data set (called "aggdata") with the average of each variable for each activity and each subject.
after Changing the name of Subject ID and Activity ID, the obtained dataset is saved as "Course Project.txt" in the current workspace.

===========================================
End of Case 5
===========================================
