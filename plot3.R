## plot 3
# uncomment to set the source directory
#setwd("D:/Temporal/coursera/")
Sys.setlocale("LC_ALL", "English")
datos <- read.csv2("./household_power_consumption.txt",header = TRUE, 
                   sep=";", dec = ".", na.strings = "?")
## only two dates
o2d <-datos[datos$Date %in% c("1/2/2007","2/2/2007") ,]
# concatenate date and time
datetime <- strptime(paste(o2d$Date, o2d$Time, sep = " "),"%d/%m/%Y %H:%M:%S")

png("plot3.png", width=480, height=480)
# plot 1
plot(datetime, o2d$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
#plot 2
lines(datetime, o2d$Sub_metering_2,type = "l", col='red')
#plot 3
lines(datetime, o2d$Sub_metering_3,type = "l", col='blue')
# labels
legend("topright", lty = 1, lwd=2, col = c("black","red","blue"), 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3") )
dev.off()