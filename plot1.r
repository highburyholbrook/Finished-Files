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

##Converting Global_active_power to numeric
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))

##Setting y axis parameters
par(yaxp = c(0, 1200, 200))

##Creating PNG file to send histogram to
png(filename = "plot1.png", width = 480, height = 480)

##Creating the histogram
hist(data$Global_active_power, breaks = 14, 
     xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency", col = "red", main = "Global Active Power")

##Turning png off
dev.off()


