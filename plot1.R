# R Script file for plot1
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

# use png function with w x h of 480, bg = white
png(filename = "plot1.png", width = 480, height = 480, bg = "white")
hist(houseHold_data$Global_active_power,      # make a histogram
     xlab="Global Active Power (kilowatts)",  # X axis title
     main="Global Active Power", col = "red") # Plot Title, color red
dev.off()