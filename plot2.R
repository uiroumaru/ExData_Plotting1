power <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
power_sub <- subset(power,power$Date=="1/2/2007"|power$Date =="2/2/2007")

power_sub$Date <- as.Date(power_sub$Date, format="%d/%m/%Y")
power_sub$Time <- strptime(power_sub$Time, format="%H:%M:%S")
power_sub[1:1440,"Time"] <- format(power_sub[1:1440,"Time"],"2007-02-01 %H:%M:%S")
power_sub[1441:2880,"Time"] <- format(power_sub[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

plot(power_sub$Time,as.numeric(as.character(power_sub$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)") 
title(main="Global Active Power Vs Time")
