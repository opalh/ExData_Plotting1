library(dplyr)

if(!file.exists("E:/R/Exploratory Data Analysis/1/assiment")){dir.create("E:/R/Exploratory Data Analysis/1/assiment")}
url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url,"E:/R/Exploratory Data Analysis/1/assiment/dataset.zip") 
unzip("E:/R/Exploratory Data Analysis/1/assiment/dataset.zip", exdir = "E:/R/Exploratory Data Analysis/1/assiment")


alldata <- read.table("E:/R/Exploratory Data Analysis/1/assiment/household_power_consumption.txt",header=TRUE, na.strings="?", sep=";")
data<-filter(alldata, Date == "1/2/2007"| Date=="2/2/2007")
str(data)

hist(data$Global_active_power,xlab = "Global Active Power (kilowatts)",main="Global Active Power",col = "red")

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()


