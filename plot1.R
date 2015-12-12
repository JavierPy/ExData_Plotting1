### plot 1
# uncomment to set the source directory
#setwd("D:/Temporal/coursera/")
datos <- read.csv2("./household_power_consumption.txt",header = TRUE, 
                   sep=";", dec = ".", na.strings = "?")
## only two dates
o2d <-datos[datos$Date %in% c("1/2/2007","2/2/2007") ,]
png("plot1.png", width=480, height=480)
## histogram
hist(o2d$Global_active_power,col="red", ylim = c(0,1200), main = "Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()