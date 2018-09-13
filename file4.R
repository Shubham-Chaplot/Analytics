#matrices-contains only one data type
m = matrix(x, nrow=3, ncol=4)
marks3=floor(runif(30,50,90))#gives uniform distribution with max=90 and min=50 and n=30
m2 = (matrix(marks3,nrow=6, byrow=T))#data is filled row wise, for columnwise may'T' to 'F'
#converts marks into a matrix
colSums(m2) #sum of the columns
rowSums(m2)
rowMeans(m2)#mean of row
colMeans(m2)
sum(m2)#total sum of matrix
m2 [m2>70]
m2[1, ]
m2[2,3]
m2[1:2,3:5]
