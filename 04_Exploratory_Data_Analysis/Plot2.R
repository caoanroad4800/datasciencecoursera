# Plot2.R
library(dplyr)

setwd("~/Soft/Rtest/datasciencecoursera/04_Exploratory_Data_Analysis/")

SCC <- readRDS("./data/Source_Classification_Code.rds")
NEI <- pmdata <- readRDS("./data/summarySCC_PM25.rds")

head(NEI)
# sum(is.na(NEI$Emissions)) # 0 NAs

btm1999 <- sum(subset(NEI, fips == 24510 & year == 1999)$Emissions)
btm2002 <- sum(subset(NEI, fips == 24510 & year == 2002)$Emissions)
btm2005 <- sum(subset(NEI, fips == 24510 & year == 2005)$Emissions)
btm2008 <- sum(subset(NEI, fips == 24510 & year == 2008)$Emissions)
btmemission_df <- data.frame(Emissions = c(btm1999, btm2002, btm2005, btm2008)
                             , Year = c(1999, 2002, 2005, 2008))
with(btmemission_df, plot(
  Year, Emissions, type='o', col='blue'
  , main = 'Total PM2.5 Emissions in Baltimore City (tons, annual)'
  , xlab = "Year"
  , ylab = "Tons"
)
)
dev.copy(png, "./data/plot2.png")
dev.off()
dev.off()