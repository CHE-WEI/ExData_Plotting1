setwd("Z:/PGM")
Sys.setlocale("LC_TIME", "English")

initial <- read.table("z:/household_power_consumption.txt" ,
                  header = 1,sep=";",nrows = 100, stringsAsFactors=0)  
classes <- sapply(initial, class)  # get column name
tabAll <- read.table("z:/household_power_consumption.txt",  
                     colClasses = classes, na.strings = "?", 
                     header = 1,sep=";", stringsAsFactors=0)


#tabAll<-transform(tabAll,Date=as.Date(Date, "%d/%m/%Y") )
time_filter<-
  with(tabAll,(Date=="1/2/2007"|Date=="2/2/2007"))
tabAll2<-tabAll[time_filter,]

tabAll2$DateTime<-with(tabAll2,
    strptime(paste(Date,Time),"%d/%m/%Y %H:%M:%S"))
# head(tabAll2)

#Plot 2 

png(filename = "plot2.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "transparent", res = NA, family = "", restoreConsole = TRUE,
    type = c("windows", "cairo", "cairo-png"))

plot(tabAll2$DateTime,
     tabAll2$Global_active_power, 
     type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)",
     main="")

dev.off()  





