## Short demo of R using Nobel Prize data

library(dplyr)

url.prize <- "http://api.nobelprize.org/v1/prize.csv"

nobel.prize <- read.csv(url.prize)

str(nobel.prize)

url.laureate <- "http://api.nobelprize.org/v1/laureate.csv"

nobel.laureate <- read.csv(url.laureate)

str(nobel.laureate)

url.country <- "http://api.nobelprize.org/v1/country.csv"

nobel.country <- read.csv(url.country)

head(nobel.prize)

nobel.prize %>%
    group_by(category) %>%
    summarize(count = n()) %>%
    arrange(desc(count))

nobel.laureate %>%
    group_by(paste0(surname)) %>%
    summarize(count = n()) %>%
    arrange(desc(count))