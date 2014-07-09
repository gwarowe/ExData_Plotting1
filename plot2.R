# Check if data for Feb 1 & 2 has already been extracted, to save time
if (!exists("feb0102")) {
  if (!file.exists("Feb0102.csv")) {  # if not, run code to extract data
    source("HousePlots.R")
  } else {
    feb0102 <- read.csv("Feb0102.csv")
  }
}

plot(feb0102$DateTime, feb0102$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power (kilowatts)")

dev.copy(png, file = "plot2.png")
dev.off()