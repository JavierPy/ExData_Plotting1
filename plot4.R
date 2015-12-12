# plot 4
# uncomment to set the source directory
#setwd("D:/Temporal/coursera/")
Sys.setlocale("LC_ALL", "English")
datos <- read.csv2("./household_power_consumption.txt",header = TRUE, 
                   sep=";", dec = ".", na.strings = "?")
## only two dates
o2d <-datos[datos$Date %in% c("1/2/2007","2/2/2007") ,]
# concatenate date and time
datetime <- strptime(paste(o2d$Date, o2d$Time, sep = " "),"%d/%m/%Y %H:%M:%S")

png("plot4.png", width=480, height=480)
par(mfrow = c(2,2))

with(o2d,{
    # plot 1
    plot(datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
    # plot 2
    plot(datetime, Voltage, type = "l")
    # plot 3
    plot(datetime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
    lines(datetime, Sub_metering_2,type = "l", col='red')
    lines(datetime, Sub_metering_3,type = "l", col='blue')
    legend("topright", lty = 1, col = c("black","red","blue"), 
           legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3") )
    # plot 4
    plot(datetime, Global_reactive_power, type="l")
})
dev.off()
