## First the file was downloaded into work directory and unzipped
## Second read data with header, sep by ";", put NA like "?" and identify data's class
dat <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings="?",
                  colClasses=c("character","character","numeric","numeric","numeric","numeric",
                               "numeric","numeric","numeric"))
## Select a subset with apropiate dates
subdat <- subset(dat, dat$Date == "1/2/2007" | dat$Date == "2/2/2007")
## Give format to dates
subdat$DateTime <- strptime(paste(subdat$Date, subdat$Time), "%d/%m/%Y %H:%M:%S")

## Make a file named plot3.png into device format
png(filename='plot3.png', width = 480, height = 480, units = "px")
## Build the plot into date format
plot(subdat$DateTime, subdat$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
## Add colors lines
lines(subdat$DateTime, subdat$Sub_metering_2, type="l", col="red")
lines(subdat$DateTime, subdat$Sub_metering_3, type="l", col="blue")
## Add Legend with colors
legend("topright", legend=names(subdat[7:9]), lty=1, col=c("black","red","blue"))
## Return graph into png file
dev.off()