hpc <- read.table("C:/Users/yazubair/Documents/Coursera/R/Data Science  Foundations Using R/4 -  Exploratory Data Analysis/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

fhpc <- subset(hpc, hpc$Date == "1/2/2007"|hpc$Date == "2/2/2007")

agap <- as.numeric(as.character(hpc$Global_active_power))

hist(agap, main = "Global Active Power", xlab = "Global Active Power (kilowatts)",  col ="RED", ylim = c(0,1200))

dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()


