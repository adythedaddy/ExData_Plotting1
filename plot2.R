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

#plot
plot(timez, powerz$Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)")
