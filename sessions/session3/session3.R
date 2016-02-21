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
    
plot(apply(mtcars, 2, mean))

apply(mtcars, 2, sd)

summary(mtcars)

### Plotting

## histogram
hist(rnorm(100))

plot(density(rnorm(100)))

rn <- rnorm(100)
rp <- rpois(100, lambda = 5)

rcombined <- c(sample(rn, 50),sample(rp,50))

## density
plot(density(rcombined))

## scatterplot
df <- data.frame(v1 = rnorm(100), v2 = rnorm(100))

plot(df)

plot(df$v1, df$v2)

## line graph

plot(df, type = "l", 
     main = "diag title", 
     xlab = "v1 var",
     xlim = c(-1,1))
