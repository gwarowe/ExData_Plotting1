# Check if data for Feb 1 & 2 has already been extracted, to save time
if (!exists("feb0102")) {
  if (!file.exists("Feb0102.csv")) {  # if not, run code to extract data
    source("HousePlots.R")
  } else {
    feb0102 <- read.csv("Feb0102.csv")
  }
}
par(mfrow=c(2,2))
plot(feb0102$DateTime, feb0102$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power")

plot(feb0102$DateTime, feb0102$Voltage, type = "l",
     xlab = "datetime", ylab = "Voltage")


plot(feb0102$DateTime, feb0102$Sub_metering_1, type = "l",
     xlab = "", ylab = "Energy sub metering")
lines(feb0102$DateTime, feb0102$Sub_metering_2, col = "red")
lines(feb0102$DateTime, feb0102$Sub_metering_3, col = "blue")
legend(x = "topright", legend = c("Sub_metering_1", "Sub_metering_2",
                                  "Sub_metering_3"), 
       lty = c(1,1,1),
       col = c("black", "red", "blue"),
       cex = 0.7)

plot(feb0102$DateTime, feb0102$Global_reactive_power, type = "l",
     xlab = "datetime", ylab = "Global_reactive_power")

dev.copy(png, file = "plot4.png")
dev.off()