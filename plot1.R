#plot 1 code


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

#openfile
png (filename="plot1.png", width=480, height=480)

#create plot and format plot

hist(workingSet$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

#close file
dev.off()
 


