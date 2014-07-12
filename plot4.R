# read data from file
data <- read.table('./household_power_consumption.txt', 
		   sep=';', na.strings = '?',
		   colClasses='character');

#subset data
data1 <- subset(data, data$V1 %in% c('1/2/2007','2/2/2007'))

# coerce to date
data1$V1 <- as.Date(data1$V1,'%d/%m/%Y')

# coerce to time
data1$V2 <- strptime(paste(data1$V1,data1$V2), format='%Y-%m-%d %H:%M:%S')

# coerce columns  values to numeric
data1$V3 <- as.numeric(data1$V3)
data1$V4 <- as.numeric(data1$V4)
data1$V5 <- as.numeric(data1$V5)
data1$V7 <- as.numeric(data1$V7)
data1$V8 <- as.numeric(data1$V8)
data1$V9 <- as.numeric(data1$V9)

# plot and generate png file
png(filename="./plot4.png", height=480 ,width=480 )

par(mfrow = c(2,2))
Sys.setlocale("LC_TIME","English")

plot(data1$V2,data1$V3, type='l', xlab='', ylab ='Global Active Power') 

plot(data1$V2,data1$V5, type='l', xlab='datetime', ylab ='Voltage') 

plot(data1$V2, data1$V7, xlab='', type='l', col='black', ylab='Energy sub metering')
points(data1$V2, data1$V8, type='l', col='red')
points(data1$V2, data1$V9, type='l', col='blue')
legend("topright", lty= c(1,1,1), bty='n', pch = c(NA, NA, NA) , col=c('black','red','blue'), legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) 

plot(data1$V2,data1$V4, type='l', xlab='datetime', ylab ='Global_reactive_power') 

# close device graph
dev.off()
