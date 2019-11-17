library(data.table)
library(dplyr)
library(lubridate)
df<-fread("./data/household_power_consumption.txt") 


df.1<-mutate(df,date=as.Date(Date,"%d/%m/%Y"),glbl_act_pwr=(as.numeric(Global_active_power)))



df.fil<-filter(df.1,date>="2007-02-01" & date<="2007-02-02",!is.na(glbl_act_pwr))

df.fil<-mutate(df.fil,Sub_metering_1=as.numeric(Sub_metering_1),
            Sub_metering_2=as.numeric(Sub_metering_2),
            Sub_metering_3=as.numeric(Sub_metering_3))



date.z<-paste(df.fil$Date,df.fil$Time)

date.z<-dmy_hms(date.z)
png(file = "plot3.png",width=480,height = 480)

with(df.fil, 
     plot(date.z,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering"))
with(df.fil,lines(date.z,Sub_metering_2,col="red"))
with(df.fil,lines(date.z,Sub_metering_3,col="blue"))
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1",
                                                              "Sub_metering_2","Sub_metering_3"),lty=1)



dev.off()