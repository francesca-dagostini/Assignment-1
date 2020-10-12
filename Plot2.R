setwd("/Users/francescadagostini/desktop")
data<-read.table("household_power_consumption.txt", sep=";", header=TRUE)
data$DateTime<-paste(data$Date, data$Time, sep = " ")
data$Date<-as.Date(data$Date, format=c("%d/%m/%Y"))
newdata<-subset(data, data$Date >="2007-02-01" & data$Date <="2007-02-02", select=c(1:10))
newdata$DateTime<-as.POSIXct(newdata$DateTime, format="%d/%m/%Y %H:%M:%S")
Global_active_power<-as.numeric(as.character(newdata$Global_active_power))
png(file="plot2.png", width=480, height=480)
plot(newdata$DateTime,Global_active_power,type="l", ylab= "Global Active Power (kilowatts)", xlab="")
dev.off()


