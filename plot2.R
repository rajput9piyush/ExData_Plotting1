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
png("plot2.png", width = 504, height = 504)
par(bg = NA)
plot(requiredPowConsData$Global_active_power, type = "l", 
     ylab = "Global Active Power (kiloWatts)", xlab = "", xaxt = "n")
axis(1, at = c(0, length(requiredPowConsData$Global_active_power)/2, 
               length(requiredPowConsData$Global_active_power)), 
                  labels = c("Thu", "Fri", "Sat"))
dev.off()