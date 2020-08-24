# Plot1.R
library(dplyr)

setwd("~/Soft/Rtest/datasciencecoursera/04_Exploratory_Data_Analysis/")

SCC <- readRDS("./data/Source_Classification_Code.rds")
NEI <- pmdata <- readRDS("./data/summarySCC_PM25.rds")

head(NEI)
# sum(is.na(NEI$Emissions)) # 0 NAs
avgpm1999 <- sum(subset(NEI, year == 1999)$Emissions)
avgpm2002 <- sum(subset(NEI, year == 2002)$Emissions)
avgpm2005 <- sum(subset(NEI, year == 2005)$Emissions)
avgpm2008 <- sum(subset(NEI, year == 2008)$Emissions)
avgpm_df <- data.frame(x = c(avgpm1999, avgpm2002, avgpm2005, avgpm2008)
                       #, y = as.Date(as.character("1999", "2002", "2005", "2008"), format = c("%Y")) 
                       , y = c(1999, 2002, 2005, 2008)
                       #, colnames=c("avgpm", 'year')
                       )
avgpm_df <- rename(avgpm_df, avgpm=x, year=y)
with(avgpm_df, plot(avgpm~year
                    , type='o'
                    , main = "Total PM2.5 Emission (tons, annual)"
                    , xlab = "Year"
                    , ylab = "Tons"
                    )
     )
dev.copy(png, "./data/plot1.png")
dev.off()
dev.off()


#install.packages("manipulate")
library(manipulate)
library(HistData)
library(ggplot2)
myHist <- function(mu){
  g <- ggplot(Galton, aes(x = child))
  g <- g + geom_histogram(fill = 'salmon'
                          , binwidth = 1
                          , aes(y = ..density..)
                          , colour = 'black')
  g <- g + geom_density(size = 2)
  g <- g + geom_vline(xintercept = mu, size = 2)
  mse <- round(mean((Galton$child - mu)^2), 3)
  g <- g + labs(title= paste('mu = ', mu, 'MSE = ', mse))
  g
}
manipulate(myHist(mu), mu = slider(62, 74, step = 0.5))
