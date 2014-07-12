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


# coerce column to numeric
data1$V3 <- as.numeric(data1$V3)

# device graph and plot
png(filename="./plot1.png", height=480 ,width=480 )
hist(data1$V3,main=('Global Active Power'), xlab='Global Active Power (kilowatts)',col='red')

# close device
dev.off()
