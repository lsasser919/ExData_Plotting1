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

### Change Date format to YYYY-MM-DD
household_power_consumption$Date <- format(as.Date(household_power_consumption$Date,
                                                   format = "%d/%m/%Y"), "%Y-%m-%d")

### Keep only dates of interest (2007-02-01 and 2007-02-02)
power <- subset(household_power_consumption, Date == "2007-02-01" | Date == "2007-02-02")

### Global Active Power (gap) histogram
power$Global_active_power <- as.numeric(as.character(power$Global_active_power))

gap <- hist(power$Global_active_power, main = "Global Active Power",
            xlab = "Global Active Power (kilowatts)", col = "red")

### Use the export option in the plot menu to save the plot as a png file
### with a width of 480 pixels and a height of 480 pixels.



