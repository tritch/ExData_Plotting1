dataDirName <- "c:/Users/tom/Documents/DataScience/course 4/wk 1/project" # edit this path as desired
setwd(dataDirName)  # make it working directory
# estimate file size in RAM
cat( "optimistic file size assumption (Mbyte):\n(2,075,259 rows) * (9 columns) * (8 bytes/entry) =", round(2075259 * 9 * 8 / 1e06))
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file( url, destfile="./household_power_consumption.zip", mode = "wb")
# unzip the archive to current working directory;  files will be unzipped to folder "./UCI HAR Dataset"
unzip("./household_power_consumption.zip", overwrite = T, exdir = getwd())
# delete zip archive after it's been decompressed
unlink("./household_power_consumption.zip", force = T)
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
# generate plot2
png(filename = "plot2.png")
with(tbl, plot(`Global Active Power`~ DT, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
dev.off()