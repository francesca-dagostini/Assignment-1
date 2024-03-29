setwd("/Users/francescadagostini/desktop")
data<-read.table("household_power_consumption.txt", sep=";", header=TRUE)
data$DateTime<-paste(data$Date, data$Time, sep = " ")
data$Date<-as.Date(data$Date, format=c("%d/%m/%Y"))
newdata<-subset(data, data$Date >="2007-02-01" & data$Date <="2007-02-02", select=c(1:10))
newdata$DateTime<-as.POSIXct(newdata$DateTime, format="%d/%m/%Y %H:%M:%S")
newdata$Global_active_power<-as.numeric(as.character(newdata$Global_active_power))
newdata$Sub_metering_1<-as.numeric(as.character(newdata$Sub_metering_1))
newdata$Sub_metering_2<-as.numeric(as.character(newdata$Sub_metering_2))
newdata$Sub_metering_3<-as.numeric(as.character(newdata$Sub_metering_3))
newdata$Voltage<-as.numeric(as.character(newdata$Voltage))
png(file="plot4.png", width=480, height=480)
par(mfrow=c(2,2))
plot(newdata$DateTime,Global_active_power,type="l", ylab= "Global Active Power (kilowatts)", xlab="")
plot(newdata$DateTime,newdata$Voltage,type="l", ylab= "Voltage", xlab="datetime")
with(newdata,plot(newdata$DateTime,newdata$Sub_metering_1, type= "l", xlab="", ylab="Energy sub metering"))
with(newdata,points(newdata$DateTime,newdata$Sub_metering_2, type="l", col= "red"))
with(newdata,points(newdata$DateTime,newdata$Sub_metering_3, type="l", col="blue"))
legend("topright", lty = 1 , inset= 0.01, box.lwd = NA, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(newdata$DateTime,newdata$Global_reactive_power,type="l", ylab= "Global_reactive_power", xlab="datetime")
dev.off()

