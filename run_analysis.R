means<-c(1:3,41:43,81:83,121:123,161:163,201,214,227,240,253,266:268,345:347,424:426,503,516,529,542)
stds<-c(4:6,44:46,84:86,124:126,164:166,202,215,228,241,254,269:271,348:350,427:429,504,517,530,543)
to.keep <- c(means,stds)
to.keep <- sort(to.keep)

featNames <- read.table("UCI HAR Dataset/features.txt",header = F,stringsAsFactor=F)

train <- read.table("UCI HAR Dataset/train/X_train.txt")
train <- train[,to.keep]
colnames(train)<-featNames[to.keep,2]
subjTrain <- read.table("UCI HAR Dataset/train/subject_train.txt")
actTrain <- read.table("UCI HAR Dataset/train/y_train.txt")
train2 <- cbind(subjTrain,actTrain,train)

test <- read.table("UCI HAR Dataset/test/X_test.txt")
test <- test[,to.keep]
colnames(test)<-featNames[to.keep,2]
subjTest <- read.table("UCI HAR Dataset/test/subject_test.txt")
actTest <- read.table("UCI HAR Dataset/test/y_test.txt")
test2 <- cbind(subjTest,actTest,test)
merged <- rbind(train2,test2)

actName <- read.table("UCI HAR Dataset/activity_labels.txt",header = F,stringsAsFactor=F)
actName <- actName[,2]
merged[,2] <- factor(merged[,2],labels = actName)
names(merged)[1] <- "Subjects"
names(merged)[2] <- "Activities"

aggdata <-aggregate(merged, by=list(Grouped.Activitiy = merged$Activities, Grouped.Subject = merged$Subjects), FUN=mean)
aggdata[,3] <- NULL
aggdata[,3] <- NULL
aggdata$temp <- aggdata$Grouped.Activitiy
aggdata$Grouped.Activitiy <- aggdata$Grouped.Subject
aggdata$Grouped.Subject <- aggdata$temp
names(aggdata)[c(1,2)] <- c("Grouped.Subject","Grouped.Activitiy")
write.table(aggdata,"Course Project.txt",row.name=FALSE)






