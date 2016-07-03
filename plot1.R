## plot 1
getwd()
setwd("~/Downloads")

power <- read.csv("~/Downloads/household_power_consumption.txt", header=TRUE, sep = ";", na.strings = "?")
power$Date <- as.Date(power$Date, format="%d/%m/%Y")

powerSubset <- subset(power, Date >= "2007-02-01" & Date <= "2007-02-02")

datetime <- paste(as.Date(powerSubset$Date), powerSubset$Time)
powerSubset$Datetime <- as.POSIXct(datetime)


with(powerSubset,hist(Global_active_power, main = "Global Active Power",
                      col = "red", xlab = "Global Active Power (kilowatts)"))

dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()