# Reading the data file
sourcefile <- "household_power_consumption.txt"
Data <- read.table(sourcefile, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")

# Naming and subsetting the data
names(Data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subData <- subset(Data,Data$Date=="1/2/2007" | Data$Date =="2/2/2007")

# Converting date/time and submetering
datetime <- strptime(paste(subData$Date, subData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
subpower <- as.numeric(subData$Global_active_power)
submetering1 <- as.numeric(subData$Sub_metering_1)
submetering2 <- as.numeric(subData$Sub_metering_2)
submetering3 <- as.numeric(subData$Sub_metering_3)

#plotting graph
png("plot3.png")
plot(datetime, submetering1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(datetime, submetering2, type="l", col="red")
lines(datetime, submetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()