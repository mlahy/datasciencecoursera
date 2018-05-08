library(data.table)

############ Q1 ############ 
# Get the train data
subTrain = fread('.\\UCI HAR Dataset\\train\\subject_train.txt', header=FALSE)
XTrain = fread('.\\UCI HAR Dataset\\train\\X_train.txt', header=FALSE)
YTrain = fread('.\\UCI HAR Dataset\\train\\Y_train.txt', header=FALSE)

# Get the test data
subTest = fread('.\\UCI HAR Dataset\\test\\subject_test.txt', header=FALSE)
XTest = fread('.\\UCI HAR Dataset\\test\\X_test.txt', header=FALSE)
YTest = fread('.\\UCI HAR Dataset\\test\\Y_test.txt', header=FALSE)

# Get features
features = fread('.\\UCI HAR Dataset\\features.txt', header=FALSE)

# Bind the datasets
XData = rbind(XTrain, XTest)
YData = rbind(YTrain, YTest)
subData = rbind(subTrain, subTest)


############ Q2 ############
# List of column names containing mean or std
listOfColumns = grep("-mean\\(\\)|-std\\(\\)", features$V2)

# Subset of XData corresponding to listOfColumns
XData_MeanStd = subset(XData, select = listOfColumns)

# Names
featureNames = features[grep("-(mean|std)\\(\\)", features$V2), 2]

# Set the names as their corresponding name
names(XData_MeanStd) = as.character(featureNames$V2)

############ Q3 ############
# Label table
labels = fread(".\\UCI HAR Dataset\\activity_labels.txt")

# Set the int to the labels
YData$V1 = labels[YData$V1, 2]

############ Q4 ############
# Naming the V1 column of subData
names(subData) = "Subject"

# Naming the V1 column of YData
names(YData) = "Activity"

# Combining the data with cbind
DT = cbind(subData, YData, XData_MeanStd)

# Renaming with the gsub function
names(DT) <- make.names(names(DT))
names(DT) <- gsub('Acc',"Acceleration", names(DT))
names(DT) <- gsub('GyroJerk',"GyroscopeAcceleration", names(DT))
names(DT) <- gsub('Gyro',"GyroscopeSpeed", names(DT))
names(DT) <- gsub('Mag',"Magnitude", names(DT))
names(DT) <- gsub('^t',"Time.", names(DT))
names(DT) <- gsub('^f',"Frequency.", names(DT))
names(DT) <- gsub('\\.mean',".Mean", names(DT))
names(DT) <- gsub('\\.std',".StandardDeviation", names(DT))

############ Q5 ############
# means by Subject and by Activity
finalDT = aggregate(.~Subject+Activity, DT, mean)
finalDT = finalDT[order(finalDT$Subject, finalDT$Activity),]
write.table(finalDT, file = "tidydata.txt", row.name=FALSE)





