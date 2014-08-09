Sys.setlocale("LC_TIME", "C")

#Reads csv
epc <- read.csv("./household_power_consumption.txt", sep=";")

#Transforms Date & Time columns
epc$Date <- strptime(as.character(paste(epc$Date, epc$Time, sep = " ")), "%d/%m/%Y %H:%M:%S")

#Filters dataset
epc <- subset(epc, Date >= as.POSIXlt("2007-02-01") & Date < as.POSIXlt("2007-02-03"))

#Creates graphic
colors <- c("black","red","blue")
png(file = "./plot3.png", width = 480, height = 480, units = "px", bg="transparent") 
plot(epc$Date, epc$Sub_metering_1, type="l", main="", ylab="Energy sub metering",xlab="", col=colors[1])
lines(epc$Date, epc$Sub_metering_2, type="l", col=colors[2]) 
lines(epc$Date, epc$Sub_metering_3, type="l", col=colors[3]) 
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd=c(1,1), col=colors);
dev.off() 

