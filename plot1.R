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

###This function is to not repeat the SAVE AS PNG call
SaveAsPng<-function(string){ 
 }

### Plot 1 - Histogram of Global Active Power
par(mfrow=c(1,1))
with(powerSub, hist(Global_active_power, 
                    ylab = "Frequency", xlab = "Global Active Power (kilowatts)",
                    main = "Global Active Power", col = "red"))

dev.print(png, file = "plot1.png", width = 480, height = 480)
dev.off()