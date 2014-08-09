Sys.setlocale("LC_TIME", "C")

#Reads csv
epc <- read.csv("./household_power_consumption.txt", sep=";")

#Transforms Date & Time columns
epc$Date <- strptime(as.character(paste(epc$Date, epc$Time, sep = " ")), "%d/%m/%Y %H:%M:%S")

#Filters dataset
epc <- subset(epc, Date >= as.POSIXlt("2007-02-01") & Date < as.POSIXlt("2007-02-03"))

#Creates graphic
png(file = "./plot2.png", width = 480, height = 480, units = "px", bg="transparent") 
plot(epc$Date, epc$Global_active_power, type="l", main="", ylab="Global Active Power (kilowatts)",xlab="")
#daterange=c(as.POSIXlt(min(epc$Date)),as.POSIXlt(max(epc$Date+1))) 
#axis.POSIXct(1, at=seq(daterange[1], daterange[2], by="day"), format="%a") #label the X axis by day. Based on locale 

dev.off() 