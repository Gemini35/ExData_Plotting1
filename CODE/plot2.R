library(data.table)
library(dplyr)
library(lubridate)


df<-fread("./data/household_power_consumption.txt") 


df.1<-mutate(df,date=as.Date(Date,"%d/%m/%Y"),glbl_act_pwr=(as.numeric(Global_active_power)))

df.fil<-filter(df.1,date>="2007-02-01" & date<="2007-02-02",!is.na(glbl_act_pwr))



date.z<-paste(df.fil$Date,df.fil$Time)
#strptime(date.x,"%d/%m/%Y %H:%M:%S")
#glimpse(df.fil)
date.z<-dmy_hms(date.z)
png(file = "plot2.png",width=480,height = 480)
plot(df.fil$glbl_act_pwr~date.z,type="l",
     xlab="",ylab="Global Active Power(kilowatts)")

dev.off()









