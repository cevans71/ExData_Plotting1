file <- "household_power_consumption.txt"
allData <- read.table(file, header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE, dec = ".")

allData$Date <- as.Date(allData$Date, format = "%d/%m/%Y")
subData <- subset(allData, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

subData$datetime <- strptime(paste(subData$Date, subData$Time), "%Y-%m-%d %H:%M:%S")

subData$datetime <- as.POSIXct(subData$datetime)
plot(subData$Global_active_power ~ subData$datetime, type="l", ylab = "Global Active Power (kilowatts)", xlab="" )
dev.copy(png, file="plot2.png", height = 480, width = 480)
dev.off()