#data frame
rollno=1:30
(names1 = paste('student', 1:30, sep='-'))
batch = sample( c(2016,2017,2018), size=30, replace=T)
table(batch)
gender = sample(c('m','f'), size=30, replace=T)
table(gender)
marks1=rnorm(30, mean=65, sd=7)
marks2=rnorm(30, mean=40, sd=10)

df=data.frame(rollno, names1, batch, gender, marks1, marks2, stringsAsFactors=F)
df
summary(df)
df$gender=factor(df$gender)#converts to factor
df$batch=factor(df$batch, ordered=T, levels=c('2016','2017','2018'))#converts to ordered factor
str(df)
head(df)
tail(df)
head(df, n=2)#1st 2 elememts are displayed, tail gives last elements
dim(df)#dimension of dataframe
nrow(df)#no of rows
ncol(df)#no of colums
names(df)
df$rollno=as.character(df$rollno)#convert the numeric data type to character
str(df)
df[1,1:3]
df[c(1,3),c(1,4,5,6)]
df[df$gender=='m', c(3,5)]#male rows will be displayed and colums 3 and 5 will be displayed
df[df$gender=='m' & df$marks1>70, ]
nrow(df[df$gender=='m', ])#number of rows having male students
sort(df$marks1)#sort the data using marks1 as parameter
order((df$marks1))#index of the data frame if it is arranged in ascending order using marks1 as a parameter
df[order(df$marks1), ]
rev(sort(df$marks1))
df[order(df$gender, df$batch), ]#1st all female will be printed and within the female it is sorted using batch year
df[order(gender, -batch), ]#gender in ascending order and batch in descending order

#summary/aggregating
aggregate(df$marks1, by=list(df$batch), FUN=mean)
aggregate(cbind(marks1,marks2) ~ batch + gender, data=df, FUN=mean)#it gives mean of marks1 and marks2 on basis of batch and gender
aggregate(cbind(marks1,marks2) ~ batch + gender, data=df, FUN=sd)
aggregate(cbind(marks1,marks2) ~ batch + gender, data=df, FUN=max)
df2=aggregate(cbind(marks1,marks2) ~ batch + gender, data=df, FUN=mean)

write.csv(df, "./Data/bitsgoa.csv")#converts the data frame into csv(excel) format and stores it into 'Data' folder in 'analytics' 

df3=read.csv("./Data/bitsgoa.csv")#reads the csv file into data frame df3

df3[ ,-1]
head(df3)
