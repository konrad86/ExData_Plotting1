##household_power_consumption = hpc

hpc <- read.csv("C:/Users/kmulrennan/Desktop/Data Science/Exploratory Data Analysis/Week 1/exdata-data-household_power_consumption/household_power_consumption.txt", sep=";", na.strings = "?")


hpcsub <- hpc[hpc$Date %in% c("1/2/2007","2/2/2007") ,]

##set date and time to character string format
hpc_date_time <- strptime(paste(hpcsub$Date, hpcsub$Time, sep = " "), 
                          format = "%d/%m/%Y %H:%M:%S")

##Global Active Power = gap
gap <- as.numeric(hpcsub$Global_active_power, na.rm=TRUE)

png("plot2.png", width=480, height=480)

plot(hpc_date_time, gap, type = "l", xlab = " ", ylab = "Global Active Power (kilowatts)")


dev.off()
