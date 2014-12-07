#setwd("/Users/QQL/Desktop/2T HardDrive Backup/Info3-Online_Test Learning/Coursera 4 Exploratory Data Analysis /Project 1")

mydata<-read.csv("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=FALSE)
data<- subset(mydata, mydata$Date == "1/2/2007" | mydata$Date == "2/2/2007")

data$DateTime<-paste(data$Date,data$Time)
data$DateTimePosIx <- strptime(data$DateTime, format="%d/%m/%Y %H:%M:%S")

data$Global_active_power<-as.numeric(data$Global_active_power)
png(file="plot1.png")
hist(data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowater)")
dev.off()
