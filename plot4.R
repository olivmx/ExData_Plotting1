#plot 4 code


1. READ THE CODE AND STRIP ALL LINES NOT USED

setwd('C:/TestR/ExploratoryCoursera/Project1')

#1.1 read file into dataframe named original and make sure it has data with the head command
original <- data.frame(read.table('household_power_consumption.txt', header=TRUE, sep=";", dec=".", na.strings="?"))
original$Date <- as.Date(original$Date , format="%d/%m/%Y")
head (original$Date)

#1.2 subset original dataframe into workingSet with only selected dates range and make 
# sure it has the correct dates.
workingSet<- subset(original, 
                    original$Date >= as.Date('2007-02-01') & 
                         original$Date <= as.Date('2007-02-02'))
dim(workingSet)
#1.3 remove original dataframe to free memory
rm(original)


# 2. adjust data so time is ordered
workingSet$Time[1]
strptime(workingSet$Time[1], format="%H:%M:%S")
dayHrMinNumeric<-
     (as.numeric(substr(workingSet$Date,start=9, stop=10))-1)*24+
     as.numeric(substr(workingSet$Time, start=1, stop=2))+as.numeric(substr(workingSet$Time, start=4, stop=5))/60
#3. construct plot multiple rows and columns

#openfile
png (filename="plot4.png", width=480, height=480)

par(mfrow = c(2, 2)) # 2 x 2 pictures on one plot
par(cex=0.70)

# row 1,col1 plot
plot(dayHrMinNumeric, workingSet$Global_active_power, type="l", ylab="Global Active Power" , xlab="", xaxt = "n")
axis (1, at=c(0,24,48), labels=c("Thu","Fri","Sat"))

# row 1,col2 plot
plot(dayHrMinNumeric, workingSet$Voltage, type="l", ylab="Voltage" , xlab="datetime", xaxt = "n")
axis (1, at=c(0,24,48), labels=c("Thu","Fri","Sat"))

# row 2,col1 plot
plot(dayHrMinNumeric, workingSet$Sub_metering_1, type="l", col="black", 
     ylab="Energy sub Metering", xlab="", xaxt="n" )
lines(dayHrMinNumeric, workingSet$Sub_metering_2, type="l", col="red")
lines(dayHrMinNumeric, workingSet$Sub_metering_3, type="l", col="blue")
axis (1, at=c(0,24,48), labels=c("Thu","Fri","Sat"))
legend ("topright", lwd="1", 
        col=c("black","red","blue"),
        legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3") )

# row 2,col2 plot
plot(dayHrMinNumeric, workingSet$Global_reactive_power, type="l", ylab="Global_reactive_power" , xlab="datetime", xaxt = "n")
axis (1, at=c(0,24,48), labels=c("Thu","Fri","Sat"))
axis (2, at=c(seq(from=0.1,to=0.5,length.out=5)), labels=c(seq(from=0.1,to=0.5,length.out=5)) )




#close file
dev.off()
