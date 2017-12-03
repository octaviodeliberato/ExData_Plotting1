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
png(filename="plot2.png")
plot(datetime, hpc.feb$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()