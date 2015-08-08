#This function generates all four of the previous plots and places them in the same window.
#This is then saved as a .png file in the user's working directory.
plot4 = function() {
  data = read.table("household_power_consumption.txt", header = TRUE, sep = ";")
  #The next four lines take the Date and Time columns and concatenates them into a single
  #column of the date/time R class.
  data$Datetime = strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
  dates = as.character(data$Date)
  conv = as.Date(dates, "%d/%m/%Y")
  data$Date = conv
  #Subsets the origonal date file so we're only looking a the dates of interest.
  sbst = subset(data, data$Date %in% as.Date(c("2007-02-01", "2007-02-02")))
  #The next seven lines convert all columns to be used in the plotting to class numeric.
  pwr = as.character(sbst$Global_active_power)
  pwr = as.numeric(pwr)
  meter1 = as.numeric(as.character(sbst$Sub_metering_1))
  meter2 = as.numeric(as.character(sbst$Sub_metering_2))
  meter3 = as.numeric(as.character(sbst$Sub_metering_3))
  voltage = as.numeric(as.character(sbst$Voltage))
  react_pwr = as.numeric(as.character(sbst$Global_reactive_power))
  png("plot4.png")
  par(mfrow = c(2,2)) #creates a 2X2 plotting window for all four plots.
  plot(sbst$Datetime, pwr, type = "l", ylab = "Global Active Power", xlab = "")
  plot(sbst$Datetime, voltage, type = "l", ylab = "Voltage", xlab = "datetime")
  plot(x = sbst$Datetime, y = meter1, type = "l", xlab = "", ylab = "Energy sub metering")
  points(sbst$Datetime, meter2, type = "l", xlab = "", ylab = "Energy sub metering", col = "red")
  points(sbst$Datetime, meter3, type = "l", xlab = "", ylab = "Energy sub metering", col = "blue")
  legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", 
                                                                          "Sub_metering_2", "Sub_metering_3"), bty = "n",)
  plot(sbst$Datetime, react_pwr, type = "l", xlab = "datetime", 
       ylab = "Global_reactive_power", ylim = c(0, 0.5))
  dev.off()
}