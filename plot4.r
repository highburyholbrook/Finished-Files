##Placed the file from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
##into my workspace

##Unzipped the file using PKzip and placed the file in my working directory


##Reading in the data from the text file
raw_data <- read.table("household_power_consumption.txt", header = TRUE,
                       sep = ";", na.strings = "?")

##Converting Date column to be of the Date class
raw_data$Date <- as.Date(raw_data$Date, format="%d/%m/%Y")

##Subsetting raw_data for the 2 date fields we are looking at
data <- subset(raw_data, raw_data$Date > as.Date("2007-01-31") 
               & raw_data$Date < as.Date("2007-02-03"))

##Converting Global_active_power to numeric
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))


##Create a datetime field in data set
data$datetime <- as.POSIXct(paste(data$Date, data$Time), 
                            format="%Y-%m-%d %H:%M:%S")
##Creating PNG file to send plot to
png(filename = "plot4.png", width = 480, height = 480)

##Set parameters for multiple plots
par(mfrow = c(2,2))

##Set up first plot
{plot(data$datetime, data$Global_active_power, ylab = "Global Active Power",
      xlab = "", type = "l")
 
 ##Set up second plot
 plot(data$datetime, data$Voltage, xlab = "datetime",
      ylab = "Voltage", type = "l")
 
 ##Set up third plot
 plot(data$datetime, data$Sub_metering_1, type = "l", col = "black",
      ylab = "Energy Sub Metering", xlab = "")
 lines(data$datetime, data$Sub_metering_2, type = 'l', col = "red",
       lty = 1, lwd = 1)
 lines(data$datetime, data$Sub_metering_3, type = 'l', col = "blue",
       lty = 1, lwd = 1)
 legend("topright", col = c("black", "red", "blue"),
        legend = c("Sub_metering_1", "Sub_metering_2", 
                   "Sub_metering_3"), lty = c(1,1,1), lwd = c(1,1,1))
 
 ##Set up fourth plot
 plot(data$datetime, data$Global_reactive_power, xlab = "datetime",
      ylab = "Global_reactive_power", type = "l")
}

##Turning png off
dev.off()