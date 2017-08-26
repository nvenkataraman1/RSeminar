## 1. R used as an analytical tool

### Math and Linear Algebra operations

1 + 1

70 / 2

3 * 100

mat1 <- matrix(1:6, ncol = 2)
mat1

mat2 <- matrix(7:12, nrow = 2)
mat2

mat1 %*% mat2

## Data aggregation

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

library(ggplot2)

km <- kmeans(mtcars[,c("mpg","wt")], centers = 3) # Cluster by MPG and Weight

table(km$cluster)

mtcars.df <- data.frame(mtcars,cluster=km$cluster)

ggplot(mtcars.df, aes(x = mpg, y = wt, color = as.factor(cluster))) + 
    geom_point(size = 3)

