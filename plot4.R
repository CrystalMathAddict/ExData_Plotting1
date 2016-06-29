##Purpose is to create four separate plots, saved as
#png.

##Run step 0 if the text file is NOT in the working directory.

#0a. Make directory if not exists

dir.create(file.path(getwd(), "Week 1 Project"), showWarnings = FALSE)
setwd(file.path(getwd(), "Week 1 Project"))

#0b. Download File into working directory (uncomment if don't have data already)

# temp<-tempfile()
# download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp, mode="wb")
# unzip(temp, "household_power_consumption.txt")

### Actual code begins here #######

power <- read.table("household_power_consumption.txt", sep=";", 
                    header=T, na.strings = "?" )

##Concerned only with a 2-day period in February 2007.
#Let's use 1 and 2 Feb.
powerSub<-subset(power, Date == "1/2/2007" | Date == "2/2/2007")
rm(power)

###Plot 4 - 2x2 graphs
png(width = 480, height = 480, file = "Plot4.png")
par(mfrow = c(2,2), mar = c(4,4,1,1))

#First plot is same as plot 2 above
with(powerSub, plot(DateTime, Global_active_power, type = "l", 
                    xlab = "",
                    ylab = "Global Active Power (kilowatts)"))

#Second plot is datetime v. voltage
with(powerSub, plot(DateTime, Voltage, type = "l", 
                    xlab = "datetime",
                    ylab = "Voltage"))

#Third plot is same as plot 4 above.
with(powerSub, plot(DateTime, Sub_metering_1, type = "l", 
                    xlab = "",
                    ylab = "Energy sub metering",
                    col = "black"))
lines(powerSub$DateTime, powerSub$Sub_metering_2, col = "red", type = "l")
lines(powerSub$DateTime, powerSub$Sub_metering_3, col = "blue", type = "l")

legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col = c("black", "red", "blue"), lwd = 1, bty = "n")

#fourth plot is datetime v. gRp

with(powerSub, plot(DateTime, Global_reactive_power, type = "l", 
                    xlab = "datetime"))
dev.off()
