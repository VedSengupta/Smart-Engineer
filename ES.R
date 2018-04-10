library(datasets)
library(xlsx)

train.csv<-read.csv("E:/Programming Languages/Machine learning/Energy used/train.csv",header = TRUE)
test.csv<-read.csv("E:/Programming Languages/Machine learning/Energy used/test.csv",header = TRUE)

ind <- sample(2,nrow(train.csv), replace = TRUE,prob = c(1.0,0.0))
train <- train.csv[ind==1,]
indi <- sample(2,nrow(test.csv), replace = TRUE,prob = c(0.0,1.0))
test<-test.csv[indi==2,]
head(train)
head(test)

#training 
results<-lm(Energy~T1+RH_1+T2+RH_2+T3+RH_3+T4+RH_4+T5+RH_5+T6+RH_6+T7+RH_7+T8+RH_8+T9+RH_9+T_out+Press_mm_hg+RH_out+Windspeed+Visibility+Tdewpoint
,train)

#predicting
pred <-predict(results,test)
head(pred)
sample_submission.csv<-pred
View(sample_submission.csv)
setwd("E:/")
write.csv(pred,"sample_submission.csv")
