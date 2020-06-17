#inputs data
powerz <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
#uses only required days
powerz <- powerz[powerz$Date=="1/2/2007" | powerz$Date=="2/2/2007",]
#plots the histogram using the base plotting system
hist(as.numeric(powerz$Global_active_power),col="red",xlab="Global Active Power (kilowatts)", main="Global Active Power", freq=TRUE)

