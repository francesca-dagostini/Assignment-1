setwd("/Users/francescadagostini/desktop")
data<-read.table("household_power_consumption.txt", sep=";", header=TRUE)
data$Date<-as.Date(data$Date, format=c("%d/%m/%Y"))
newdata<-subset(data, data$Date >="2007-02-01" & data$Date <="2007-02-02", select=c(1:9))
Global_active_power<-as.numeric(as.character(newdata$Global_active_power))
png(file="plot1.png", width=480, height=480) 
hist(Global_active_power, col="red", xlab="Global Active Power (kilowatts)", ylab="Frequency", main = "Global Active Power")
dev.off()                                                                                                                                              

     
     