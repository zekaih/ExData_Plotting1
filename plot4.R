#import data, rm NA values, subset date
eda <- read.table("household_power_consumption.txt",sep = ";",header=TRUE,na.strings = "?")
str(eda)
summary(eda)
eda1 <- complete.cases(eda)
eda <- eda[eda1,]
summary(eda)
eda <- subset(eda,eda$Date=="1/2/2007" | eda$Date=="2/2/2007")

#plot 4
datetime <- strptime(paste(eda$Date,eda$Time),format = "%d/%m/%Y %H:%M:%S")
png("plot4.png",width=480,height=480)
par(mfrow=c(2,2))
plot(datetime,eda$Global_active_power,type="l",xlab="",ylab="Global Active Power")
plot(datetime,eda$Voltage,type="l",ylab="Voltage",xlab="datetime")
plot(datetime,eda$Sub_metering_1,type="l",col="black",xlab="",ylab="Energy sub metering")
lines(datetime,eda$Sub_metering_2,type = "l",col="red")
lines(datetime,eda$Sub_metering_3,type = "l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"),bty="n")
plot(datetime,eda$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
dev.off()
