##Course Project
##Setting the folder
setwd("C:/Project") ## this folder contains the "UCI HAR Dataset" folder

## (1) reading the files and making the Total Data Frame
features <- read.table("./UCI HAR Dataset/train/features.txt")
xtrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
ytrain <- read.table("./UCI HAR Dataset/train/Y_train.txt")
strain <- read.table("./UCI HAR Dataset/train/subject_train.txt")
trainTotal <- cbind(strain,ytrain,xtrain) ##Combine two tables
xtest <- read.table("./UCI HAR Dataset/test/X_test.txt")
ytest <- read.table("./UCI HAR Dataset/test/Y_test.txt") 
stest <- read.table("./UCI HAR Dataset/test/subject_test.txt")
testTotal <- cbind(stest,ytest,xtest) ##Combine two tables
dataTotal <- rbind(trainTotal,testTotal) ##Combine to obtain all data set
featuresL <- as.character(features[,2])  ##col names
featuresL <- append(featuresL,c("Subject","Test"),0)
colnames(dataTotal) <- featuresL ##dataTotal is the final merged data

## (2) Reducing the dta only for mean an std
meanDataIndex <- grep("mean",names(dataTotal))
stdDataIndex <- grep("std",names(dataTotal))
remainCol <- c(1,2,meanDataIndex,stdDataIndex)
dataTotalReduced <- dataTotal[,remainCol]

## (3) Naming the activities
library(dplyr)
labelsData <- read.table("activity_labels.txt")
colnames(labelsData) <- c("Test","Act.Label")
dataTotalReducedL <- merge(dataTotalReduced,labelsData)

## (4) Labeling the variables
## alreaqdy done in line 17

## (5) Grouping by lable and subject, preparing the last tidyData for the Step 5
dataGrouped <- group_by(dataTotalReducedL, Act.Label,Subject)
library(Hmisc)
colnames(dataGrouped)[1]="Act.Number" ##just to have a more clear name
tidyData5 <- summarise_each(dataGrouped,funs(mean)) ##THIS IS THE FINAL TIDY DATA FOR THE STEP 5


## Exporting to a txt file
## write.table(tidyData5,"./tidyData5.txt",row.name=FALSE)

print(tidyData5) ##printing the file to be used



