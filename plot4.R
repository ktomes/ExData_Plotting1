# R Script file for plot4
# Sources used: 
# Lecture notes/Discussion Forums,'Getting and Cleaning Data',John Hopkins University (Coursera)
# Lecture notes/Discussion Forums,'Exploratory Data Analysis',John Hopkins University (Coursera)
# R Graphs Cookbook, Hrishi V. Mittal, Packt Publishing

# set working directory
setwd("/Users/tomesw1/project1")

# get first row of household power data
houseHold_data <-read.table("household_power_consumption.txt", header = T, sep = ";", nrows = 1)

# save the column names
col_names<-colnames(houseHold_data)  

# read in data, skip rows up to 2007-02-01, read next 2879 rows to grab thru 2007-02-02
# use col.names = colnames to add column names back (you lose original names if you don't)
houseHold_data <-read.table("household_power_consumption.txt", header = T, sep = ";", 
                             col.names = col_names, skip = 66637, nrows = 2879, na.strings="?")

# convert $Date from factor to class Date
houseHold_data$Date <- as.Date(houseHold_data$Date, format="%d/%m/%Y")

# Date-time conversion
houseHold_data$Date_Time <-as.POSIXct(paste(houseHold_data$Date,houseHold_data$Time),
                                      format="%Y-%m-%d %H:%M:%S")

# use png function with w x h of 480, bg = white
png(filename = "plot4.png", width = 480, height = 480, bg = "white")

# set the par function to draw by column 2 x 2
par(mfcol=c(2,2))

# Plot #1
plot(houseHold_data$Date_Time, houseHold_data$Global_active_power,
     xlab="",ylab="Global active power (kilowatts)", type="l")

# Plot #2
plot(houseHold_data$Date_Time, houseHold_data$Sub_metering_1,
     xlab="", ylab="Energy Sub Metering", type="l", title="")

lines(houseHold_data$Date_Time, houseHold_data$Sub_metering_2, col="red")
lines(houseHold_data$Date_Time, houseHold_data$Sub_metering_3, col="blue")
legend("topright",
       c("Sub Metering 1", "Sub Metering 2", "Sub Metering 3"),
       lty=c(1,1,1), # lines for the legend
       lwd=c(2.0,2.0,2.0),
       col=c("black", "blue","red"))

# Plot #3
plot(houseHold_data$Date_Time, houseHold_data$Voltage,
     xlab="datetime", ylab="Voltage", type="l")

# Plot #4
plot(houseHold_data$Date_Time, houseHold_data$Global_reactive_power, xlab="datetime",
     ylab="Global Reactive Power", type="l")

dev.off()