#unzip("exdata-data-household_power_consumption.zip") #uncomment if the file is unzipe in your wd
require(data.table)
data <- suppressWarnings(fread("household_power_consumption.txt", sep=";"))
setkey(data,Date)
expl <- data[c("1/2/2007","2/2/2007")]
date.time <-paste(as.character(expl$Date),as.character(expl$Time), sep = " ")
date.time <- as.POSIXct(date.time, format ="%d/%m/%Y %H:%M:%S") 


png("plot1.png", width = 480, height = 480,units = "px", pointsize = 12, bg = "white")
hist(as.numeric(expl$Global_active_power), xlab = "Global Active Powe(kilowatts)", main = "Global Active Power", col = "red")
dev.off()

png("plot2.png", width = 480, height = 480,units = "px", pointsize = 12, bg = "white")
plot(date.time,expl$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)") 
dev.off()

png("plot3.png", width = 480, height = 480,units = "px", pointsize = 12, bg = "white")
plot(date.time,expl$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(date.time,expl$Sub_metering_2, type = "l", col = "red")
lines(date.time,expl$Sub_metering_3, type = "l", col = "blue") 
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black","red","blue"), lty = c(1,1,1))
dev.off()

png("plot4.png", width = 480, height = 480,units = "px", pointsize = 12, bg = "white")
par(mfrow=c(2,2))
plot(date.time,expl$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
plot(date.time,expl$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(date.time,expl$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(date.time,expl$Sub_metering_2, type = "l", col = "red")
lines(date.time,expl$Sub_metering_3, type = "l", col = "blue") 
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black","red","blue"), lty = c(1,1,1))
plot(date.time,expl$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global reactive power")
dev.off()
