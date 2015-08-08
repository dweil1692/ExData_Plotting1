#Creates a line plot of global active power usage over a two day period and saves the 
#plot as a .png in the user's working directory.
plot2 = function() {
  data = read.table("household_power_consumption.txt", header = TRUE, sep = ";")
  #The next four lines take the Date and Time columns and concatenates them into a single
  #column of the date/time R class.
  data$Datetime = strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
  dates = as.character(data$Date)
  conv = as.Date(dates, "%d/%m/%Y")
  data$Date = conv
  #Subsets the origonal date file so we're only looking a the dates of interest.
  sbst = subset(data, data$Date %in% as.Date(c("2007-02-01", "2007-02-02")))
  pwr = as.character(sbst$Global_active_power) 
  pwr = as.numeric(pwr) #converts active power column to class numeric.
  png("plot2.png")
  plot(x = sbst$Datetime, y = pwr, type = 'l', xlab = "", ylab = "Global Active Power (kilowatts)")
  box()
  dev.off()
}