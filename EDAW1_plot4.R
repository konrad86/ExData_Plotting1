##household_power_consumption = hpc

hpc <- read.csv("C:/Users/kmulrennan/Desktop/Data Science/Exploratory Data Analysis/Week 1/exdata-data-household_power_consumption/household_power_consumption.txt", sep=";", na.strings = "?")


hpcsub <- hpc[hpc$Date %in% c("1/2/2007","2/2/2007") ,]

##set date and time to character string format
hpc_date_time <- strptime(paste(hpcsub$Date, hpcsub$Time, sep = " "), 
                          format = "%d/%m/%Y %H:%M:%S")

##Global Active Power = gap
gap <- as.numeric(hpcsub$Global_active_power, na.rm=TRUE)

##Global Reactive Power = grp
grp <- as.numeric(hpcsub$Global_reactive_power, na.rm=TRUE)

##sm = Sub_metering
sm1 <- as.numeric(hpcsub$Sub_metering_1, na.rm=TRUE)
sm2 <- as.numeric(hpcsub$Sub_metering_2, na.rm=TRUE)
sm3 <- as.numeric(hpcsub$Sub_metering_3, na.rm=TRUE)

##vol = Voltage
vol <- as.numeric(hpcsub$Voltage, na.rm=TRUE)

png("plot4.png", width=480, height=480)

##set out order and areas which plots are displayed
par(mfrow = c(2, 2))

##top left
plot(hpc_date_time, gap, type = "l", xlab = " ", ylab = "Global Active Power")

##top right
plot(hpc_date_time, vol, type = "l", xlab = "datetime", ylab = "Voltage")

##bottom left
plot(hpc_date_time, sm1, type = "l", xlab = " ", ylab = "Energy Submetering")
lines(hpc_date_time, sm2, col = "red")
lines(hpc_date_time, sm3, col = "blue")
legend("topright", col = c("black", "blue", "red"), lty = 1, lwd = 1,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       bty = "n")

##bottom right
plot(hpc_date_time, grp, type = "l", xlab = "datetime", ylab = "Global_reactive_power")


dev.off()
