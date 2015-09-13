plot1 <- function() {
     headings <- c("Date", "Time", "Global Active", "Global Reactive", "Voltage", "Global Intensity", "Submetering 1", "Submetering 2", "Submetering 3")
     data <- read.table("household_power_consumption.txt", sep=";", col.names=headings, na.strings="?", skip=66637, nrows=2880, stringsAsFactors=FALSE)
     data$Date <- paste(data$Date, data$Time)
     data$Date <- strptime(data$Date, format = "%d/%m/%Y %H:%M:%S")

     hist(data$Global.Active, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
     dev.copy(png, file = "plot1.png", width=480, height=480)
     dev.off()
}