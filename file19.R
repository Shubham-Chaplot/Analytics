install.packages("VIM")
#Missing Values
#Create, Detect, Replace, Remove, Impute, Visualise
library(VIM)

(v1 = c(1,2,NA,NA,5))
is.na(v1)
v1=NULL
v1  # remove all values
(v1 = c(1,NA,NA,NA,5,6,7,NA))
sum(is.na(v1))  # sum TRUE values ie missing values
mean(v1)  # cannot calculate if NA values in vector
mean(v1, na.rm=T)  # remove the missing value and then calculate the mean
(v1a = na.omit(v1))  # omit missing values and put in new vector
v1a
mean(v1a)
sum(v1a) # now you can sum on non NA values
?na.omit

anyNA(v1) # is there any NA value
anyNA(v1a)
?anyNA
#impute missing values of vector with mean value of non NA values
v1
mean(v1, na.rm=T)  # this value to be used
v1[is.na(v1)]
v1[is.na(v1)] = mean(v1, na.rm=T)#missing values will be substitued by the mean value
v1

#Use VIM package to load sleep dataset with NA values in rows & col
library(VIM)
#data(sleep, package='VIM') if VIM is installed and then replace the data with sleep in the following statements
summary(data)# see NA values in cols
head(data)
dim(data)
complete.cases(data) #all complete rows without any missing values
sum(complete.cases(data)) # count non NA rows/ complete 42
sum(!complete.cases(data))  #count NA rows 20
mean(complete.cases(data))  #42/62
# total cases = 62, complete=42  
sleep[complete.cases(data),] # list rows which are complete
sleep[!complete.cases(data),] # list rows which have NA values

# Particular Column
is.na(data$mpg) #for VIM, use sleep$Dream
sum(is.na(data$mpg))
mean(is.na(data$mpg))  # 12/62

# How many missing values
sum(is.na(data))  #total in data frame
names(data)# check columname
colSums(is.na(data))  #NA values in each column
rowSums(is.na(data))  #NA values in each row
head(data)
as.data.table(data)  #data.table format
is.na(data[1:3,]) # first 3 rows
head(data,n=3)

#Tabulate
install.packages("mice")
library(mice)
mice::md.pattern(data)
#42 rows without any missing values # 2 rows with 1 NA NonD

#Visualisation
VIM::aggr(sleep, prop=F, numbers=T)
#NonD max NA values 
VIM::aggr(sleep, prop=T)  # Proportion
VIM::matrixplot(sleep) # rowno and missing values in red
VIM::marginmatrix(sleep)
VIM::marginplot(sleep[c('Gest','Dream')], pch=c(20), col=c("darkgray", "red", "blue"))  # finding relationship between NA value


#Exploration
x = as.data.frame(abs(is.na(sleep)))
head(sleep, na=5)
head(x, n=5)
y = x[which(apply(x, 2, sum) > 0)]
cor(y)  #Dream - NonD 0.9
cor(sleep, y, use="pairwise.complete.obs")
#ignore NA, 
#

#Listwise Deletion
options(digits=3)
na.omit(sleep)
cor(na.omit(sleep))
cor(sleep, use="complete.obs")

fit = lm(Dream ~ Span + Gest, data= na.omit(sleep))
summary(fit)


#imputations Packages - mice, Amelia, mi : mice, with, pool

imp = mice::mice(sleep, seed=1234)
?mice
