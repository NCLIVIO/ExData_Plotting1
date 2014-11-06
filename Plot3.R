#### This code is for Plot 3 of project 1 for the Coursera course "Exploratory Data Analysis"
#### Date: Nov, 2014
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

#Plot 3
png(file="Plot3.png",width=480,height=480)

plot(dataset$Date_Time,dataset$Sub_metering_1,xaxt=NULL,xlab="",ylab="Energy sub metering",type="n")

lines(dataset$Date_Time,dataset$Sub_metering_1,type="S")
lines(dataset$Date_Time,dataset$Sub_metering_2,type="S",col="red")
lines(dataset$Date_Time,dataset$Sub_metering_3,type="S",col="blue")

legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),lty=1,lwd=1)
dev.off()
