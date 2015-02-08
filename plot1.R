temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp,method="curl")
data <- read.table(unz(temp,"household_power_consumption.txt"),header=TRUE,sep=";",na.strings="?",quote="")
data2 <- data[data$Date == "01/02/2007"|data$Date == "02/02/2007",]
data2$Date <- strptime(data2$Date,"%d/%m/%Y")
png("plot1.png",width=480,height=480)
hist(data2$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()
unlink(temp)