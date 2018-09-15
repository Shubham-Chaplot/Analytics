#how Y depends on X1,X2
#Single Linear Regression
women
str(women)
cor(women$height, women$weight)
cov(women$height, women$weight)
plot(women$height, women$weight)


#create linear model
fit1=lm(weight~height, data=women)
summary(fit1)
#if the p-value in Fstatistic is less than 0.05 then there is a linear relationship between y and atleast one independent variable
#multiple r-squared in single linear regression and adjusted r-squared in multiple   linear regression
#closer the value of r-squared to 1 the better the model is.
#R-squared shows that 99% of the women's weight is explained by women's height
#this is basically straight line whose equation is weight=(-87.51667)+3.45*height, that is if height increases by 1 unit then weight increases by 3.45
#we cannot predict y-value for x-value which is out of the range of given data
#residuals are difference between predicted value and real value

fitted(fit1)#it has calculated weight according to height by using the equation above
names(fit1)
cbind(women, fitted(fit1))
#prediction
ndata1=data.frame(height=c(62.5,63,63.5))
predict(fit1, newdata=ndata1)


#Multiple Linear Regression
#example1
#mtcars:mpg vs wt , hp
fit2=lm(mpg ~ hp+wt, data=mtcars)
summary(fit2)
#if hp is increased by 1 unit than wt is decreased by 0.03
range(mtcars$wt)
range(mtcars$hp)
ndata2=data.frame(wt=c(2.65,3.65),hp=c(105,205))
predict(fit2, newdata=ndata2)

#example2
fit3=lm(mpg ~ gear+hp+wt+vs+am, data=mtcars)
summary(fit3)
#this shows that gear,vs and am are insignificant since they have p-value more the 0.05, hence we should excluded them
