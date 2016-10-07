##Load Data
Data = read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE)
subSetData <- Data[Data$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# Plot 2
globalActivePower <- as.numeric(subSetData$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime,globalActivePower,type = "l",ylab="Global Active Power (kilowatts)")
dev.off()