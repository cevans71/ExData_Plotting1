file <- "household_power_consumption.txt"
allData <- read.table(file, header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE, dec = ".")

allData$Date <- as.Date(allData$Date, format = "%d/%m/%Y")
subData <- subset(allData, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

subData$datetime <- strptime(paste(subData$Date, subData$Time), "%Y-%m-%d %H:%M:%S")

subData$datetime <- as.POSIXct(subData$datetime)

par(mfrow = c(2,2))
plot(subData$Global_active_power ~ subData$datetime, type = "l", ylab = "Global Active Power", xlab = "")
plot(subData$Voltage ~ subData$datetime, type = "l")
plot(subData$Sub_metering_1 ~ subData$datetime, type = "l", ylab = "Energy sub metering", xlab = "")
lines(subData$Sub_metering_2 ~ subData$datetime, col = "Red")
lines(subData$Sub_metering_3 ~ subData$datetime, col = "Blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")
plot(subData$Global_reactive_power ~ subData$datetime, type = "l")

dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()