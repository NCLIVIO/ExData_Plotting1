#### This code is for Plot 1 of project 1 for the Coursera course "Exploratory Data Analysis"
#### Date: Jan, 2015
#### Author: Natalia Clivio

#Load Data
consum<-read.table("C:/Users/NataliaA/Desktop/CourseaR/household_power_consumption.txt",
                 header=TRUE,sep=";",na.strings="?",dec=".",strip.white=TRUE)

class(consum$Date)
class(consum$Time)

# Change the format of Date variable
consum$Date <- as.Date(consum$Date, format="%d/%m/%Y")
class(consum$Date)

# Subset the data for the two dates of interest
dataset<-subset(consum,Date=="2007-02-01" | Date=="2007-02-02")

#Plot 1
png(file="Plot1.png",width=480,height=480)

hist(dataset$Global_active_power, col="red", main="Global Active Power",
     xlab="Global Active Power (kilowatts)")
dev.off()
