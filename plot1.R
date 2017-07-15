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

# Create plot 1
hist(as.numeric(data_subset$Global_active_power), main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
