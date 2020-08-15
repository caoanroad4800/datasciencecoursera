# Plot3.R
library(dplyr)
library(ggplot2)

setwd("~/Soft/Rtest/datasciencecoursera/04_Exploratory_Data_Analysis/")

SCC <- readRDS("./data/Source_Classification_Code.rds")
NEI <- pmdata <- readRDS("./data/summarySCC_PM25.rds")

head(NEI)
# sum(is.na(NEI$Emissions)) # 0 NAs

str(NEI)
NEI$type <- as.factor(NEI$type)
unique(NEI$type)
btmpoint1999 <- sum(subset(NEI, fips == 24510 & year == 1999 & type == "POINT")[,'Emissions'])
btmpoint2002 <- sum(subset(NEI, fips == 24510 & year == 2002 & type == "POINT")[,'Emissions'])
btmpoint2005 <- sum(subset(NEI, fips == 24510 & year == 2005 & type == "POINT")[,'Emissions'])
btmpoint2008 <- sum(subset(NEI, fips == 24510 & year == 2008 & type == "POINT")[,'Emissions'])

btmnonpoint1999 <- sum(subset(NEI, fips == 24510 & year == 1999 & type == "NONPOINT")[,'Emissions'])
btmnonpoint2002 <- sum(subset(NEI, fips == 24510 & year == 2002 & type == "NONPOINT")[,'Emissions'])
btmnonpoint2005 <- sum(subset(NEI, fips == 24510 & year == 2005 & type == "NONPOINT")[,'Emissions'])
btmnonpoint2008 <- sum(subset(NEI, fips == 24510 & year == 2008 & type == "NONPOINT")[,'Emissions'])

btmonroad1999 <- sum(subset(NEI, fips == 24510 & year == 1999 & type == "ON-ROAD")[,'Emissions'])
btmonroad2002 <- sum(subset(NEI, fips == 24510 & year == 2002 & type == "ON-ROAD")[,'Emissions'])
btmonroad2005 <- sum(subset(NEI, fips == 24510 & year == 2005 & type == "ON-ROAD")[,'Emissions'])
btmonroad2008 <- sum(subset(NEI, fips == 24510 & year == 2008 & type == "ON-ROAD")[,'Emissions'])

btmnonroad1999 <- sum(subset(NEI, fips == 24510 & year == 1999 & type == "NON-ROAD")[,'Emissions'])
btmnonroad2002 <- sum(subset(NEI, fips == 24510 & year == 2002 & type == "NON-ROAD")[,'Emissions'])
btmnonroad2005 <- sum(subset(NEI, fips == 24510 & year == 2005 & type == "NON-ROAD")[,'Emissions'])
btmnonroad2008 <- sum(subset(NEI, fips == 24510 & year == 2008 & type == "NON-ROAD")[,'Emissions'])

btmtypedf <- data.frame(POINT = c(btmpoint1999, btmpoint2002, btmpoint2005, btmpoint2008) 
                        , NONPOINT = c(btmnonpoint1999, btmnonpoint2002, btmnonpoint2005, btmnonpoint2008)
                        , ONROAD = c(btmonroad1999, btmonroad2002, btmonroad2005, btmonroad2008)
                        , NONROAD = c(btmnonroad1999, btmnonroad2002, btmnonroad2005, btmnonroad2008)
                        , YEAR = c(1999, 2002, 2005, 2008)
                        )
btmtypedf

g <- ggplot(btmtypedf)
g <- g + labs(title = "PM2.5 Emissions in Baltimore City (tons, annual)")
g <- g + xlab("Year") + ylab("Tons") 
g <- g + geom_line(mapping = aes(x = YEAR, y = POINT, col="red"))
g <- g + geom_line(mapping = aes(x = YEAR, y = NONPOINT, col="green"))
g <- g + geom_line(mapping = aes(x = YEAR, y = ONROAD, col="blue"))
g <- g + geom_line(mapping = aes(x = YEAR, y = NONROAD, col = 'aliceblue'))
g <- g + labs(colour = "Type")
g <- g + scale_color_discrete(labels = c("POINT", "NON-POINT", 'ON-ROAD', "NON-ROAD"))
dev.copy(png, "./data/plot3.png")
dev.off()
dev.off()
