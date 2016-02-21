## Reading data into R

## 1. CSV

stock.price <- read.csv("./data/stockprice.csv")
head(stock.price)

## 2. Reading BIG DATA into R

library(readr)

yelp.data <- read_csv("../../../RProgrammingWorkshop/sessions/w4/data/yelp_academic_dataset_review.csv")

head(yelp.data)

## 3. Reading data from Excel

library(readxl)

gpa.data <- read_excel("./data/gpa.xlsx", sheet = "Sheet1")
head(gpa.data)

####### Reading other data file types

library(haven)

sas_data <- read_sas("./data//money.sas7bdat") ## SAS
head(sas_data)

spss_data <- read_sav("./data//airline_passengers.sav") ## SPSS
head(spss_data)

stata_data <- read_dta("./data//stata_sampledata_crime.dta") ## STATA
head(stata_data)

#########################################################

## Data Structures in R

## Create

## vector

c(1, 2)

c(TRUE, FALSE)

c("Hello", "World")

c(1, 5.67)

c(1L, 5L)

vector.1 <- c(1, 5.678)
vector.1

## list

list.1 <- list(vec.1 = rnorm(100), vec.2 = rpois(200, lambda = 5))

list.1 <- list(
    vec.1 = rnorm(100),
    vec.2 = rpois(200, lambda = 5)
)
list.1

## matrix

matrix(1:20)

matrix(1:20, nrow = 5)

matrix(1:20, nrow = 5, byrow = TRUE)

matrix(1:20, nrow = 5, ncol = 6)

m1 <- matrix(1:20, nrow = 5)
m1

t(m1)

## data frames

df <- data.frame(
    norm.values = rnorm(100), 
    pois.value = rpois(100, lambda = 5)
)

df

df2 <- data.frame(
    norm.values = rnorm(100),
    text.values = sample(LETTERS, 100, replace = TRUE)
)

df2

## Inspect

stock.price

class(stock.price)

str(yelp.data)

rn <- rnorm(100)

summary(rn)

summary(mtcars)

v1 <- c(1L, 5L, 7L)

v2 <- c(1, 3.14)

class(v1)
class(v2)

class(df2)
str(df2)

summary(df2)

## Add / Remove

## vector

v1

v1 <- c(v1, 6)

v1

v1 <- c(v1, 100)

v1
v2

c(v1, v2)

m1

cbind(m1, 11:15)

rbind(m1, 11:14)

str(m1)

dim(df2)

## vector

v1
v1[-3]

## dataframe

df2[,2]

df2$text.values

df2[,"text.values"]

## matrix

m1

m1[-c(1,5),]

m1[c(2:4),]

str(yelp.data)

rnorm(100) ## 100 numbers

sample(LETTERS, 100, replace = TRUE) ## 100 alpha

sample(c(TRUE,FALSE), 100, replace = TRUE)  #logical

set.seed(100)

df <- data.frame(
    nums = rnorm(100), ## 100 numbers
    alpha = sample(LETTERS, 100, replace = TRUE), ## 100 alpha
    logicals = sample(c(TRUE,FALSE), 100, replace = TRUE)  #logical
)

str(df)

df[,3]

df$logicals

df$logicals == TRUE

dim(df[df$logicals == TRUE, ])


df[df$logicals == TRUE & df$nums > 0, ]

library(dplyr)

df

df %>%
    filter(logicals == TRUE || nums > 0)
    
mtcars %>%
    group_by(cyl) %>%
    summarize(count = n())

## Filter

