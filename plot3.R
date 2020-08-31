if(!exists("requiredPowConsData")){
      library(lubridate)
      pc <- read.delim("household_power_consumption.txt", sep = ";", 
                       na.strings = "?")
      pc$Date <- dmy(pc$Date)
      pc$Time <- hms(pc$Time)
      requiredPowConsData <- na.omit(pc[pc$Date %in% 
                              c(ymd("2007-02-01", ymd("2007-02-02"))), ])
      rm(pc)
}
png("figure/plot3.png", width = 504, height = 504)
par(bg = NA)
plot(requiredPowConsData$Sub_metering_1, type = "l", 
     ylab = "Energry sub metering", xlab = "", xaxt = "n", col = "black")
axis(1, at = c(0, length(requiredPowConsData$Global_active_power)/2, 
               length(requiredPowConsData$Global_active_power)), 
     labels = c("Thu", "Fri", "Sat"))
points(requiredPowConsData$Sub_metering_2, type = "l", col = "red")
points(requiredPowConsData$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()