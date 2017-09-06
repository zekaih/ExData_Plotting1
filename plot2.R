#import data, rm NA values, subset date
eda <- read.table("household_power_consumption.txt",sep = ";",header=TRUE,na.strings = "?")
str(eda)
summary(eda)
eda1 <- complete.cases(eda)
eda <- eda[eda1,]
summary(eda)
eda <- subset(eda,eda$Date=="1/2/2007" | eda$Date=="2/2/2007")

#plot 2
datetime <- strptime(paste(eda$Date,eda$Time),format = "%d/%m/%Y %H:%M:%S")
png("plot2.png",width = 480,height = 480)
plot(datetime,eda$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()