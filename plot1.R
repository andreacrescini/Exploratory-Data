##Download and unzip to local path
URL      <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip";
destfile <- "C:\\Users\\Andrea\\Desktop\\coursera\\ExploratoryAnalysis\\zipfile.zip";
download.file(URL, destfile);
PowerCon_Temp <- unzip(destfile);
PowerCon <- read.table(PowerCon_Temp, header=TRUE, sep=";")
View(PowerCon);

##data framing of dt_PowerConDate into the subset dt_PC_num, and some checks of the data types 
dt_PowerCon <- data.frame(PowerCon);
dt_PowerConDate<-subset(dt_PowerCon, Date == "2/2/2007" | Date == "1/2/2007");
is.numeric(dt_PowerConDate$Global_active_power);
as.numeric(dt_PowerConDate$Global_active_power);
is.numeric(as.numeric(as.character(dt_PowerConDate$Global_active_power)));
dt_PC_num <- as.numeric(as.character(dt_PowerConDate$Global_active_power));

##instogram of dt_PC_num (the subset above), which has been transformed in numeric, and then plot on file. 
hist(dt_PC_num,main = paste ("Global Active Power"),col="red", xlab="Global Active Power (kilowatts)");
dev.copy(png, file="plot1.png", width=480, height=480);
dev.off();