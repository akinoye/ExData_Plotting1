dataFile <- "./household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".", na.strings = "?")
TwoDayPeriod <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(TwoDayPeriod$Date, TwoDayPeriod$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(TwoDayPeriod$Global_active_power)
subMetering1 <- as.numeric(TwoDayPeriod$Sub_metering_1)
subMetering2 <- as.numeric(TwoDayPeriod$Sub_metering_2)
subMetering3 <- as.numeric(TwoDayPeriod$Sub_metering_3)
voltage <- as.numeric(TwoDayPeriod$Voltage)
globalReactivePower <- as.numeric(TwoDayPeriod$Global_reactive_power)

png("plot4.png", width=480, height=480)
par(mfrow = c(2,2))

plot(datetime,globalActivePower, type = "l",xlab = " ", ylab = "Global Active Power", cex = 0.2)

plot(datetime,voltage, type = "l", ylab = "Voltage")

plot(datetime,subMetering1, type = "l",xlab = " ", ylab = "Energy sub metering")
lines(datetime, subMetering2, type = "l", col = "red")
lines(datetime, subMetering3, type = "l", col = "blue")
legend("topright", col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = 1, lwd = 1)

plot(datetime,globalReactivePower, type = "l", ylab = "Global_reactive_power")
dev.off()