# Plot5.R
library(dplyr)
library(ggplot2)

setwd("~/Soft/Rtest/datasciencecoursera/04_Exploratory_Data_Analysis/")

SCC <- readRDS("./data/Source_Classification_Code.rds")
NEI <- pmdata <- readRDS("./data/summarySCC_PM25.rds")

head(NEI)

vehiclesSCC <- SCC[
  grepl("vehicle", SCC$SCC.Level.Two, ignore.case = T), 'SCC'
  ]
vehiclesNEI <- NEI[NEI[,'SCC'] %in% vehiclesSCC, ]

btmVehiclesNEI <- subset(vehiclesNEI, fips == '24510')
btmVehiclesNEI$city = c("Baltimore City")

laVehiclesNEI <- subset(vehiclesNEI, fips == '06037')
laVehiclesNEI$city = c("Los Angeles")

bothNEI <- rbind(btmVehiclesNEI, laVehiclesNEI)

g <- ggplot(bothNEI, aes(
  x = factor(year)
  , y = Emissions
  , fill = city
)
)
g <- g+ geom_bar(
  aes(fill = year)
  , stat = 'identity'
)
g <- g + facet_grid(
  scales = "free"
  , space = 'free'
  , .~city
)
g <- g + labs(
  x = 'Year'
  , y = 'Tons'
  , title = "PM2.5 Motor Vehicle Source Emissions in Baltimore City and Los Angeles (Tons, Annual)"
)

dev.copy(png, './data/plot6.png')
dev.off()
dev.off()
