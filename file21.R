#Optimal numner of Cluster in data
iris
table(iris$Species)

iris1=iris[-5]
head(iris1)

km1=kmeans(iris1, center=1)
km$withinss
km$tot.withinss

km2=kmeans(iris1, center=2)
km$withinss
km$tot.withinss

km3=kmeans(iris1, center=3)
km$withinss
km$tot.withinss

km4=kmeans(iris1, center=4)
km$withinss
km$tot.withinss

km5=kmeans(iris1, center=5)
km$withinss
km$tot.withinss

install.packages("NbClust")
library(NbClust)
nc= NbClust(iris1, distance="euclidean", min.nc=2, max.nc=15, method="average")

kiris=kmeans(iris1, centre=3)
kiris$centers

cbind(iris$Species, iris1, kiris$cluster)


names(mtcars)
data2 = mtcars[c('mpg','disp','hp','wt')]
head(data2)
nc = NbClust(data2, distance="euclidean",min.nc=2, max.nc=15, method="average")
det(as.matrix(mtcars))
?na.action
km3= kmeans(data,centers=3)
km3$tot.withinss

cbind(km1$tot.withinss, km2$tot.withinss, km3$tot.withinss, km4$tot.withinss,km5$tot.withinss)

#we select no clusters at elbow point
#adding more clusters does not significantly reduce total withinss
