#### This code is for Plot 2 of project 1 for the Coursera course "Exploratory Data Analysis"
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

# Convert columns to numeric
for(i in c(3:9)) {dataset[,i] <- as.numeric(as.character(dataset[,i]))}

# Create Date_Time variable
dataset$Date_Time <- paste(dataset$Date, dataset$Time)

# Convert Date_Time variable to proper format
dataset$Date_Time <- strptime(dataset$Date_Time, format="%Y-%m-%d %H:%M:%S")
class(dataset$Date_Time)

#Plot 2
png(file="Plot2.png",width=480,height=480)

plot(dataset$Date_Time,dataset$Global_active_power,xaxt=NULL,xlab="",ylab="Global Active Power (kilowatts)",type="n")
lines(dataset$Date_Time,dataset$Global_active_power,type="S")


# type = "n" builds plots without points
# xaxt = NULL suppresses x axis
# xlab = "" removes the label from the x axis
# otherwise, the axis is the name of the x variable, which is date_time

dev.off()


