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
