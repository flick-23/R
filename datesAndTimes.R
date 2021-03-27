#Dates are represented by Date class
# Times are represennted by the POSIXct or the POSIXlt class
#Dates are stored internally as the number of days since 1970-01-01
#Times are stored internally as the number of seconds since 1970-01-01

x<-as.Date("1970-01-01")
print(x)        #returns something like a string, but it actually is the date
#Dates are stored as objects of Date class

#TIMES IN R
#POSIXct is a very large integer under the hood; it uses a useful class when you want
#       to store times in something like data frams
#POSIXlt is a list underneath and it stores a bunch of other useful information like the
#       day of the week, day of Year, month, day of month

#Functions that work on dates and times
#weekdays: give day of the week
#months : give the month name
#quarters:give the quarter number("Q1","Q2","Q3" or "Q4")


#Times can be coerced from a character string using the as.POSIXlt or as.POSIXct

x<-Sys.time()   #returns current YYYY-MM-DD and then HH:MM:SS TimeZone
p<-as.POSIXlt(x) #can convert to list using posixlt
#can view the elements in that list using the unclass prop
# print(names(unclass(p)))        
# [1] "sec"    "min"    "hour"   "mday"   "mon"    "year"   "wday"   "yday"  
# [9] "isdst"  "zone"   "gmtoff"
print(p$sec)    #returns current seconds

#We can also use the POSIXct format
x<-Sys.time()
print(unclass(x))
print(x$sec)    #operation is invalid for atomic vectors
p<-as.POSIXct(x)
print(p$sec)    #prints seconds

#strptime function- in case the dates are written in a different format
datestring<-c("January 10, 2012 10:40","December 9, 2011 9:10")
x<-strptime(datestring,"%B %d, %Y %H:%M")
print(x)
# %B -month
# %d -day
# %Y - year
# %H - hour
# %m - minute

#mathematical operations can also be performed on dates (==, <=) comparing dates


























