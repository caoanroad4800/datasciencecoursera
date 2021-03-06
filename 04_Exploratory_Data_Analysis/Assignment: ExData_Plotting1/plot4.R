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
power$Sub_metering_1 <- as.numeric(power$Sub_metering_1)
power$Sub_metering_2 <- as.numeric(power$Sub_metering_2)
power$Sub_metering_3 <- as.numeric(power$Sub_metering_3)
str(power)

par(new = FALSE)
par(mfrow = c(2,2))
plot(power$dateTime, power$Global_active_power, type = "l", ylab = "Global Active Power", xlab = '')
plot(power$dateTime, power$Voltage, type = 'l', ylab = 'Voltage', xlab = 'datetime')
plot(power$dateTime, power$Voltage, type = 'l', ylab = 'Voltage', xlab = 'datetime')
plot(power$Sub_metering_1 ~ power$dateTime, type = 'l', col = 'black', ylab = "Energy sub metering", xlab="")
par(new = TRUE)
lines(power$Sub_metering_2 ~ power$dateTime, type = 'l', col = 'red')
par(new = TRUE)
lines(power$Sub_metering_3 ~ power$dateTime, type = 'l', col = 'blue')
legend("topright"
       , col = c('black', 'red', 'blue')
       , c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
       , lty = c(1,1,1)
       , lwd = c(1,1,1))
par(new = FALSE)
dev.copy(png, "./figure/plot4.png")
dev.off()
dev.off()

