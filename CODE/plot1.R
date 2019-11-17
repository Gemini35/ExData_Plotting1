library(data.table)
library(dplyr)
df<-fread("./data/household_power_consumption.txt") 

## Mutate data for first plot


df.1<-mutate(df,date=as.Date(Date,"%d/%m/%Y"),glbl_act_pwr=(as.numeric(Global_active_power)))

df.fil<-filter(df.1,date>="2007-02-01" & date<="2007-02-02",!is.na(glbl_act_pwr))


png(file = "plot1.png",width=480,height = 480)

with(df.fil, hist(glbl_act_pwr,col="red",xlab = "Global Active Power (kilowatts)",main = "Global Active Power"))

#title(main = "Global Active Power")

dev.off()