#vector
x=c(1,2,3)
x1 = 1:2000
length(x1)
x2 = seq(10,100,2)
?seq
#numeric vector----
marks  = rnorm(30, mean=60, sd=10) #creates a normal distribution with n=30, mean=60 and standard deviation=10
#we have created a data structure 'marks' which is normal distribution
marks
# (marks=rnorm(30,mean=60,sd=10)) will directly print marks
mean(marks)
sd(marks)
var(marks)
mode(marks)#no mode
summary(marks)# summary of the data structure
range(marks)

#properties of data structure
length(marks)
str(marks)
class(marks)

#graphs
hist(marks)
plot(density(marks))


#character vector----
(names=c("ram","shyam","shubham"))
length(names)
class(names)
summary(names)

#category type data
gender =c("M","F","N")
summary(gender)
genderF = factor(gender)
summary(genderF)

grades = c("A","B","C","D","A","A","C","D")
gradesF = factor(grades,ordered = T)#arranges in ascending order(natural order) 
summary(gradesF)
gradesF
#if the ordered is false then the order is random

gradesF1 = factor(grades, ordered=T, levels=c("D","C","B","A"))#we define the order here
summary(gradesF1)
gradesF1
table(gradesF1)#omly for category type data

#graphs
barplot(table(gradesF1))
pie(table(gradesF1))



#logical vactor----

married = c(TRUE, FALSE, T,F,T,F)
married
summary(married)
table(married)
class(married)
sum(married)

#subset of marks
marks
trunc(marks) : round(marks,1) : floor(marks) : ceiling(marks) #multiple operations in one line can be done if the commands are separated by ':'
marks1=trunc(marks)
marks1
marks1[-2]#second position element is removed
marks1[c(1,3,5,23)]
marks1[marks1>60]#where marks1>60 is true those values will be printed
marks1>60
marks[marks1>60 & marks1<75]

#
set.seed(1234)#this keeps the random sample constant provided to start compling from this particular line, the no. inside is arbitary
gender2=sample(c('M','F'), size=1000000, replace=T, prob=c(0.6,0.4))#creates a random sample of size 1000000, with a probability of 60 percent male and 40 percent female
gender2
table(gender2)
prop.table(table(gender2))

