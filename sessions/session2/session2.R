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

## Inspect

## Add / Remove

## Index / Subset

## Filter

