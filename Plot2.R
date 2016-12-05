dataFile <- "./household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".", na.strings = "?")
TwoDayPeriod <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(TwoDayPeriod$Date, TwoDayPeriod$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(TwoDayPeriod$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime,globalActivePower, type = "l",xlab = " ", ylab = "Global Active Power (kilowatts)")
dev.off()