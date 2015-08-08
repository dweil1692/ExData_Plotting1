#Plots a histogram of the frequency of global active power usage and saves as a.png
#in the user's working directory.
plot1 = function() {
  data = read.table("household_power_consumption.txt", header = TRUE, sep = ";")
  dates = as.character(data$Date)
  conv = as.Date(dates, "%d/%m/%Y")
  data$Date = conv #replaces the Date column with values of the R Date class.
  actpwr = as.character(data$Global_active_power)
  actpwr = as.numeric(actpwr) #converts the Global active power from factor to numeric.
  data$Global_active_power = actpwr #replaces column with numeric values.
  png("plot1.png")
  sbst = subset(data, data$Date %in% as.Date(c("2007-02-01", "2007-02-02")))
  hist(as.numeric(sbst$Global_active_power), main = "Global Active Power", xlab = "
       Global Active Power (kilowatts)", col = "red", cex.axis = 0.75)
  dev.off()
}