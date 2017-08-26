## Functions in R

##### Syntax

name.of.function <- function(params1 = 5, params2) {
    ## do something
    return(params1 + params2)
}

name.of.function(params2 = 2)

name.of.function2 <- function(param) {
    return(param - 5)
}

name.of.function2(name.of.function(params2 = 5))

## Control Structures

## 1. if loops
    
    if(5 < 6) {
        print("Hello World!")
    }

## 2. if-else
    
    if(5 > 6) {
        print("In this loop")
    } else {
        print("Won't come here")
    }
## 3. ifelse
    
    ifelse(5 > 6, "Not Possible", "Yep!")
    
    
var <- ifelse(sample(0:1, 10000, replace = T) == 0, -1, 1)
    
plot(cumsum(var), col = "cyan")

## 4. for
        
    for(counter in 1:10) {
        print(counter)
    }
    
## 5. while
    
    x <- 5
    
    while(x > 0) {
        print(x)
        x <- x - 1
    }

##### apply

# Syntax: apply(X, MARGIN, FUN)
    
apply(mtcars, 2, mean)

apply(mtcars, 2, sd)

summary(mtcars)


# Syntax: lapply(list_object, FUN), sapply(list_object, FUN)

list1 <- list(num = 10, 
              truefalse = ifelse(runif(10,0,1)>.5,T,F), 
              colors = c("red", "blue", "green", "yellow"))

list1

lapply(list1, length)

sapply(list1, length)


# Syntax: tapply(data, group conditions, FUN)

library(ISLR)
data("Hitters")

head(Hitters)

hitters.complete <- Hitters[complete.cases(Hitters),]

length(hitters.complete[,1])

tapply(hitters.complete$Salary,
       list(hitters.complete$Division, hitters.complete$League),
       sum)


### Plotting

## histogram and density plot
hist(rnorm(100))

plot(density(rnorm(100)))

## scatterplot
df <- data.frame(v1 = rnorm(100), v2 = rnorm(100))

plot(df)

plot(df$v1, df$v2)

## line graph

## line plots
plot(state.x77[,1], 
     state.x77[,2], 
     xlab="Population", 
     ylab="Income", col=3, type="l")

## enhanced plotting

plot(state.x77[,1], state.x77[,2], 
     xlab="Population", 
     ylab="Income", col=3)
model <- lm(state.x77[,2] ~ state.x77[,1])
abline(model, lwd=2, lty=3)

## boxplot

plot(mtcars$cyl, mtcars$mpg)

boxplot(mpg~cyl,data=mtcars, main="Car Milage Data", 
        xlab="Number of Cylinders", ylab="Miles Per Gallon")

## multiple plots on screen

## Row-wise
par(mfrow=c(2,1))
plot(state.x77[,1], state.x77[,2], xlab="Population", ylab="Income", col=3)

plot(state.x77[,1], ylab="Population")

## Column-wise
par(mfcol=c(1,2))
plot(state.x77[,1], state.x77[,2], xlab="Population", ylab="Income", col=3)

plot(state.x77[,1], ylab="Population")

plot(state.x77[,2], ylab="Income")

par(mfcol=c(1,1))

## Using ggplot2

library(ggplot2)

ggplot(data=mtcars, aes(x=wt, y=mpg)) + 
    geom_point() + 
    labs(title="Automobile Data", x="Weight", y="Miles Per Gallon")

## colors

ggplot(data=mtcars, aes(x=wt, y=mpg, color=factor(cyl))) + 
    geom_point() + 
    labs(title="Automobile Data", x="Weight", y="Miles Per Gallon")

## histogram

library(lattice)

ggplot(singer, aes(x=height)) + 
    geom_histogram()

ggplot(singer, aes(x=height)) + 
    geom_histogram(binwidth = 2)

## boxplot

ggplot(singer, aes(x=voice.part, y=height)) + 
    geom_boxplot()

## bar plots

data(Salaries, package="car")

ggplot(Salaries, aes(x=rank, fill=sex)) + 
    geom_bar(position="stack") + 
    labs(title='position="stack"') 

ggplot(Salaries, aes(x=rank, fill=sex)) + 
    geom_bar(position="dodge") + 
    labs(title='position="dodge"') 

ggplot(Salaries, aes(x=rank, fill=sex)) + 
    geom_bar(position="fill") + 
    labs(title='position="fill"')

ggplot(Salaries, aes(x=rank, fill=sex)) + 
    geom_bar(position="fill") + 
    labs(title='position="fill"') + 
    coord_flip()

ggplot(Salaries, aes(x=rank, fill=sex)) + 
    geom_bar(position="dodge") + 
    labs(title='position="dodge"') + 
    scale_fill_grey(start = 0, end = 1)

## scatterplots

ggplot(Salaries, aes(x=rank, y=salary, color=sex)) + 
    geom_point()

ggplot(Salaries, aes(x=rank, y=salary, color=sex)) + 
    geom_point(position="jitter", size = 3)

ggplot(Salaries, aes(x=rank, y=salary, color=sex)) + 
    geom_jitter(size = 3)

ggplot(Salaries, aes(x=rank, y=salary, color=sex)) + 
    geom_jitter(aes(shape = sex), size = 3)

ggplot(Salaries, aes(x=yrs.service, y=salary)) + 
    geom_jitter(size = 3) + 
    geom_smooth(method=lm)

## grouping

data(Salaries, package="car")
library(ggplot2)

ggplot(Salaries, aes(x=salary)) + 
    geom_density(alpha=0.3)

ggplot(Salaries, aes(x=salary, fill=rank)) + 
    geom_density(alpha=0.3)

ggplot(Salaries, aes(x=yrs.since.phd, y=salary, shape=sex, color=rank )) + 
    geom_point(size=3)

## faceting

### using facet_wrap

data(singer, package="lattice") 
library(ggplot2) 

ggplot(data=singer, aes(x=height)) + 
    geom_histogram() + 
    facet_wrap(~voice.part, nrow=4)

### using facet_grid

m <- mtcars

m$am <- factor(m$am, levels=c(0,1), labels=c("Automatic", "Manual")) 

m$vs <- factor(m$vs, levels=c(0,1), labels=c("V-Engine", "Straight Engine")) 

m$cyl <- factor(m$cyl)

ggplot(data=m, aes(x=hp, y=mpg, shape=cyl, color=cyl)) + 
    geom_point(size=3) + 
    facet_grid(am~vs) + 
    labs(title="Automobile Data by Engine Type", 
         x="Horse Power", y="Miles Per Gallon")
