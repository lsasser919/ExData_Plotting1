### Exploratory Data Analysis Course

### Utilize the electric power consumption dataset forked from
### https://github.com/rdpeng/ExData_Plotting1. 
### Codebook information:
# Date: Date in format dd/mm/yyyy
# Time: time in format hh:mm:ss
# Global_active_power: household global minute-averaged active power (in kilowatt)
# Global_reactive_power: household global minute-averaged reactive power (in kilowatt)
# Voltage: minute-averaged voltage (in volt)
# Global_intensity: household global minute-averaged current intensity (in ampere)
# Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). 
  # It corresponds to the kitchen, containing mainly a dishwasher, an oven and 
  # a microwave (hot plates are not electric but gas powered).
# Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). 
  # It corresponds to the laundry room, containing a washing-machine, a 
  # tumble-drier, a refrigerator and a light.
# Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). 
  # It corresponds to an electric water-heater and an air-conditioner.

### Set working directory
setwd("C:/Users/sassle03/Desktop/Coursera/Data Science Specialization/Exploratory Data Analysis")

### Read data into R
household_power_consumption <- read.csv("household_power_consumption.txt", sep=";")

### Keep only dates of interest (2007-02-01 and 2007-02-02)
power <- subset(household_power_consumption, Date == "1/2/2007" | Date == "2/2/2007")

### Sub metering info got imported as character, change to numeric
power$Sub_metering_1 <- as.numeric(as.character(power$Sub_metering_1))
power$Sub_metering_2 <- as.numeric(as.character(power$Sub_metering_2))
power$Sub_metering_3 <- as.numeric(as.character(power$Sub_metering_3))

### Desired plot has an x axis as Thursday, Friday, Saturday. Create a new column
### with the date time information
library(lubridate)
power$daytime <- strptime(paste(power$Date, power$Time), "%d/%m/%Y %H:%M:%S")

### Plot the date against global active power
plot3 <- plot(power$daytime, power$Sub_metering_1, type = "l",
              xlab = "",
              ylab = "Energy Sub metering",
              )
        legend("topright", col = c("black", "red", "blue"), 
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
               lty =1)
        lines(power$daytime, power$Sub_metering_2, col = "red")
        lines(power$daytime, power$Sub_metering_3, col = "blue")

### Use the export option in the plot menu to save the plot as a png file
### with a width of 480 pixels and a height of 480 pixels.



