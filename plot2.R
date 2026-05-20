hpc <- read.table("C:/Users/yazubair/Documents/Coursera/R/Data Science  Foundations Using R/4 -  Exploratory Data Analysis/household_power_consumption.txt", header = TRUE, sep = ";")

fhpc <- subset(hpc, hpc$Date == "1/2/2007"|hpc$Date == "2/2/2007")

fhpc$Date <- as.Date(fhpc$Date, format = "%d%m%Y")
fhpc$DateTime <- strptime(paste(fhpc$Date, fhpc$Time), "%Y-%m-%d %H:%M:%S")


plot(fhpc$Global_active_power ~ as.POSIXct(fhpc$DateTime), type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()






