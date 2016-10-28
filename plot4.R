#####################
# generate plot4.png
#####################
dataDirName <- "c:/Users/tom/Documents/DataScience/course 4/wk 1/project" # edit this path as desired
setwd(dataDirName)  # make it working directory
# if previously downloaded, skip the download
if( !file.exists("./household_power_consumption.txt") ) {
	# prepare to download file
	url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
	download.file( url, destfile="./household_power_consumption.zip", mode = "wb")
	# unzip the archive to current working directory;  files will be unzipped to folder "./UCI HAR Dataset"
	unzip("./household_power_consumption.zip", overwrite = T, exdir = getwd())
	# delete zip archive after it's been decompressed
	unlink("./household_power_consumption.zip", force = T)
}
# load data
# observations in date range of interest span rows 66638 to 69517
first <- 66638 # first observation line # for 2/1/2007
last <- 69517 # last observation line # for 2/2/2007
tbl <- read.table(file = "./household_power_consumption.txt", header=T, sep=";", nrows=(last-first+1), skip=first-2)
colnames(tbl) <- c("Date", "Time", "Global Active Power", "Global Reactive Power", "Voltage",
	"Global Intensity", "Sub Metering 1", "Sub Metering 2", "Sub Metering 3")
# verify that we have correct span of observations
head(tbl, 1)[ ,1:2]; tail(tbl, 1)[ ,1:2]
# change wd
setwd("./ExData_Plotting1")
# merge new variable `DT`, a concatenated, converted `Date` + `Time`
tbl$DT <- as.POSIXct(paste(as.Date(tbl$Date,format='%d/%m/%Y'), tbl$Time))
#
# generate plot4
png(filename = "plot4.png")
# remember default display parameters, then revise for best layout
prev <- par(mfrow=c(1,1), mar=c(5.1, 4.1, 4.1, 2.1))
par(mfrow=c(2,2), mar=c(2,4,2,2))
with(tbl, {
plot(`Global Active Power`~ DT, type="l", xlab="", ylab="Global Active Power (kilowatts)")
})
with(tbl, {
plot(Voltage ~ DT, type="l", xlab="date:time", ylab="Voltage")
})
with(tbl, {
plot(`Sub Metering 1` ~ DT, type="l", xlab="", ylab="Energy Sub Metering", col="black", lty=1, lwd=1)
lines(`Sub Metering 2` ~ DT, type="l", col="red", lty=1, lwd=1)
lines(`Sub Metering 3` ~ DT, type="l", col="blue", lty=1, lwd=1)
legend("topright", legend=names(tbl)[7:9], col = c("black", "red", "blue"), lty=1, lwd=2, bty="y")
})
with(tbl, {
plot(`Global Reactive Power` ~ DT, type="l", xlab="date:time", ylab="Global Reactive Power")
})
par(prev)  # reset display parameters
dev.off()