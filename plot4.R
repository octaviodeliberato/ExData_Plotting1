setwd("C:/Users/Octavio/EDA-Course-Project")
library(readr)
hpc <- read_delim("C:/Users/Octavio/EDA-Course-Project/household_power_consumption.txt",
";", escape_double = FALSE, col_types = cols(Date = col_date(format = "%d/%m/%Y"),
Time = col_time(format = "%H:%M:%S")),
trim_ws = TRUE)
library(lubridate)
library(dplyr)
hpc.feb<-filter(hpc,month(Date)==2,year(Date)==2007,day(Date)<=2)
rm("hpc")
View(hpc.feb)
datetime<-update(hpc.feb$Date,hours=hour(hpc.feb$Time),minutes=minute(hpc.feb$Time),seconds=second(hpc.feb$Time))
png(filename="plot4.png")
par(mfrow = c(2, 2)) 
plot(datetime, hpc.feb$Global_active_power, type="l", xlab="", ylab="Global Active Power")
plot(datetime, hpc.feb$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(datetime, hpc.feb$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, hpc.feb$Sub_metering_2, type="l", col="red")
lines(datetime, hpc.feb$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"),bty="n")

plot(datetime, hpc.feb$Global_reactive_power, type="l", xlab="datetime", ylab="Global reactive power")
dev.off()