file <- "household_power_consumption.txt"
allData <- read.table(file, header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE, dec = ".")

allData$Date <- as.Date(allData$Date, format = "%d/%m/%Y")
subData <- subset(allData, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

subData$datetime <- strptime(paste(subData$Date, subData$Time), "%Y-%m-%d %H:%M:%S")

subData$datetime <- as.POSIXct(subData$datetime)

plot(subData$Sub_metering_1 ~ subData$datetime, type = "l", ylab = "Energy sub metering", xlab = "")
lines(subData$Sub_metering_2 ~ subData$datetime, type = "l", col = "Red")
lines(subData$Sub_metering_3 ~ subData$datetime, type = "l", col = "Blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()