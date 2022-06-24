power <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
power_sub <- subset(power,power$Date=="1/2/2007"|power$Date =="2/2/2007")

power_sub$Date <- as.Date(power_sub$Date, format="%d/%m/%Y")
power_sub$Time <- strptime(power_sub$Time, format="%H:%M:%S")
power_sub[1:1440,"Time"] <- format(power_sub[1:1440,"Time"],"2007-02-01 %H:%M:%S")
power_sub[1441:2880,"Time"] <- format(power_sub[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


par(mfrow=c(2,2))

# calling the basic plot function that calls different plot functions to build the 4 plots that form the graph
with(power_sub,{
  plot(power_sub$Time,as.numeric(as.character(power_sub$Global_active_power)),type="l",  xlab="",ylab="Global Active Power")  
  plot(power_sub$Time,as.numeric(as.character(power_sub$Voltage)), type="l",xlab="datetime",ylab="Voltage")
  plot(power_sub$Time,power_sub$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
  with(power_sub,lines(Time,as.numeric(as.character(Sub_metering_1))))
  with(power_sub,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
  with(power_sub,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
  legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)
  plot(power_sub$Time,as.numeric(as.character(power_sub$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")
})

aaa