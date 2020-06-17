library(lubridate)

#inputs data
powerz <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
#uses only required days
powerz <- powerz[powerz$Date=="1/2/2007" | powerz$Date=="2/2/2007",]

#vector to store time
datetime <- POSIXct(0)

#combines and stores the date and time for each entry in 'datetime'
for(i in 1:2880) {
  datetime[i] <- dmy_hms(paste(powerz[i,1],powerz[i,2]))
}

#set parameters to accommodate 4 plots

par(mfcol=c(2,2),mar=c(4,4,2,2))

#top left plot uses code from plot2
plot(timez, powerz$Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)")

#bottom left plot uses code from plot3
plot(timez, powerz$Sub_metering_1, type="l", xlab = "", ylab = "Energy sub metering")
lines(timez, powerz$Sub_metering_2, type="l", col="red")
lines(timez, powerz$Sub_metering_3, type="l", col="blue")
legend("topright", legend=names(powerz)[7:9], col=c("black","red", "blue"), lty=rep(1,3), inset=c(0.19,0), bty="n", cex = 0.7)


#top right plot: Voltage against datetime
with(powerz,plot(datetime,Voltage, type = "l"))

#bottom right plot: Global_reactive_power against datetime
with(powerz,plot(datetime, Global_reactive_power, type = "l"))


