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

# Plot 1
png(file = "plot1.png", width = 480, height = 480)
hist(data$Global_active_power, 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)",
     xaxp = c(0, 6, 3),
     col = "red",
     xlim = c(0, 6),
     ylim = c(0, 1200))
dev.off()