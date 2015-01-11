##Placed the file from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
##into my workspace

##Unzipped the file using PKzip and placed the file in my working directory


##Reading in the data from the text file
raw_data <- read.table("household_power_consumption.txt", header = TRUE,
                       sep = ";")

##Converting Date column to be of the Date class
raw_data$Date <- as.Date(raw_data$Date, format="%d/%m/%Y")

##Subsetting raw_data for the 2 date fields we are looking at
data <- subset(raw_data, raw_data$Date > as.Date("2007-01-31") 
               & raw_data$Date < as.Date("2007-02-03"))

##Create a datetime field in data set
data$datetime <- as.POSIXct(paste(data$Date, data$Time), 
                                format="%Y-%m-%d %H:%M:%S")

##Converting Global_active_power to numeric
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))

##Creating PNG file to send plot to
png(filename = "plot2.png", width = 480, height = 480)

##Creating the plot
plot(data$datetime, data$Global_active_power, type = 's', 
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

##Turning png off
dev.off()
