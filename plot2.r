data <- read.table("household_power_consumption.txt", header = TRUE, sep=";")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data2 <- subset(data, (Date=="2007-02-01")|(Date=="2007-02-02"))
data2$datetime <- as.POSIXct(paste(data2$Date,data2$Time))

plot(data2$datetime,as.numeric(as.character(data2$Global_active_power)), type="l", xlab = "", ylab="Global Active Power (kilowatts)")

dev.copy(png,"plot2.png", width=480, height=480)
dev.off()
