pow<-read.table("D:\\MOOC\\Data Science Seiry on Coursera\\exploratory\\Project 1\\household_power_consumption.txt", header=T, sep=";",na.strings="?",col.names=c("Date","Time","Global_active_power", "Global_reactive_power","Voltage","Global_intensity","Sub_metering_1", "Sub_metering_2c", "Sub_metering_3"))
cond <- (pow$Date=="1/2/2007" | pow$Date=="2/2/2007" ) & !is.na(pow$Global_active_power)
power<-pow[cond,]
Global_active_power<-power[['Global_active_power']]

png("D:\\MOOC\\Data Science Seiry on Coursera\\exploratory\\Project 1\\plot1.png")
hist(Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power(KilloWatts)")
dev.off()

