##household_power_consumption = hpc

hpc <- read.csv("C:/Users/kmulrennan/Desktop/Data Science/Exploratory Data Analysis/Week 1/exdata-data-household_power_consumption/household_power_consumption.txt", sep=";", na.strings = "?")


hpcsub <- hpc[hpc$Date %in% c("1/2/2007","2/2/2007") ,]

##set date and time to character string format
hpc_date_time <- strptime(paste(hpcsub$Date, hpcsub$Time, sep = " "), 
                          format = "%d/%m/%Y %H:%M:%S")

##Global Active Power = gap
gap <- as.numeric(hpcsub$Global_active_power, na.rm=TRUE)

##sm = Sub_metering
sm1 <- as.numeric(hpcsub$Sub_metering_1, na.rm=TRUE)
sm2 <- as.numeric(hpcsub$Sub_metering_2, na.rm=TRUE)
sm3 <- as.numeric(hpcsub$Sub_metering_3, na.rm=TRUE)


png("plot3.png", width=480, height=480)

plot(hpc_date_time, sm1, type = "l", xlab = " ", ylab = "Energy Submetering")
lines(hpc_date_time, sm2, col = "red")
lines(hpc_date_time, sm3, col = "blue")
legend("topright", col = c("black", "blue", "red"), lty = 1, lwd = 1,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


dev.off()
