hpc <- read.table("C:/Users/yazubair/Documents/Coursera/R/Data Science  Foundations Using R/4 -  Exploratory Data Analysis/household_power_consumption.txt", header = TRUE, sep = ";")

fhpc <- subset(hpc, hpc$Date == "1/2/2007"|hpc$Date == "2/2/2007")

fhpc$Date <- as.Date(fhpc$Date, format = "%d%m%Y")
fhpc$DateTime <- strptime(paste(fhpc$Date, fhpc$Time), "%Y-%m-%d %H:%M:%S")

plot(fhpc$Sub_metering_1 ~ as.POSIXct(fhpc$DateTime), type = "l", ylab = "Energy sub metering", xlab = "")

lines(fhpc$Sub_metering_2~as.POSIXct(fhpc$DateTime), col="red")
lines(fhpc$Sub_metering_3~as.POSIXct(fhpc$DateTime), col="blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), cex = 0.8, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()
