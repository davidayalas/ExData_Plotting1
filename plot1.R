#Reads csv
epc <- read.csv("./household_power_consumption.txt", sep=";")

#Transforms Date & Time columns
epc$Date <- strptime(as.character(paste(epc$Date, epc$Time, sep = " ")), "%d/%m/%Y %H:%M:%S")

#Filters dataset
epc <- subset(epc, Date >= as.POSIXlt("2007-02-01") & Date <= as.POSIXlt("2007-02-02"))

#Creates graphic
png(file = "./plot1.png", width = 480, height = 480, units = "px", bg="transparent") 
hist(epc$Global_active_power, col="red", main = "Global Active Power",  xlab="Global Active Power (kilowatts)",bg = "transparent")
dev.off() 