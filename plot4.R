#setwd("/Users/QQL/Desktop/2T HardDrive Backup/Info3-Online_Test Learning/Coursera 4 Exploratory Data Analysis /Project 1")

mydata<-read.csv("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=FALSE)
data<- subset(mydata, mydata$Date == "1/2/2007" | mydata$Date == "2/2/2007")

data$DateTime<-paste(data$Date,data$Time)
data$DateTimePosIx <- strptime(data$DateTime, format="%d/%m/%Y %H:%M:%S")

data$Global_active_power<-as.numeric(data$Global_active_power)
png(file="plot4.png")
par(mfrow=c(2,2))
plot(data$DateTimePosIx, data$Global_active_power, type="l",xlab="", ylab="Global Active Power")
plot(data$DateTimePosIx, data$Voltage, type="l",xlab="datetime", ylab="Voltage")
with(data, {
    plot(data$DateTimePosIx, data$Sub_metering_1, type="l",xlab="", ylab="Energy sub metering", col="black")
    points(data$DateTimePosIx, data$Sub_metering_2, type="l",xlab="", ylab="Energy sub metering", col="red")
    points(data$DateTimePosIx, data$Sub_metering_3, type="l",xlab="", ylab="Energy sub metering", col="blue")
    legend("topright",lty=1,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"))
})
plot(data$DateTimePosIx, data$Global_reactive_power, type="l",xlab="datetime", ylab="Global_reactive_power")
dev.off()

