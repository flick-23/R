#READING AND WRITING TABLE DATA in R


#TO read TABULAR data
read.table()
#args of read.table
file()  #name of a file/connection
header  #logical indicating if a file has a header
sep #a string indicating how the cols are separated
colClasses  #a character vector indicating the class of each col in the dataset
nrows   #number of rows in dataset
comment.char  # a char string indicating the comment character (default is #)
skip  #the number of lines to skip from beginning
stringsAsFactors  #should character variables be coded as factors


read.csv()  #here the separater is comma, rest all is similar to read.table()

#To read lines of a text file
readLines

#for reading R CODE files (inverse of dump)
source()

#for reading R CODE files (inverse of dput)
dget

#for reading saved workspaces
load

#for reading single R objects in binary form
unserialize()


# Writing DATA - There are analogous functions for wiritng data
# write.table
# writeLines
# dump
# dput
# save
# serialize

#===============================================================================

#READING LARGE TABLES in R

# using colClasses arg can make read.table() run MUCH faster
# We need to know the class of each element in your data frame
# Not using colClasses will makes R to visit each dataelement and figure out its class

initial<-read.table("data.txt",nrows=10)
classes<-sapply(initial,class)
tabAllM<- read.table("data.txt",colClasses=classes)

#make sure your computer can handle the calculations for the data
# For a dataframe of 1,500,000 rows and 120 cols 
# Roughly
# 1,500,00 x 120 x 8 bytes/numeric
# = 1440000000 bytes
# = 1440000000 / 2^20 bytes/MB
# = 1.373.29 MB
# = 1.34 --> nearly 4 Gb is needed.
#================================================================================

#TEXTUAL FORMATS

#types ->
# dumping 
# dputing
#these preserve the metadata(sacrificing some readability)
y<- data.frame(a=1,b="a")
dput(y)
structure(lists(
  a=1,
  b=structure(1L, .Label="a",
              class = "factor")),
        .Names = c("a","b"), row.names = c(NA, -1L),
  class="data.frame")
dput(y,file="y.R")
new.y<-dget("y.R")

#Dumping R objects
x<-"foo"
y<-data.frame(a=1,b="a")
dump(c("x","y"),file="data.R")
rm(x,y)
source(data.R)

#===================================================================================
#INTERFACES to the outside world

#file -opens a connection to a file
#gzfile - opens a connection to compressed gzip (files that have gz extension)
#url - opens a connection to a webpage
#bzfile - opens a connection to a file compressed with bzip2 (files that have extension bz2)
# 
# str(file)
# function(description="", open="", blocking=TRUE,encoding=getOption("encoding"))
#desciption is the name of file
#open is a code indication
  # "r" read only
  # "w" writing (and initializing a new file)
  # "a" appending
  # "rb","wb","ab" reading writing or appending in binary mode(Windows)
#CONNECTIONS

con<-file("foo.txt","r")
data<- read.csv(con)
close(con)

#is same as 
data<-read.csv("foo.txt")

#Reading lines of text file

con<-gzfile("words.gz")
x<- readLines(con,10)
#Prints the 1st 10 lines of the gz file

#can also be used to read lines of webpage
con<-url("http://www.google.com")
x<-readLines(con)
head(x)#prints the lines of webpage

#=======================================================================================

#SUBSETTING Obj's in R

# [ - always returna an obj of the same class as original, can be used to select more than one 
#     element (ONE Exception)
# [[ - is used to extract elements of a list or a data frame; it can only be used to extract
#     a single element and the class of a returned object will not necessarily be a list or a data frame
# $ is used to extract elements of a list or data frame by name; semantics are simillar to hat of [[.

#examples of subsetting

#subsetting using numeric index
x<-c("a","b","c","d","e","b")
print(x[1]) #returns a 
print(x[1:4]) #returns a b c d

#subsetting using logical index
print(x[x>"b"]) #prints c d e

u<- x>"a"   #u stores b c d e 
#=======================================================================================

#SUBSETTING LISTS
x<-list(foo=1:4, bar=0.5)
print(x[1]) #prints 1,2,3,4 (that is foo)
print(x[[1]]) #prints 1 ( that is 1st element of 1
print(x[[3]]) #prints 3

print(x$bar)  #0.5 #prints the element associated with 'bar'
print(x[["bar"]]) #gives the element with name bar
print(x["bar"]) #returns the list having name bar

#to extract multiple elements of list
x<-list(foo=1:4, bar=0.6, baz="hello")
x[c(1,3)] #returns foo and bar

# [[ can be used with computed indices ; $ can only be used with literal names
x<-list(foo=1:4, bar=0.6, baz="hello")
name<-"foo"
print(x[[name]]) #computed index for "foo" #prints 1 2 3 4 
print(x$name)  #element 'name' does not exist    #prints NULL


# [[ can take an integer sequence

x<-list(a=list(10,12,14),b=c(3.14,2.81))
print(x[[c(1,3)]])  #prints 14
print(x[[c(2,2)]])  #prints 2.81

#======================================================================-==========
#SUBSETTING MATRICES

x<-matrix(1:6,2,3)  #2 x 3 matrix with numbers 1 to 6 filled col-wise
x[1,2]  #prints 3, 1st row and 2nd col
x[2,1]  #prints 2

#Indices can also be missing
print(x[1,])  #prints 1st row
print(x[,2])  #prints 2nd col

#by default when a single element of a matrix is retrieved, it is returned as a vector
#of length 1 rather than a 1x1 matrix. This behavior can be turned off by setting
#drop=F

x<-matrix(1:6,2,3)
print(x[1,2]) #prints 3
print(x[1,2,drop=F])  #prints [3]

#similarly subsetting a single col or a single row will give you a vector not a matx
print(x[1,])  #prints 1 3 5 prints vector
print(x[1, ,drop=F])  #[1 3 5] prints matrix

#==================================================================================
#PARTIAL MATCHING
x<-list(aardvark=1:5)
print(x$a)  #prints 1 2 3 4 5   Because 'a' is present in 'aardvark' therefore, partial matching
prints(x[["a"]])  #NULL (it matches fr exact name, and since no 'a' NULL)
#=====================================================================================
#REMOVING MISSING VALUES

x<-c(1,2,NA,4,NA,5)
bad<-is.na(x)
print(x[!bad])  #prints all elements that are not bad
#or we can even store them
x<-x[!bad]  #x gets upated with valid elements only

#if there are multiple things and you want to take the subset with no missing value
x<-c(1,2,NA,4,NA,5)
y<-c("a","b",NA,"d",NA,"f")
good<-complete.cases(x,y)   #complete.cases returns a logical vector with no missing values
print(x[good])
print(y[good])

#=====================================================================================
#VECTORIZED OPERATIONS IN R

#it helps make code efficient, concise and easier
x<-1:4
y<-6:9
#to add element in a parallel way
print(x+y)  #returns sum vector 
print(x>2)  #prints F F T T
print(y==8) #prints F F T F
prnit(x*y)  #prints x*y (vector  element wise multiplication)

x<-matrix(1:4,2,2)
y<-matrix(rep(10,4),2,2)  # rep(10,4) is repeat 10, 4 times in the matrix

print(x*y)  #gives element wise matrix multiplication
print(x%*%y)  #gives actual matrix multiplication
print(x/y)  #element-wise division





















  




























