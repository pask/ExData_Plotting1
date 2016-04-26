data <- read.table("household_power_consumption.txt", header = TRUE, sep=";")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data2 <- subset(data, (Date=="2007-02-01")|(Date=="2007-02-02"))

hist(x = as.numeric(as.character(data2$Global_active_power)), col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab="Frequency")

dev.copy(png,"plot1.png", width=480, height=480)
dev.off()
