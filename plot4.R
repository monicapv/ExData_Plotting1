## First the file was downloaded into work directory and unzipped
## Second read data with header, sep by ";", put NA like "?" and identify data's class
dat <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings="?",
                  colClasses=c("character","character","numeric","numeric","numeric","numeric",
                               "numeric","numeric","numeric"))
## Select a subset with apropiate dates
subdat <- subset(dat, dat$Date == "1/2/2007" | dat$Date == "2/2/2007")
## Give format to dates
subdat$DateTime <- strptime(paste(subdat$Date, subdat$Time), "%d/%m/%Y %H:%M:%S")

## Make a file named plot4.png into device format
png(filename='plot4.png', width = 480, height = 480, units = "px")
par(mfcol=c(2,2))
## Build the plot into left top side
plot(subdat$DateTime, subdat$Global_active_power, type="l", ylab="Global Active Power", xlab="")
## Build the plot into left down side, legend border not visible
plot(subdat$DateTime, subdat$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(subdat$DateTime, subdat$Sub_metering_2, type="l", col="red")
lines(subdat$DateTime,subdat$Sub_metering_3, type="l", col="blue")
legend("topright", bty="n", legend=names(subdat[7:9]), lty=1, col=c("black","red","blue"))
## Build the plot into right top side
plot(subdat$DateTime, subdat$Voltage, type="l", ylab="Voltage", xlab="datetime")
## make plot into right down side
plot(subdat$DateTime, subdat$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")
dev.off()
