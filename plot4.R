pow<-read.table("D:\\MOOC\\Data Science Seiry on Coursera\\exploratory\\Project 1\\household_power_consumption.txt", header=T, sep=";",na.strings="?",col.names=c("Date","Time","Global_active_power", "Global_reactive_power","Voltage","Global_intensity","Sub_metering_1", "Sub_metering_2c", "Sub_metering_3"))
cond <- (pow$Date=="1/2/2007" | pow$Date=="2/2/2007" ) & !is.na(pow$Sub_metering_1) & !is.na(pow$Sub_metering_2) & !is.na(pow$Sub_metering_3) & !is.na(pow$Global_reactive_power) & !is.na(pow$Voltage) & !is.na( pow$Global_active_power)
power<-pow[cond,]

png("D:\\MOOC\\Data Science Seiry on Coursera\\exploratory\\Project 1\\plot4.png")
par(mfrow=c(2,2))
par(ps=10)

Global_active_power<-power[['Global_active_power']]
plot(Global_active_power,type="l",xaxt="n",yaxt="n",xlab="", ylab="Global Active Power")
axis(side=1,at=c(0,(length(Global_active_power)-1)/2,length(Global_active_power)),tck=-0.05,labels=c("Thu","Fri","Sat"))
axis(side=2,at=c(0,2,4,6),tck=-0.05,labels=c(0,2,4,6))

voltage<-power[['Voltage']]
plot(voltage,type="l",xaxt="n", yaxt="n", xlab="datetime", ylab="Voltage")
axis(side=1,at=c(0,(length(voltage)-1)/2,length(voltage)),tck=-0.05,labels=c("Thu","Fri","Sat"))
axis(side=2,at=c(234,236,238,240,242,244,246),tck=-0.05,labels=c(234,"",238,"",242,"",246))

sub1<-power[['Sub_metering_1']]
sub2<-power[['Sub_metering_2']]
sub3<-power[['Sub_metering_3']]
plot(sub1,type="l",xaxt="n",yaxt="n",xlab="", ylab="Energy Sub Metering")
lines(sub2,col="red")
lines(sub3,col="blue")
legend("topright",xjust=1,yjust=1,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c("solid","solid","solid"))
axis(side=1,at=c(0,(length(sub1)-1)/2,length(sub1)),tck=-0.05,labels=c("Thu","Fri","Sat"))
axis(side=2,at=c(0,10,20,30),tck=-0.05,labels=c(0,10,20,30))

Global_reactive_power<-power[['Global_reactive_power']]
plot(Global_reactive_power,type="l",xaxt="n",yaxt="n",xlab="datetime", ylab="Global Reactive Power")
axis(side=1,at=c(0,(length(Global_reactive_power)-1)/2,length(Global_reactive_power)),tck=-0.05,labels=c("Thu","Fri","Sat"))
axis(side=2,at=c(0,0.1,0.2,0.3,0.4,0.5),tck=-0.05,labels=c(0.0,0.1,0.2,0.3,0.4,0.5))

dev.off()