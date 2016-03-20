##household_power_consumption = hpc

hpc <- read.csv("C:/Users/kmulrennan/Desktop/Data Science/Exploratory Data Analysis/Week 1/exdata-data-household_power_consumption/household_power_consumption.txt", sep=";", na.strings = "?")


hpcsub <- hpc[hpc$Date %in% c("1/2/2007","2/2/2007") ,]

##Global Active Power = gap
gap <- as.numeric(hpcsub$Global_active_power, na.rm=TRUE)

png("plot1.png", width=480, height=480)

hist(gap, col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")
dev.off()
