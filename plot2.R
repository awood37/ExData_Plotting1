## plot 2

getwd()
setwd("~/Downloads")

power <- read.csv("~/Downloads/household_power_consumption.txt", header=TRUE, sep = ";", na.strings = "?")
power$Date <- as.Date(power$Date, format="%d/%m/%Y")

powerSubset <- subset(power, Date >= "2007-02-01" & Date <= "2007-02-02")

datetime <- paste(as.Date(powerSubset$Date), powerSubset$Time)
powerSubset$Datetime <- as.POSIXct(datetime)

with(powerSubset, plot(Global_active_power~Datetime,
                       ylab = "Global Active Power (kilowatts)",
                       xlab = "",
                       type = 'l'))
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()