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

##plotting Global_active_power vs timesecs (which is the new variable %d/%m/%Y %H:%M:%S )
##  PLESE NOTE,   THE X AXIS LABEL IS IN ITALIAN, GIO = THU, VEN = FRI, SAB = SAT
plot(dt_PowerConDate$timesecs,dt_PowerConDate$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)");
dev.copy(png, file="plot2.png", width=480, height=480);
dev.off();