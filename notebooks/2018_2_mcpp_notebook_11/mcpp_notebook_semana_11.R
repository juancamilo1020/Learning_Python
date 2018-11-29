# Para asignaci?n, con el s?mbolo <-

x <- 1
print(x)

msg <- "hello"

x <- 1:20
x

# Vectores

x <- c(0.5, 0.6)    # numeric
class(x)
x <- c(TRUE, FALSE) # logical
class(x)
x <- c(T, F)        # logical
class(x)
x <- c("a", "b", "c") # character
class(x)
x <- c(1+0i, 2+4i)  # complex
class(x)

x <- vector("numeric", length = 10)
x

# Mezcla de "classes"

y <- c(1.7, "a")
class(y)

# Coerci?n

x <- 0:6
class(x)

as.numeric(x)
as.logical(x)
as.character(x)

x <- c("a", "b", "c")
as.numeric(x)
x

# Matrices

m <- matrix(nrow = 2, ncol = 3)
m

dim(m)
attributes(m)

m <- matrix(1:6, nrow = 2, ncol = 3)
m

m <- 1:10
m
attributes(m)
dim(m) <- c(2, 5)
m
attributes(m)

# cbind-ing y rbind-ing

x <- 1:3
y <- 10:12

cbind(x, y)
rbind(x, y)

# Lists

x <- list(1, "a", TRUE, 1 + 4i)
x

# Factors

x <- factor(c("yes", "yes", "no", "yes", "no"))
x

table(x)

x <- factor(c("yes", "yes", "no", "yes", "no"),
            levels = c("yes", "no"))
x

# Missing values

x <- c(1, 2, NA, 10, 3)
is.na(x)
is.nan(x)

x <- c(1, 2, NaN, NA, 3)
is.na(x)
is.nan(x)

# Data frames

x <- data.frame(foo = 1:4, bar = c(T, T, F, F))
x

nrow(x)
ncol(x)

x <- 1:3
names(x)
names(x) <- c("foo", "bar", "norf")
x

x <- list(a = 1, b = 2, c = 3)
x

x$a
x$b
x$c

m <- matrix(1:4, nrow = 2, ncol = 2)
m
dimnames(m) <- list(c("a", "b"), c("c", "d"))
m

# Subsetting

x <- c("a", "b", "c", "d", "a")
x[1]
x[2]
x[4]

x[x > "a"]

u <- x > "a"
u
x[u]

x <- matrix(1:6, 2, 3)
x[1, 2]
x[, 2]

x <- list(foo = 1:4, bar = 0.6)
x[1]
x[[1]]
x[[1]][3]
x$foo[3]

# Removing NA values

x <- c(1, 2, NA, 4, NA, 5)
bad <- is.na(x)
x[!bad]

y <- c("a", "b", NA, "d", NA, "f")
good <- complete.cases(x, y)
good
x[good]
y[good]

# Control structures

## if

x <- 2

if(x > 3) {
  y <- 10
} else {
  y <- 0
}

y

## for

for(i in 1:4) {
  print(i)
}

x <- c("a", "b", "c", "d")

for(letter in x) {
  print(letter)
}

for(i in 1:4) {
  print(x[i])
}

## while

count <- 0
while(count < 10) {
  print(count)
  count <- count + 1
}

## functions

mydata <- rnorm(100)
sd(mydata)

f <- function(a, b) {
  print(a)
  print(b)
}

f(45, 15)

myplot <- function(x, y, type = "l", ...) {
  plot(x, y, type = type, ...)
}

x <- 1:4
y <- c(1, 3, 5, 7)

myplot(x, y)
plot(x, y)

# lapply (internal loop)

x <- list(a = 1:5, b = rnorm(10))
x

lapply(x, mean)

# lapply con funci?n an?nima

lapply(x, function(asdf) asdf**2)

# Working directory

getwd()
setwd("/Users/Santiago/Dropbox/Clases/URosario/2018-II/repo_mcpp_2018_2/notebooks/2018_2_mcpp_notebook_11")
getwd()
dir()

# Exploratory analysis

pollution <- read.csv("avgpm25.csv", colClasses = 
      c("numeric", "character", "factor", 
        "numeric", "numeric"))

head(pollution)

head(pollution$pm25)

summary(pollution)

summary(pollution$pm25)

# Graphs

# Boxplot
boxplot(pollution$pm25, col = "blue")

# Histogram

hist(pollution$pm25, col = "green")

hist(pollution$pm25, col = "magenta")
rug(pollution$pm25)

boxplot(pollution$pm25, col = "blue")
abline(h = 12)

hist(pollution$pm25, col = "green")
rug(pollution$pm25)
abline(v = median(pollution$pm25), col =
         "magenta", lwd = 4)

# Barplot

barplot(table(pollution$region), col = "wheat",
        main = "Number of counties in each region")

# Multiple boxplots

boxplot(pm25 ~ region, data = pollution, col = "red")

# Mutiple graphs

par(mfrow = c(2, 1))
hist(subset(pollution, region == "east")$pm25, col = "green")
hist(subset(pollution, region == "west")$pm25, col = "green")

# Scatterplots

par(mfrow = c(1, 1))
with(pollution, plot(latitude, pm25))

with(pollution, plot(latitude, pm25, col = region))

# ggplot2

install.packages("ggplot2")
library("ggplot2")

summary(mpg)
str(mpg)

qplot(displ, hwy, data = mpg)

qplot(displ, hwy, data = mpg, color = drv)

qplot(displ, hwy, data = mpg, geom = c("point",
                                       "smooth"))

# Histograms

qplot(hwy, data = mpg, fill = drv)

# Facets

qplot(displ, hwy, data = mpg, facets = . ~ drv)

