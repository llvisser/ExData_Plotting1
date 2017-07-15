# Load data
path <- "C:/Users/Lindy/Dropbox/Promotion/Courses/2017_07_Coursera_Exploratory_Data_Analysis/week_1/Data/"
data <- read.delim(paste(path, "household_power_consumption.txt", sep = ""), header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")

# Subset data
data_subset <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

# Set "?" to NA
data_subset[data_subset == "?"] <- NA   

# Concert character to date
data_subset$Date <- as.Date(data_subset$Date, "%d/%m/%Y")

# create new variable for date and time and convert it to a datetime variable
datetime <- paste(as.Date(data_subset$Date), data_subset$Time)
data_subset$datetime <- as.POSIXct(datetime)

# Create plot 4
par(mfrow=c(2,2), mar=c(4,4,2,1))
with(data_subset, {
    plot(Global_active_power~datetime, type="l", 
         ylab="Global Active Power (kilowatts)", xlab="")
    plot(Voltage~datetime, type="l", 
         ylab="Voltage (volt)", xlab="datetime")
    plot(Sub_metering_1~datetime, type="l", 
         ylab="Global Active Power (kilowatts)", xlab="")
    lines(Sub_metering_2~datetime,col='Red')
    lines(Sub_metering_3~datetime,col='Blue')
    legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(Global_reactive_power~datetime, type="l", 
         ylab="Global Rective Power (kilowatts)",xlab="datetime")
})
par(mfrow=c(1,1))

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
