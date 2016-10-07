##Load Data
Data = read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE)
subSetData <- Data[Data$Date %in% c("1/2/2007","2/2/2007") ,]

#Convert dates

datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
datetime <- as.POSIXct(datetime)

# Plot 3
png("plot3.png", width=480, height=480)
with(subSetData, {
  plot(Sub_metering_1~datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~datetime,col='Red')
  lines(Sub_metering_3~datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()