#Decision Tree: Predict Probability of Selection  

df =  read.csv("https://stats.idre.ucla.edu/stat/data/binary.csv")
library(rpart)
df$rank = factor(df$rank)
df$admit=factor(df$admit)
dim(df)
dtree3=rpart(admit~gre + gpa + rank, data=df, cp=-2)
dtree3
library(rpart.plot)
printcp(dtree3)
rpart.plot(dtree3, cex=0.5, nn=T)
