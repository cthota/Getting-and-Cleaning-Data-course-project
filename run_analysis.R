#Step1.Merges the training and test sets to create one data set
xtrain <- read.table("X_train.txt")
ytrain <- read.table("y_train.txt")
strain <- read.table("subject_train.txt")
xtest <- read.table("X_test.txt")
ytest <- read.table("y_test.txt") 
stest <- read.table("subject_test.txt")
xData <- rbind(xtrain, xtest)
yData <- rbind(ytrain, ytest)
sData<- rbind(strain, stest)

# Step2. Extracts only the measurements on the mean and standard 
# deviation for each measurement. 
features <- read.table("features.txt")
meanStdIndices <- grep("mean\\(\\)|std\\(\\)", features[, 2])
joinData <- xData [, meanStdIndices]
names(joinData) <- gsub("\\(\\)", "", features[meanStdIndices, 2]) # remove "()"
names(joinData) <- gsub("mean", "Mean", names(joinData)) # capitalize M
names(joinData) <- gsub("std", "Std", names(joinData)) # capitalize S
names(joinData) <- gsub("-", "", names(joinData)) # remove "-" in column names 

# Step3. Uses descriptive activity names to name the activities in 
# the data set
activity <- read.table("activity_labels.txt")
activity[, 2] <- tolower(gsub("_", "", activity[, 2]))
substr(activity[2, 2], 8, 8) <- toupper(substr(activity[2, 2], 8, 8))
substr(activity[3, 2], 8, 8) <- toupper(substr(activity[3, 2], 8, 8))
activityLabel <- activity[yData [, 1], 2]
yData [, 1] <- activityLabel
names(yData ) <- "activity"

# Step4. Appropriately labels the data set with descriptive activity 
# names. 
names(sData) <- "subject" 
cleanedData <- cbind(sData, yData , joinData)
write.table(cleanedData, "merged_data.txt") # writes the 1st dataset

# Step5. Creates a second, independent tidy data set with the average of 
# each variable for each activity and each subject. 
subjectLen <- length(table(sData)) 
activityLen <- dim(activity)[1] 
columnLen <- dim(cleanedData)[2]
Outcome <- matrix(NA, nrow=subjectLen*activityLen, ncol=columnLen) 
Outcome <- as.data.frame(Outcome)
colnames(Outcome) <- colnames(cleanedData)
row <- 1
for(i in 1:subjectLen) {
        for(j in 1:activityLen) {
                Outcome[row, 1] <- sort(unique(sData)[, 1])[i]
                Outcome[row, 2] <- activity[j, 2]
                bool1 <- i == cleanedData$subject
                bool2 <- activity[j, 2] == cleanedData$activity
                Outcome[row, 3:columnLen] <- colMeans(cleanedData[bool1&bool2, 3:columnLen])
                row <- row + 1
        }
}
write.table(Outcome, "tidy data.txt",row.names = FALSE) # writes out the tidy dataset
