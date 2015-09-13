plot4 <- function() {
     headings <- c("Date", "Time", "Global Active", "Global Reactive", "Voltage", "Global Intensity", "Submetering 1", "Submetering 2", "Submetering 3")
     data <- read.table("household_power_consumption.txt", sep=";", col.names=headings, na.strings="?", skip=66637, nrows=2880, stringsAsFactors=FALSE)
     data$Date <- paste(data$Date, data$Time)
     data$Date <- strptime(data$Date, format = "%d/%m/%Y %H:%M:%S")
     
     par(mfrow = c(2,2))
     
     with(data, plot(Date, Global.Active, type="l", ylab="Global Active Power", xlab=""))
     with(data, plot(Date, Voltage, type="l", ylab="Voltage", xlab="datetime", yaxp=c(234,246,6)))
     with(data, plot(Date, Submetering.1, type="l", ylab="Energy sub metering", xlab=""))
     lines(data$Date, data$Submetering.2, col="red")
     lines(data$Date, data$Submetering.3, col="blue")
     legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lwd=1, bty="n", y.intersp=.5)
     with(data, plot(Date, Global.Reactive, type="l", ylab="Global_reactive_power", xlab="datetime"))

     dev.copy(png, file = "plot4.png", width=480, height=480)
     dev.off()
}