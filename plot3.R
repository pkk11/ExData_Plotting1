plot3 <- function() {
     headings <- c("Date", "Time", "Global Active", "Global Reactive", "Voltage", "Global Intensity", "Submetering 1", "Submetering 2", "Submetering 3")
     data <- read.table("household_power_consumption.txt", sep=";", col.names=headings, na.strings="?", skip=66637, nrows=2880, stringsAsFactors=FALSE)
     data$Date <- paste(data$Date, data$Time)
     data$Date <- strptime(data$Date, format = "%d/%m/%Y %H:%M:%S")
     with(data, plot(Date, Submetering.1, type="l", ylab="Energy sub metering", xlab=""))
     lines(data$Date, data$Submetering.2, col="red")
     lines(data$Date, data$Submetering.3, col="blue")
     legend(x="topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lwd=1)
     dev.copy(png, file = "plot3.png", width=480, height=480)
     dev.off()
}