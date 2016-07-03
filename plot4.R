## plot 4

getwd()
setwd("~/Downloads")

power <- read.csv("~/Downloads/household_power_consumption.txt", header=TRUE, sep = ";", na.strings = "?")
power$Date <- as.Date(power$Date, format="%d/%m/%Y")

powerSubset <- subset(power, Date >= "2007-02-01" & Date <= "2007-02-02")

datetime <- paste(as.Date(powerSubset$Date), powerSubset$Time)
powerSubset$Datetime <- as.POSIXct(datetime)


par(mfrow = c(2,2), mar = c(4,4,2,1))
with(powerSubset, {
    plot(Global_active_power ~ Datetime, type= "l", 
         ylab = "Global Active Power", xlab = "")
    plot(Voltage ~ Datetime, type= "l", 
         ylab = "Voltage", xlab = "datetime")
    plot(Sub_metering_1 ~ Datetime, type = "l",
         ylab = "Energy sub metering", xlab = "") 
    lines(Sub_metering_2 ~ Datetime, col = 'Red') 
    lines(Sub_metering_3 ~ Datetime, col = 'Blue')
    legend("topright", col = c("black", "red", "blue"), lty = 1, 
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(Global_reactive_power ~ Datetime, type="l", xlab="datetime",
         ylab="Global_reactive_power")})

dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()
