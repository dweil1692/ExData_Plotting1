#Creates line plot of three different metering values, color codes them accordingly,
#and generated a legend in the upper right corner of the plot.
plot3 = function() {
  data = read.table("household_power_consumption.txt", header = TRUE, sep = ";")
  #The next four lines take the Date and Time columns and concatenates them into a single
  #column of the date/time R class.
  data$Datetime = strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
  dates = as.character(data$Date)
  conv = as.Date(dates, "%d/%m/%Y")
  data$Date = conv
  #Subsets the origonal date file so we're only looking a the dates of interest.
  sbst = subset(data, data$Date %in% as.Date(c("2007-02-01", "2007-02-02")))
  #The next three lines convert each metering column from factor to numeric class.
  meter1 = as.numeric(as.character(sbst$Sub_metering_1))
  meter2 = as.numeric(as.character(sbst$Sub_metering_2))
  meter3 = as.numeric(as.character(sbst$Sub_metering_3))
  png("plot3.png")
  plot(x = sbst$Datetime, y = meter1, type = "l", xlab = "", ylab = "Energy sub metering")
  points(sbst$Datetime, meter2, type = "l", xlab = "", ylab = "Energy sub metering", col = "red")
  points(sbst$Datetime, meter3, type = "l", xlab = "", ylab = "Energy sub metering", col = "blue")
  legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", 
                                                                          "Sub_metering_2", "Sub_metering_3"))
  dev.off()
}