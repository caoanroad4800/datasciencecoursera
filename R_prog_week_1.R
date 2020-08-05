getwd()
setwd()
dir()

myfunction <- function(x){
  y <- rnorm(100)
  mean(y)
}

x <- 1
print(x)
x
msg <- 'hello'

x <- ## Incomplete expression
  
x <-1:20
x
x <- seq(1,20,by=1)
x

x <- c(0.5, 0.6)
x

x <- c(T, F)
x

x <- c('a', 'b', 'c')
x

x <- c(1+0i, 2+4i)
x

x <- 0:6
class(x)
as.numeric(x)
as.logical(x)
as.character(x)

x <- list(1, 'a', TRUE, 1+4i)
x
print(x)

m <- matrix(nrow = 2, ncol = 3)
m
dim(m)
attributes(m)

m <- seq(1,10,by=1)
m
dim(m) <- c(2,5)
m

x <- 1:3
y <- 10:12
cbind(x,y)
rbind(x,y)

x <- factor(c("yes", 'yes', 'no', 'yes', 'no'))
x
table(x)
unclass(x)

x <- data.frame(foo = seq(1,4,1))
x$bar = c(T,T,F,F)
x
nrow(x)
ncol(x)
names(x)

x <- list(a=1,b=2,c=3)
names(x)

m
dimnames(m) <- list(c('a', 'b'), c('c','d','e','f','g'))

y <- data.frame(a=1,b='a')
y
dput(y)
dput(y, file='y.R')
new.y <- dget('y.R')
new.y

x <- c('a', 'b', 'c', 'c', 'd', 'a')
x

x[x>'a']
u <- x > 'a'
u
x[u]

x <- list(a = list(10,12,14))
x$b = c(3.14, 2.81)
typeof(x)
x[[1]][[3]]
x[[2]][[1]]
x[[c(2,1)]]
x$b[1]

x<-matrix(1:6, 2, 3)
x
x[1,2]
x[2,1]
x[1,]
x[1,2,drop=F]

x <- c(1, 2, NA, 4, NA, 5)
bad <- is.na(x)
bad
x[!bad]
sort(x[!bad])

head(airquality)
good <- complete.cases(airquality)
airquality[good, ]

x <- list(2, "a", "b", TRUE)
x
class(x[[2]])
length(x[[2]])

x <- 1:4
y <- 2:3
class(x + y)

x <- c(3, 5, 1, 10, 12, 6)
x
x [x%in% 1:5] <- 0
x

df <- read.csv("hw1_data.csv")
names(df)
df[1:2,]
nrow(df)
ncol(df)
df[-(1:151),]
df[['Ozone']][[47]]

bad <- is.na(df$Ozone)
df_nonas <- df[!bad,]
mean(df_nonas[['Ozone']])


df_Oge31 <- df_nonas[df_nonas$Ozone > 31,]
df_Tempge90 <- df_Oge31[df_Oge31$Temp > 90,]
names(df_Tempge90)
mean(df_Tempge90[['Solar.R']])

mean(df[df$Month == 6,][['Temp']])

df_findmax <- df[df[['Month']] == 5,]
df_findmax[['Ozone']][[which.max(df_findmax[['Ozone']])]]
