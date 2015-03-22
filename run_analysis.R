
##Load data
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")[,2]

features <- read.table("UCI HAR Dataset/features.txt")[,2]

train.set <- read.table("UCI HAR Dataset/train/X_train.txt")
train.label <- read.table("UCI HAR Dataset/train/y_train.txt")
train.subject <- read.table("UCI HAR Dataset/train/subject_train.txt")

test.set <- read.table("UCI HAR Dataset/test/X_test.txt")
test.label <- read.table("UCI HAR Dataset/test/y_test.txt")
test.subject <- read.table("UCI HAR Dataset/test/subject_test.txt")

## Set appropriate labels 
names(test.set) = features
names(train.set) = features

## Extract only the measurements
features.extract <- grepl("mean|std", features)
test.set <- test.set[,features.extract]
train.set <- train.set[,features.extract]

## Descriptive acitivity names in data set
train.label[,2] <- activity_labels[train.label[,1]]
test.label[,2] <- activity_labels[test.label[,1]]



## Set appropriate column names
names(test.label) <- c("Activity_ID","Activity_Label")
names(train.label) <- c("Activity_ID","Activity_Label")

names(test.subject) = "Subject"
names(train.subject) ="Subject"

## Bind data
data.test <- cbind(as.data.table(test.subject),test.label,test.set)
data.train <- cbind(as.data.table(train.subject),train.label,train.set)

## Merge data
data <- rbind(data.test,data.train)

## Set appropriate labels the data set
library(reshape2)
id_label=c("Subject","Activity_ID","Activity_Label")
variable_label <- setdiff(colnames(data), id_label)
data.melt <- melt(data, id=id_label,measure.vars=variable_label)

## create tidy data and print it to file.
data.tidy <- dcast(data.melt,Subject + Activity_Label ~ variable, mean)

write.table(data.tidy,file="./tidy_data.txt",row.names=FALSE)

