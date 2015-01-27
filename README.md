# Project-Data-Cleaning
Project of course Getting and Cleaning Data
## Study Design
* The code beginning reading the txt data files, them I merged the label, the activity and the subject, I put the colnames to the 
data set, the easiest way to do this is with rbind and cbind.
* The next stpe is reduce the data set, only for the variables which are asked
* Inmediatly I put the labels for the activity merging the data set with the file activity_labels.txt
* And the last step is to group by the Activity Label and the Subject Label, using the mean of all variables, this step is more easy * if you use the summarise_each
* Finally export and print the results.

## Code Book
* xtrain, ytrain, strain: contain the x,y and subject values for the training data set
* xtest, ytest, stest: contain the x,y and subject values for the test data set
* trainTotal, testTotal:  contains all the training and test data sets merged
* featuresL: the names of all the variables
* dataTotal: contains the whole data set, with variable names included, 10299 x 563
* dataTotalReduced: contains only the variables asked (means and std´s)
* labelsData: conytains the labelos for activity
* dataTotalReducedL: contains the variables asked included the labels for activity
* dataGrouped: data set grouped by label activity and subject
* tidyData5: is the final data set, containing a mean summarized by label activity and subject
