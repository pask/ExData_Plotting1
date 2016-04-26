data <- read.table("household_power_consumption.txt", header = TRUE, sep=";")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data2 <- subset(data, (Date=="2007-02-01")|(Date=="2007-02-02"))
data2$datetime <- as.POSIXct(paste(data2$Date,data2$Time))

par(mfcol=c(2,2))

plot(data2$datetime,as.numeric(as.character(data2$Global_active_power)), type="l", xlab = "", ylab="Global Active Power")

plot(data2$datetime,as.numeric(as.character(data2$Sub_metering_1)), type="l", xlab = "", ylab="Energy sub metering", col="black")
lines(data2$datetime,as.numeric(as.character(data2$Sub_metering_2)), col="red")
lines(data2$datetime,as.numeric(as.character(data2$Sub_metering_3)), col="blue")

legend('topright',c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),
       lwd=2,
       bty="l",
       col=c('black','red','blue'),
       cex = 0.08)

plot(data2$datetime,as.numeric(as.character(data2$Voltage)), type="l", xlab = "datetime", ylab="Voltage", col="black")
plot(data2$datetime,as.numeric(as.character(data2$Global_reactive_power)), type="l", xlab = "datetime", ylab="Global_reactive_power", col="black")

dev.copy(png,"plot4.png", width=480, height=480)
dev.off()