#DATATYPES

# Types of Objects
# There are 5 classes
# Character, Numberic, Integer, Complex, Logical
# Vector - is most basic
# ------------------------------------------------------------------------
#Vector - everything in a vector must be of same class
#List - reppresented as a vector but can contain objects of different classes

#vector(arg1 , arg2 )arg1-> class of vector (ex. numeric/logical) arg2-> lenght of vector

#Attributes
#name, dimnames 
# dimensions
# class
# length
# other user defined attributes/ meta data
# -------------------------------------------------------------------------
# #VECTORS
# Creating vectors
# c()
# Examples
# 
x<-c(0.5,0.6) #numeric
x<-c(TRUE, FALSE) #logical, can also be T, F
x<-c("a","b","c")#character
x<- 9:20  #integer , x has all values from [9, 20]
x<-c(1+10i,2+0i)  #complex
# ------------------------------------------------------------------------------
#Using vector function
x<-vector("numeric",length = 10)#has a vector of zeroes of length 10

# Mixing objects

# Implicit Coercion
y<-c(1.7,"a") #character
y<-c(T,2)   # numeric
y<- c("a",T)  #character
# # Explicit Coercion
x<-0:6
class(x)  #//gives integer
as.numeric(x) #gives [1,6]
as.logical(x) # gives F, T, .. T 
as.character(x)#gives "1","2".."6"

x<-c("a","b","c")
as.numeric(x) #gives NA NA NA 

# ------------------------------------------------------------
# LISTS (special vectors that can have different classes)
# 
x<-list(1,"a",T,1+4i) 
# ===============================================================================
 
# MATRICES
m<-matrix(nrow = 2, ncol = 3)
dim(m)  #gives 2,3
attributes(m) #// gives 2 3
 
# matrices are constructed column-wise
 m<-matrix(1:6, nrow=2,ncol=3)
# /* m has the 2 D matrix 
# 1 3 5 
# 2 4 6 */ because of 1:6
 
# matrices can also be created directly from vectors by adding a dimension attribute
m<-1:10 # M has 1 2 3 4 5 6 7 8  9 10
dim(m)<- c(2,5) # creates a matrix with dimension 2 rows and 5 cols
# 1 3 5 7 9
# 2 4 6 8 10
 
# BINDING cols and rows
 
x<- 1:3
y<-10:12
cbind(x,y)  #binds x and y column wise
rbind(x,y)  #binds x and y row wise 
#====================================================================================

# FACTORS

# Special type of datatypes that has different levels

x<-factor(c("yes","yes","no"))#factor with 2 levels . That is 2 unique values
table(x)  #prints the frequency of each element in the factor
unclass(x)
attr("levels")

x<-factor(c("yes","yes","yes","yes","yes","no","no","no",), levels=c("yes","no"))

#By default in table the elements are arranged alphabetically 
#When we dont want them to be arranged alphabetically we use the levels=c() 
# to set the order of the display

#===================================================================================
#MISSING VALUES

#denoted by NA or NaN

#is.na()  Used to test objects if they are NA
# is.nan() Used to test for NaN
# NaN is also NA but the reverese is not TRUE

x<-c(1,2,NA,10,3)
is.na(x)  #F F T F F
is.nan(x) #F F F F F
x<-(c(1,2,NaN,NA,4))
is.na(x)  #F F T T F
is.nan(x) #F F T F F

#==============================================================================

#DATA FRAMES
# unlike matrices can store mixed type of classe
#Used to store tabular data
# created by calling read.table() or read.csv()
# can be converted to a matrix by calling data.matrix()

x<-data.frame(foo = 1:4, bar = c(T,F,F,F))  #foo and bar are variable names 
ncol(x) #gives 2, because 2 cols
nrow(x) #gives 4, because 4 rows

#=============================================================================
# READING NAME ATTRIBUTES

#R objects can be given various names

x<-1:3
names(x)  #returns NULL

names(x)<- c("foo","bar","norf")
#on printing x, output looks like
# foo bar norf
# 1    2   4
names(x)  #returns foo bar narf

#lists can also have names

x<-list(a=1, b=2, c=3)
#on printing it displays the name associated with the element

#matrices can also have names

m<-matrix(1:4, nrow=2,ncol=2)

dimnames(m)<-list(c("a","b"),c("c","d"))
#c(a,b) are the row names
#c(c,d) are the col names























































 
