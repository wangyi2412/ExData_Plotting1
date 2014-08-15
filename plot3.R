pow<-read.table("D:\\MOOC\\Data Science Seiry on Coursera\\exploratory\\Project 1\\household_power_consumption.txt", header=T, sep=";",na.strings="?",col.names=c("Date","Time","Global_active_power", "Global_reactive_power","Voltage","Global_intensity","Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
cond <- (pow$Date=="1/2/2007" | pow$Date=="2/2/2007" ) & !is.na(pow$Sub_metering_1) & !is.na(pow$Sub_metering_2) & !is.na(pow$Sub_metering_3) 
power<-pow[cond,]
sub1<-power['Sub_metering_1']
sub2<-power['Sub_metering_2']
sub3<-power['Sub_metering_3']


png("D:\\MOOC\\Data Science Seiry on Coursera\\exploratory\\Project 1\\plot3.png")
par(ps=11)
plot(sub1,type="l",xaxt="n",xlab="", ylab="Energy Sub Metering")
lines(sub2,col="red")
lines(sub3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c("solid","solid","solid"))
axis(side=1,at=c(0,(length(Global_active_power)-1)/2,length(Global_active_power)),tck=-0.05,labels=c("Thu","Fri","Sat"))

dev.off()