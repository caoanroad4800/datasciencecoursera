library(data.table)
setwd("~/Soft/Rtest/datasciencecoursera/04_Exploratory_Data_Analysis/Assignment: ExData_Plotting1/")
power <- fread("./data/household_power_consumption.txt", sep=';')
power$Date <- as.Date(power$Date, format = c("%d/%m/%Y"))
#sum(power$Date >= as.Date("2007-02-01") & power$Date <= as.Date("2007-02-02"))
power <- power[(power$Date >= as.Date("2007-02-01")) & (power$Date < as.Date("2007-02-03")),]
#power$dateTime = as.POSIXct(paste(power$Date, power$Time), format = "%d/%m/%Y %H:%M:%S")
power$dateTime = as.POSIXct(paste(power$Date, power$Time))
#as.POSIXct(paste(power$Date, power$Time), format = "%d-%m-%Y %H:%M:%S")

names(power)
power$Global_active_power <- as.numeric(power$Global_active_power)

hist(power$Global_active_power
     , main = "Global Active Power"
     , col="red"
     , xlab = "Global Active Power (kilowatts)"
     , ylab = "Frequency")
dev.copy(png, "./figure/plot1.png")
dev.off()
dev.off()