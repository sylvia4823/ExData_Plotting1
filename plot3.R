#setwd("/Users/QQL/Desktop/2T HardDrive Backup/Info3-Online_Test Learning/Coursera 4 Exploratory Data Analysis /Project 1")

mydata<-read.csv("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=FALSE)
data<- subset(mydata, mydata$Date == "1/2/2007" | mydata$Date == "2/2/2007")

data$DateTime<-paste(data$Date,data$Time)
data$DateTimePosIx <- strptime(data$DateTime, format="%d/%m/%Y %H:%M:%S")

data$Global_active_power<-as.numeric(data$Global_active_power)
data$Sub_metering_1<-as.numeric(data$Sub_metering_1)
data$Sub_metering_2<-as.numeric(data$Sub_metering_2)
data$Sub_metering_3<-as.numeric(data$Sub_metering_3)

png(file="plot3.png")
with(data, {
    plot(data$DateTimePosIx, data$Sub_metering_1, type="l",xlab="", ylab="Energy sub metering", col="black")
    points(data$DateTimePosIx, data$Sub_metering_2, type="l",xlab="", ylab="Energy sub metering", col="red")
    points(data$DateTimePosIx, data$Sub_metering_3, type="l",xlab="", ylab="Energy sub metering", col="blue")
    legend("topright",lty=1,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"))
})
dev.off()