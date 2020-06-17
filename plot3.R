library(lubridate)

#inputs data
powerz <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
#uses only required days
powerz <- powerz[powerz$Date=="1/2/2007" | powerz$Date=="2/2/2007",]

#vector to store time
timez <- POSIXct(0)

#combines and stores the date and time for each entry in 'timez'
for(i in 1:2880) {
  timez[i] <- dmy_hms(paste(powerz[i,1],powerz[i,2]))
}







#plot with sub metering 1
plot(timez, powerz$Sub_metering_1, type="l", xlab = "", ylab = "Energy sub metering")

#add a red line for sub metering 2
lines(timez, powerz$Sub_metering_2, type="l", col="red")

#and a blue one for sub metering 3
lines(timez, powerz$Sub_metering_3, type="l", col="blue")

#finally, we add the legend
legend("topright", legend=names(powerz)[7:9], col=c("black","red", "blue"), lty=rep(1,3), inset=c(0.12,0), bty="n", cex = 0.85)







