#FOR loop
#most commonly used for iterating over the elements of an object (list, vector,etc)
for(i in 1:10){
  print(i)
}
#below 3 loops have same behaviours
x<-c("a","b","c","d")
for(i in 1:4){
  print(x[i])
}

for(i in seq_along(x))
{
  print(x[i])
}
for(i in x)
{
  print(i)
}
for(i in 1:4)print(x[i])  #if for loop has only a single exp, curly braces can be ignored

#NESTED FOR LOOP
x<-matrix(1:6,2,3)
for(i in seq_len(nrow(x))){
  for(j in seq_len(ncol(x))){
    print(x[i,j])
  }
}
#===============================================================================
#WHILE LOOPs

count<-0
while(count<10){
  print(count)
  count<-count+1
}
#example
z<-5
while(z>=3 && z<=10)
{
  print(z)
  coin<-rbinom(1,1,0.5) #flipping a random coin
  if(coin ==1){
    #random walk
    z<-z+1
  }else{
    z<z-1
  }
}
#conditions are always evaluated from left to right
#====================================================================================
#REPEAT
#basically initiates inifinite loop; not commonly used in stats app, but hav some uses
#only way to exit a repeat loop is break

#example
x0<-1
tot<-1e-8
#there's no guarantee if this loop can end; its preferred to use a hard limit 
#value to break the loop
repeat{
  x1<-computeEstimate()
  if(abs(x1-x0)<tol){
    break
  }else{
    x0<-x1
  }
}

#NEXT
#basically used in any type of loop to skip an iteration

#example
for(i in 1:100){
  if(i<=20){
    #skip the 1st 20 statements
    next
  }
  #do something
}

#RETURN
#used to exit a loop, just like its used to exit a function and return a value


























