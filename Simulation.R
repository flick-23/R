#Generating Random Numbers
#Fucntions for probability distributions in R
#rnorm - generate random Normal variates with a given mean and standard deviation
#dnorm -evaluate the Normal probability density (With a given mean/Sd) at a point (or vector
#of point)
#pnorm - evaluate the cumulative distribution function for a normal distribution
#rpois - generate random Poisson Variates with a given rate


#Probability distribution functions usually have four functions associated with them. 
#The functions are prefixed with a :
#d- density
#r - for random number generation
#p - for cumulative distribution
#q- for quantile function

#working with the normal distributions requires using these 4 functions
dnorm(x,mean=0,sd=1,log=FALSE)
pnorm(q,mean = 0,sd=1,lower.tail = TRUE,log.p=FALSE)
qnorm(p,mean=0,sd=1,lower.tail = TRUE,log.p=FALSE)
rnorm(n,mean=0,sd=1)


#setting the random number with set.seed ensures reproducibility
set.seed(1)
rnorm(5)        #-0.6264538  0.1836433 -0.8356286  1.5952808  0.3295078
rnorm(5)        #-0.8204684  0.4874291  0.7383247  0.5757814 -0.3053884

set.seed(1)
rnorm(5)        #-0.6264538  0.1836433 -0.8356286  1.5952808  0.3295078
#resetting the seed, reproduced the random numbers on line 26

#generating poisson data
rpois(10,1)     #generates 10 poison variables with the rate of 1
rpois(10,2)     #generates 10 poison variables with the rate of 2
rpois(10,20)    #generates 10 poison variables with the rate of 20


#cummulative distribution of poisson variables
ppois(2,2)      #pr(x<=2)
ppois(4,2)      #pr(x<=4)
ppois(6,2)      #pr(x<=6)
                

#-=====================================================================================
#Simulating a Linear Model

#Generating random numbers from a linear model

#suppose we want to simulate from following linear model
# y = B0 + B1(x) + e
#B0 = 0.5 & B1=2  and e~N(0,2)^2
#assume x ~ N(0,1)^2



set.seed(20)
x<-rnorm(100)
e<-rnorm(100,0,2)
y<-0.5+2*x+e
summary(y)
plot(x,y)



#what if X is binary??
#we can use binomial distrubution
set.seed(10)
x<-rbinom(100,1,0.5)
e<-rnorm(100,0,2)
y<-0.5 + 2*x+e
summary(y)
plot(x,y)


#to simulate possion model use - rpois for this
# y~poisson(u)
# log(u) = b0+b1(x)
# b0 = 0.5, b1 = 0.3

set.seed(1)
x<-rnorm(100)
log.mu<-0.5+0.3*x
y<-rpois(100,exp(log.mu))
summary(y)
plot(x,y)
#==============================================================================
#Sample function
#Draws randomly from a specified set of objects allowing you to sample from arbitrary distributions
set.seed(1)
sample(1:10,4)
sample(1:10,4)
sample(letters,5 )
sample(1:10)    #permutation
sample(1:10)
sample(1:10,replace=TRUE) #Sample with replacement




