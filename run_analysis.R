# 1. Read the data files into R:
stest <- read.table("subject_test.txt")
xtest <- read.table("X_test.txt")
ytest <- read.table("Y_test.txt")
strain <- read.table("subject_train.txt")
xtrain <- read.table("X_train.txt")
ytrain <- read.table("Y_train.txt")
# 2. Merges the training and the test sets into one dataset
x <- rbind(xtrain, xtest)
y <- rbind(ytrain, ytest)
s <- rbind(strain, stest)
all <- cbind(s, y, x)
rm(xtest,ytest,xtrain,ytrain,strain,stest,x,y,s)  # removing data not required to clear space
# 3. Uses descritive activity names to name the activites and give descriptive variable names
features <- read.table("features.txt")
activities <- read.table("activity_labels.txt")
featureNames <- as.character(features[,2])
newCols <- c("subject", "activity", featureNames)
colnames(all) <- newCols
# 4. Create a new data frame whose measurement columns contain only mean and st. dev features
Means <- grep("mean()", colnames(all))
StDev <- grep("std()", colnames(all))
revisedColumns <- c(Means, StDev)
revisedColumns2 <- sort(revisedColumns) 
newDataFrame <- all[, c(1,2,revisedColumns2)]
newDataFrame2 <- newDataFrame[, !grepl("Freq", colnames(newDataFrame))] #get rid of the meanFreq columns

rm(newDataFrame, all)  # removing data not required to clear space
# 5. creating a second independent tidydata to show mean values for each subject-activity pair
tidy_frame <- data.frame()
for (i in 1:30) {
        subject<- subset(newDataFrame2,subject==i)
        for (j in 1:6){
                subact<- subset(subject, activity==j)
                tidy_data<-as.vector(apply(subact,2,mean))
                tidy_frame<-rbind(tidy_frame,tidy_data) 
        }
        
}
# 6. Renaming data to "tidy Data.txt"
colnames(tidy_frame)<-colnames(newDataFrame2) #rename the columns again, as the names get lost in the mix above
levels(tidy_frame[,2])<-c('walk','upstairswalk','downstairswalk', 'sit','stand', 'lay')
write.table(tidy_frame, "tidy Data.txt", sep = "")




