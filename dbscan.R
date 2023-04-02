knitr::opts_chunk$set(echo = TRUE)

library(dbscan)
library(caret)
library(fpc)
library("factoextra")

set.seed(123456789)

#dummy runs with iris dataset
db_iris = dbscan(iris[c(-5)], eps = 0.1, MinPts = 4)
db_iris

db_iris = dbscan(iris[c(-5)], eps = 0.2, MinPts = 4)
db_iris

db_iris = dbscan(iris[c(-5)], eps = 0.3, MinPts = 4)
db_iris

db_iris = dbscan(iris[c(-5)], eps = 0.4, MinPts = 4)
db_iris

#vizualizing the formed clusters
fviz_cluster(db_iris, iris[c(-5)], geom = "point")

#reading earthquake data
equake = read.csv("equakedata_india.csv")
equake$Magnitude = as.numeric(equake$Magnitude)

#removing missing data and fitting the model
equake = na.omit(equake)
db_equake = dbscan(equake, eps = 1, MinPts = 15)
db_equake

#as seen earlier, we can tune parameters as per our convenience or we can use CV to choose optimum parameter values
db_equake = dbscan(equake, eps = 2.5, MinPts = 15)
db_equake

db_equake = dbscan(equake, eps = 4, MinPts = 15)
db_equake

db_equake = dbscan(equake, eps = 1, MinPts = 8)
db_equake

db_equake = dbscan(equake, eps = 2.5, MinPts = 8)
db_equake

db_equake = dbscan(equake, eps = 4, MinPts = 8)
db_equake

#let's plot the final clusters for the seismic zones with similar activities
fviz_cluster(db_equake, equake, geom = "point")
