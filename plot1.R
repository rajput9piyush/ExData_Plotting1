if(!exists("requiredPowConsData")){
      library(lubridate)
      pc <- read.delim("household_power_consumption.txt", sep = ";", na.strings = "?")
      pc$Date <- dmy(pc$Date)
      pc$Time <- hms(pc$Time)
      requiredPowConsData <- na.omit(pc[pc$Date %in% c(ymd("2007-02-01", ymd("2007-02-02"))), ])
      rm(pc)
}
png("plot1.png", width = 504, height = 504)
par(bg = NA)
hist(requiredPowConsData$Global_active_power, col = "red", 
     main = "Global Active Power", xlab = "Global Active Power (kiloWatts)")
dev.off()