# Reading the data file
sourcefile <- "household_power_consumption.txt"
Data <- read.table(sourcefile, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")

# Naming and subsetting the data
names(Data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subData <- subset(Data,Data$Date=="1/2/2007" | Data$Date =="2/2/2007")

# Converting date/time
datetime <- strptime(paste(subData$Date, subData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
subpower <- as.numeric(subData$Global_active_power)
        
#plotting graph
png("plot2.png")
plot(datetime, subpower, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()