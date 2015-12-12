### plot 2
# uncomment to set the source directory
#setwd("D:/Temporal/coursera/")
Sys.setlocale("LC_ALL", "English")
datos <- read.csv2("./household_power_consumption.txt",header = TRUE, 
                   sep=";", dec = ".", na.strings = "?")
## only two dates
o2d <-datos[datos$Date %in% c("1/2/2007","2/2/2007") ,]
# concatenate date and time
datetime <- strptime(paste(o2d$Date, o2d$Time, sep = " "),"%d/%m/%Y %H:%M:%S")
png("plot2.png", width=480, height=480)
# plot 
plot(datetime, o2d$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()