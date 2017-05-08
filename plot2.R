###Download and unzip The Electric power consumption Dataset
ArqEPC<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
destEPC<-"~/EPC.zip"
download.file(ArqEPC,destEPC, mode = "wb")
ECPText<-unzip(destEPC)

ECP_full<-read.csv(ECPText,header = TRUE, sep = ";", na.strings="?")

#Subsetting Data from the dates 2007-02-01 and 2007-02-02
ECP<-ECP_full[ECP_full$Date %in% c("1/2/2007","2/2/2007") ,]

#convert the Date and TIme
ECP$Date_Time<-strptime(paste(ECP$Date, ECP$Time, sep=" "), "%d/%m/%Y %H:%M:%OS")

#Second Plot
plot(ECP$Date_Time,ECP$Global_active_power,type = "l", xlab="", ylab="Global Active Power (kilowatts)")

## Saving to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()

