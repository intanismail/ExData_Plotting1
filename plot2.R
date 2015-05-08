# Loading the data
file <- file("household_power_consumption.txt")
data <- read.table(text = grep("^[1,2]/2/2007", readLines(file), value = TRUE),
                   col.names = c("Date", "Time", "Global_active_power",
                                 "Global_reactive_power", "Voltage", "Global_intensity",
                                 "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
                   sep = ";",
                   header = TRUE,
                   na.strings = "?")
data$Datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

# Plot 2
png(file = "plot2.png", width = 480, height = 480)
plot(data$Datetime,
     data$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.off()