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
data$Datetime <- as.POSIXct(data$Datetime)

# Plot 4
png(file = "plot4.png", width = 480, height = 480)
par(mfrow = c(2,2), mar = c(4,4,2,1))
with(data, {
   plot(Global_active_power ~ Datetime,
        type = "l",
        xlab = "",
        ylab = "Global Active Power")
   plot(Voltage ~ Datetime,
        type = "l",
        xlab = "datetime",
        ylab = "Voltage")
   plot(Sub_metering_1 ~ Datetime,
        type = "l",
        xlab = "",
        ylab = "Energy sub metering")
   lines(Sub_metering_2 ~ Datetime, 
         col = 'Red')
   lines(Sub_metering_3 ~ Datetime, 
         col = 'Blue')  
   legend("topright", 
          col = c("black", "red", "blue"),
          lty = 1,
          lwd = 2,
          legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
   plot(Global_reactive_power ~ Datetime,
        type = "l",
        xlab = "datetime",
        ylab = "Global_reactive_power")
})
dev.off()