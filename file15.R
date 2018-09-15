#install.packages("rpart")
#install.packages("rpart.plot")
#Decision Tree

library(rpart)
library(rpart.plot)

education=factor(c(3,2,2,3,2,2,3,2,2,2))
married=factor(c('S','M','S','M','M','M','S','S','M','S'))
income=c(125,100,70, 120, 95, 60, 220, 85, 75, 90)
buy=factor(c(0,0,0,0,1,0,0,1,0,1))
(data= data.frame(buy, education, married, income))
head(data)

xtabs( ~ buy + education, data=data)

table(data$buy, data$education)
dtree1 = rpart(buy ~ education + married, data=data, parms=list(split='gini'),  minsplit=4, minbucket=2,cp=-1)
#Since the data set is small therefore we need to change the default value of minisplit and minibucket
#cp value is used to cut the decision set into smaller parts
#split is splited the data tree into two parts, default value of minisplit is 20 and minibucket is one-third the minisplit
#Now, splitting algorithm is 'gini'
dtree1
rpart.plot(dtree1, nn=T)#shows node number
#1st value is n, next is loss, then yval and lastly yprob
#root is the very first node
#serial number is the node number
#loss is the failure that is it is moving opposite of the track we want them to
#for example- for education=2, number of rows is 7, mode is 0 which means they are not buying(0 is not buying 1 is buying), loss is three which means that 3 data points is not in this track, 0.43 is the probability that person will buy and 70% is the amount of data that has an education 2
#for node=7, we can say that mode is 1 that is it is buying and 0.67 is the probability that person is buying and 30% of data is single and has an education of 2. 
printcp(dtree1)

head(data)
ndata1 = data.frame(education=factor(2), married='S', income=110)
predict(dtree1, newdata=ndata1, type='class')#trying to predict categorical data for probability use 'prob'
(p1=predict(dtree1, newdata=ndata1, type='prob'))
cbind(ndata1, p1)

