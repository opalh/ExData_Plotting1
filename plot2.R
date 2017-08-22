library(dplyr)

if(!file.exists("E:/R/Exploratory Data Analysis/1/assiment")){dir.create("E:/R/Exploratory Data Analysis/1/assiment")}
url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url,"E:/R/Exploratory Data Analysis/1/assiment/dataset.zip") 
unzip("E:/R/Exploratory Data Analysis/1/assiment/dataset.zip", exdir = "E:/R/Exploratory Data Analysis/1/assiment")


alldata <- read.table("E:/R/Exploratory Data Analysis/1/assiment/household_power_consumption.txt",header=TRUE, na.strings="?", sep=";")
data<-filter(alldata, Date == "1/2/2007"| Date=="2/2/2007")
str(data)

data$Date <- as.Date(data$Date, format="%d/%m/%Y")
dateTime <- paste(data$Date, data$Time, sep = " ")

data$DateTime<-strptime(dateTime,format="%Y-%m-%d %H:%M:%S")
head(data$DateTime)

plot(data$DateTime,data$Global_active_power,type = "l",ylab = "Global Active Power (kilowatts)",xlab="")

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()