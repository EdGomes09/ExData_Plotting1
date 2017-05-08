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

#Third Plot
png("plot3.png", height=480, width=480)
with(ECP,{
plot(Date_Time, Sub_metering_1, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
  lines(Date_Time,Sub_metering_2,col="red")
  lines(Date_Time,Sub_metering_3,col="blue")})
legend("topright", c("Sub_met_1", "Sub_met_2", "Sub_met_3"), lty=1, lwd=3.5, col=c("black", "red", "blue"))
dev.off()
