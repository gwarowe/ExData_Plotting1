# Read the first 5 lines to determine the class of each column
house <- read.table("household_power_consumption.txt", sep=";", 
                    header=TRUE, na.strings="?", nrows=5)
classes <- sapply(house, class)

# Read the data for real using classes to speed things up
house <- read.table("household_power_consumption.txt", sep=";", 
                    header=TRUE, colClasses=classes, na.strings="?")

# Convert the date and time to a single DateTime column and
# delete the original Date and Time columns
house$DateTime <- strptime(paste(house$Date,house$Time), 
                             format = "%d/%m/%Y %H:%M:%S")
drops <- c("Date", "Time")
house <- house[,!(names(house) %in% drops)]

# Find all rows with dates on Feb 1 and 2, 2007
feb0102 <- house[house$DateTime >= as.POSIXct("2007-02-01") & 
                   house$DateTime < as.POSIXct("2007-02-03"),]

# Save this to a file to avoid having to process the whole file again
write.csv(file = "Feb0102.csv", x = feb0102)