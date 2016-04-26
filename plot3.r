data <- read.table("household_power_consumption.txt", header = TRUE, sep=";")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data2 <- subset(data, (Date=="2007-02-01")|(Date=="2007-02-02"))
data2$datetime <- as.POSIXct(paste(data2$Date,data2$Time))

plot(data2$datetime,as.numeric(as.character(data2$Sub_metering_1)), type="l", xlab = "", ylab="Energy sub metering", col="black")
lines(data2$datetime,as.numeric(as.character(data2$Sub_metering_2)), col="red")
lines(data2$datetime,as.numeric(as.character(data2$Sub_metering_3)), col="blue")

legend('topright',c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),
       lty=1, lwd=2,
       col=c('black','red','blue'),
       cex = 0.6)

dev.copy(png,"plot3.png", width=480, height=480)
dev.off()
