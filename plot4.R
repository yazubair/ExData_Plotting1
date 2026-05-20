hpc <- read.table("C:/Users/yazubair/Documents/Coursera/R/Data Science  Foundations Using R/4 -  Exploratory Data Analysis/household_power_consumption.txt", header = TRUE, sep = ";")

fhpc <- subset(hpc, hpc$Date == "1/2/2007"|hpc$Date == "2/2/2007")

fhpc$Date <- as.Date(fhpc$Date, format = "%d%m%Y")
fhpc$DateTime <- strptime(paste(fhpc$Date, fhpc$Time), "%Y-%m-%d %H:%M:%S")

fhpc$DateTime <- as.POSIXct(fhpc$DateTime)
par(mfrow = c(2,2), mar = c(4,4,2,1))

with(fhpc, { 
  plot(fhpc$DateTime, fhpc$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
  plot(fhpc$DateTime, fhpc$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
  plot(fhpc$DateTime, fhpc$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
  with(fhpc, lines(DateTime, Sub_metering_1))
  with(fhpc, lines(DateTime, Sub_metering_2), col = "red")
  with(fhpc, lines(DateTime, Sub_metering_3), col ="blue")
  legend("topright", lty = 1, col =c("black", "red", "blue"),
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         bty = "n")
  plot(fhpc$DateTime, fhpc$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
})

dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()
