#FUNCTIONS

#function to add 2 number
add<-function(x,y){
  x+y   #no need to type return
}


#given a vector x, find out the numbers above 10
above10<-function(x){
  use<-x>10 #returns a logical vector
  x[use]
}

x<-1:20   #defining vector
print(above10(x))

#given a vector x, find out the numbers above N
above<-function(x,n=10)   #default value of N is 10, so that if no parameters
{                         #are passsed then the default value of N will be 10
  use<-x>n
  x[use]
}
print(above(x,15))


#calculate mean of each column
colMean<-function(y, removeNA=TRUE)  #y is a matrix
{
  #removeNA is used to remove NA values from the dataset
  nc<-ncol(y) #number of col's
  mean<-numeric(nc)
  for(i in 1:nc){
    mean[i]<-mean(y[,i], na.rm = removeNA)  #na.rm is to REMOVE MISSING values 
  }
  mean
}

#======================================================================================

#FUNCTIONS PART 1
#syntax 
# f<-function(arguments){
  #do something
# }
#formal args are the args included in the function defn
# formals function returns a list of all the formal args of a function
# Not every function call in R makes use of all the formal args
# Func args can be missing or might have default values

#R functions can be matched positionally or by name
#follow calls to function sd are all equivalent

#ARGUMENT MATCHING 
mydata<-rnorm(100)
sd(mydata)
sd(x=mydata)
sd(x=mydata, na.rm=FALSE)
sd(na.rm=FALSE,x=mydata)
sd(na.rm=FALSE,mydata)

#its not recommended to mess with the order of the args, though legal
#when argument is matched by name, it is "taken out" of the arg list and the remaining
#unamed args are matched in order, that they are listed in the function definition

#PARTIAL MATCHING OF Function ARGS
# check for the exact match for a named arg
# check for a partial match
# check for a positional match
#=====================================================================================

#FUNCTION PART 2
#Lazy evaluation - Args to the function are evaluated lazily, so they are evaluated
#   as needed

#"..." argument indicates a variable number of args that are usaually passed on to
#   to the other functions
#   It is used when the number of arguments passed to the funciton cannot be known
#   in advance
#   ex:
# args(paste)
# function(...,sep=" ",collapse=NULL)
# 
#   
# args(cat)
# function(..., file="",sep=" ",fill=FALSE,labels=NULL,append=FALSE)

#We cannout use positional matching or Argument matching for the args that come 
  #after the "..."
  # we have to name them all explicitly
#====================================================================================

#SCOOPING RULES

#binding values to Symbol

#Lexical scoping
#The values of free variables are searched for in the environment in which the 
#function was defined

#Lexical Scoping example

make.power<-function(n){
  pow<-function(x){   # is the free variable in the pow function, since its 
                      #not defined in pow, but is in the environment
    x^n
  }
  pow
}

cube<-make.power(3)
square<-make.power(2)
#Exploring the function closure
ls(environment(cube)) #returns all the variables in the environment of variable cube
get("n",environment(cube))  #returns the value of n in the environment

#Lexical vs. Dynamic Scoping
y<-10
f<-function(x){ #f and g are free variables
  y<-2
  y^2+g(x)
}

g<-function(x){ #y is free variable here
  x*y
}

#with lexical scoping the value of y in the function g is looked up in the env in 
#   which the function was defined, in this case the global environment so, y=10
# With dynamic scoping, the value of y is looked up in the environment from which the
#   function was called 
#     In R the calling environment is known as the parent frame
#   so the value of y would be 2

#when defining and calling environment of functions is same it throws error

g<-function(x){
  a<-3
  x+a+y
}

#g(2)   //this line will throw error cz y is not defined anyhwhere
y<-3
print(g(2))  #returns 8

#Python, Scheme, Perl, Common Lisp support Lexical Scoping









































