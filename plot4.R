##Download and unzip to local path
URL      <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip";
destfile <- "C:\\Users\\Andrea\\Desktop\\coursera\\ExploratoryAnalysis\\zipfile.zip";
download.file(URL, destfile);
PowerCon_Temp <- unzip(destfile);
PowerCon <- read.table(PowerCon_Temp, header=TRUE, sep=";")
View(PowerCon);

##data framing of dt_PowerConDate into the subset dt_PC_num 
dt_PowerCon <- data.frame(PowerCon);
dt_PowerConDate<-subset(dt_PowerCon, Date == "2/2/2007" | Date == "1/2/2007");
dt_PowerConDate$Date <- as.Date(dt_PowerConDate$Date, format="%d/%m/%Y");
dt_PowerConDate$Global_active_power <- as.numeric(as.character(dt_PowerConDate$Global_active_power));
dt_PowerConDate <- transform(dt_PowerConDate, timesecs=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S");

dt_PowerConDate$Sub_metering_1 <- as.numeric(as.character(dt_PowerConDate$Sub_metering_1));
dt_PowerConDate$Sub_metering_2 <- as.numeric(as.character(dt_PowerConDate$Sub_metering_2));
dt_PowerConDate$Sub_metering_3 <- as.numeric(as.character(dt_PowerConDate$Sub_metering_3));

## don't forget the voltage!!!
dt_PowerConDate$Voltage <- as.numeric(as.character(dt_PowerConDate$Voltage));


##plotting Sub_metering_1 2 and 3 vs timesecs (which is the new variable %d/%m/%Y %H:%M:%S )
##  PLESE NOTE,   THE X AXIS LABEL IS IN ITALIAN, GIO = THU, VEN = FRI, SAB = SAT

par(mfrow=c(2,2));  ##this is for put 4 plots in the same figure  
##PLOT 1
plot(dt_PowerConDate$timesecs,dt_PowerConDate$Global_active_power, type="l", xlab="", ylab="Global Active Power");
##PLOT 2
plot(dt_PowerConDate$timesecs,dt_PowerConDate$Voltage, type="l", xlab="datetime", ylab="Voltage");
##PLOT 3
plot(dt_PowerConDate$timesecs,dt_PowerConDate$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering");
lines(dt_PowerConDate$timesecs,dt_PowerConDate$Sub_metering_2,col="red");
lines(dt_PowerConDate$timesecs,dt_PowerConDate$Sub_metering_3,col="blue");
#PLOT 4
plot(dt_PowerConDate$timesecs,dt_PowerConDate$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power");

##the output
dev.copy(png, file="plot4.png", width=480, height=480);
dev.off();