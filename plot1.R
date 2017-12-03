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
png(filename="plot1.png")
hist(hpc.feb$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red")
dev.off()