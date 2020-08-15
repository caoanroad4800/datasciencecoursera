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

btmVehiclesNEI <- subset(vehiclesNEI, fips == 24510)

g <- ggplot(btmVehiclesNEI, aes(factor(year), Emissions))
g <- g + geom_bar(stat = 'identity'
                  , fill = '#FF9999'
                  , width = 0.75)
g <- g + labs(
  x = 'Year'
  , y = "Tons"
  , title = "PM2.5 Motor Vehicle Source Emissions in Baltimore (Tons, Annual)"
)
g

dev.copy(png, "./data/plot5.png")
dev.off()
dev.off()