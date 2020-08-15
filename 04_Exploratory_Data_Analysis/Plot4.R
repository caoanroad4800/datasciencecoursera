# Plot4.R
library(dplyr)
library(ggplot2)

setwd("~/Soft/Rtest/datasciencecoursera/04_Exploratory_Data_Analysis/")

SCC <- readRDS("./data/Source_Classification_Code.rds")
NEI <- pmdata <- readRDS("./data/summarySCC_PM25.rds")

head(NEI)
# sum(is.na(NEI$Emissions)) # 0 NAs

combRelated <- grepl("comb", SCC[, 'SCC.Level.One'], ignore.case = T)
coalRelated <- grepl("coal", SCC[, 'SCC.Level.Four'], ignore.case = T)
combSCC <- SCC[combRelated & coalRelated, 'SCC']
combNEI <- NEI[NEI[, 'SCC'] %in% combSCC, ]

g <- ggplot(combNEI, aes(x = factor(year), y = Emissions))
g <- g + geom_bar(stat = "identity", width = 0.75, fill ="#FF9999")
g <- g + labs(x = 'year', y = "Tons")
g <- g + labs(title = "PM2.5 Coal Combustion Source Emissions (US, Tons, Annual)")
g

dev.copy(png, "./data/plot4.png")
dev.off()
dev.off()