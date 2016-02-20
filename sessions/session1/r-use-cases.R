## 1. R used as an analytical tool

library(dplyr)

mtcars

mtcars %>%
    group_by(cyl) %>%
    summarize(count=n())

## 2. R used for statistical analysis

# compare to a standard normal distribution

shapiro.test(rnorm(100)) # normal distribution

shapiro.test(rpois(100, lambda = 5)) # poisson distribution

# compare two distributions

ks.test(rnorm(100), rnorm(100))

ks.test(rnorm(100), rpois(100, lambda = 5))

## 3. R used for data mining: k-means example

library(HDclassif)
library(ggplot2)

data(wine)
wine.data <- wine

str(wine.data)

km <- kmeans(wine.data[,2:3], centers = 3)  # Alcohol content vs Acid content

table(km$cluster)

wine.df <- data.frame(wine.data,cluster=km$cluster)

ggplot(wine.df, aes(x = V1, y = V2, color = as.factor(cluster))) + 
    geom_point(size = 3)


