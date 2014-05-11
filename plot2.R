# R Script file for plot2
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
# use col.names = colnames to add column names back (you lose original col names if you don't)
houseHold_data <-read.table("household_power_consumption.txt", header = T, sep = ";", 
                             col.names = col_names, skip = 66637, nrows = 2879, na.strings="?")

# convert $Date from factor to class Date
houseHold_data$Date <- as.Date(houseHold_data$Date, format="%d/%m/%Y")

# Date-time conversion
houseHold_data$Date_Time <-as.POSIXct(paste(houseHold_data$Date,houseHold_data$Time),
                                      format="%Y-%m-%d %H:%M:%S")

# use png function with w x h of 480, bg = white
png(filename="plot2.png",width=480,height=480, bg = "white")
plot(houseHold_data$Date_Time,houseHold_data$Global_active_power,
     type="l", # type is line
     xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
