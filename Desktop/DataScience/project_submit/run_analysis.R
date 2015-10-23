xtest<-read.table("X_test.txt", header=FALSE) ## 2947*561 features
ytest<-read.table("y_test.txt", header=FALSE) ## 2947*1 activities
subjecttest<-read.table("subject_test.txt", header=FALSE) ## 2947*1 subjects
xtrain<-read.table("X_train.txt", header=FALSE)
ytrain<-read.table("y_train.txt", header=FALSE)
subjecttrain<-read.table("subject_train.txt", header=FALSE)

train<-cbind(subjecttrain, ytrain, xtrain)
test<-cbind(subjecttest, ytest, xtest)
total<-rbind(train, test)

install.packages("dplyr")
library(dplyr)

colnames(total)<-make.unique(colnames(total))

colnames(total)[colnames(total)=="V1"]<-"subject"
colnames(total)[colnames(total)=="V1.1"]<-"activity"

total$activity[total$activity==1]<-"walking"
total$activity[total$activity==5]<-"standing"
total$activity[total$activity==2]<-"walking_upstairs"
total$activity[total$activity==3]<-"walking_downstairs"
total$activity[total$activity==4]<-"sitting"
total$activity[total$activity==6]<-"laying"

feat<-read.table("features.txt", header=FALSE)
features<-feat[,2]
names(total)[3:563]<-as.character(features)




          
valid_column_names <- make.names(names=names(total), unique=TRUE, allow_ = TRUE)
names(total) <- valid_column_names
x<-select(total, matches("mean|std|subject|activity"))


y<-aggregate( x[,3:88], x[,1:2], FUN = mean )
write.table(y, file="tidy_data.txt", row.name=FALSE)

