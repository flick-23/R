#LOOPING FUNCTIONS
#lapply - loop over a list and evaluate a function on each element
#sapply  - Same as lapply but try to simplify the result
#apply - Apply a function over the margins of an array
#tapply - Apply a function over the subsets of a vector
#mapply - Multivariate version of lapply
#split - useful in conjunction to lapply as it splits objects into pieces

#lapply
#always returns a list, regardless of the class of the input
#has 3 args - 1)list x 2) function or name of function 3)other args via its ... args
        #if x is not a list, it will be coerced to a list using as.list
#example
function(X,FUN,...){
        FUN<-match.fun(FUN)
        if(!is.vector(X)||is.object(X))
                X<-as.list(X)
        .Internal(lapply(X,FUN))
}

x<-list(a=1:5,b=rnorm(10))
lapply(x,mean)  #applying the mean function on each element of x and returns a list


#lapply makes heavy use of anonymous functions. [functions that dont have name] 
x<-list(a=matrix(1:4,2,2),b=matrix(1:6,3,2))
#to extract 1st col from each  of the matrices
lapply(x,function(elt)elt[,1])  #returns 1st col of a and 1st col of b



#sapply
#its a variant of lapply
#will try to simplify the result of lapply if possible
#if the result is a list where every element is lenght 1, then a vector is returned
#if the result is a list where every element is a vector of the same length(>1), a matrix is returned
#if it can't figure things out, a list is returned

x<-list(a=1:5,b=rnorm(10),c=rnorm(20,1),d=rnorm(100,5))
sapply(x,mean)  #applying the mean function on each element of x and returns the result as a vector

#============================================================================================
#apply function - used to apply functions over margins of an array
#it is most often used to apply a function to the rows or cols of a matrix
#it can be used with general arrays eg. taking the average of an array of matrices
#its not really fast than writing a loop, but it works in one line!

#syntax
#str(apply)
#funtion(X,Margin,Fun,...)
#x - array, Margin- integer vector indicating which margins should be retained
#   fun- function to be applied   ... - for other args to be passed to FUN

x<-matrix(rnorm(200),20,10)
apply(x,2,mean)   #mean of all cols (2)
apply(x,1,sum)  #sum of all rows (1)

#in-built functions for simple ops -> These are usually faster [noticeble in large matrices]
rowSums = apply(x,1,sum)  #rowSums is a function used to calculate sum of rows
rowMeans = apply(x,1,mean)  #cal mean 
colSums = apply(x, 2,sum) #is a function used to calculate the sum of cols 
colMeans=apply(x, 2, mean)  #mean 

apply(x, 1, quantile,probs=c(0.25,0.75))
#avg matrix in an array
a<-array(rnorm(2*2*10),c(2,2,10))
apply(a,c(1,2),mean)

rowMeans(a,dims=2)  #same code as on line number 67

#==================================================================================
#mappy
#Its a multivariate apply of sorts which applies a function in parallel over a set of args

#sytnax
#function(FUN,...,MoreArgs=NULL, SIMPLIFY=TRUE, USE.NAMES=TRUE)
  #FUN is a function to apply
  #... contains args to apply over
  #MoreArgs is a list of other args to FUN
  #SIMPLIFY indicates whether the result should be simplified

#consider this code
list(rep(1,4),rep(2,3),rep(3,2),rep(4,1))

#instead we can do
mapply(rep,1:4,4:1)

#vectorizing a funciont
noise<-function(n,mean,sd){
  rnorm(n,mean,sd)
}
noise(5,1,2)
noise(1:5,1:5,2)


#this is same as 
mapply(noise,1:5,1:5,2)
#this
list(noise(1,1,2),noise(2,2,2),noise(3,3,2),noise(4,4,2),noise(5,5,2))
#======================================================================================

#tapply
#-used to apply a function over subsets of a vector.
#funciton(X,INDEX,FUN=NULL,...,simplify=TRUE)
#X - is a vector
#Index - is a factor or a list of factors(or else they are coerced to factors)
#FUN - is a function to be applied
# ... contains other args to be passed FUN
#simplify, should we simplify the result?

#Take group means
x<-c(rnorm(10),runif(10),rnorm(10))
f<-gl(3,10)
f #execute to check out
tapply(x,f,mean)

#take group means without simplification 
tapply(x,f,mean,simplify = FALSE)

#find group ranges
tapply(x,f,range)
#=====================================================================================
#split
#takes a vector or the other objects and splits into groups determined by a factor or list of factors
#function(x,f,drop=FALSE,...)
#x is vector(or list) or data frame
#f is a factor(or coerced to one) or a list of factors
#drop indicates whether empty factors levels should be dropped
x<-c(rnorm(10),runif(10),rnorm(10,1))
f<-gl(3,10)
split(x,f)


#split followed by lapply
lapply(split(x,f),mean)
 









