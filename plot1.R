# Check if data for Feb 1 & 2 has already been extracted, to save time
if (!exists("feb0102")) {
  if (!file.exists("Feb0102.csv")) {  # if not, run code to extract data
    source("HousePlots.R")
  } else {
    feb0102 <- read.csv("Feb0102.csv")
  }
}

hist(feb0102$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.copy(png, file = "plot1.png")
dev.off()