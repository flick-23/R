#str - compactly display the internal structure of an R object
#A diagonstic function and an alternative to summary
#It is especially well suited to compactly display the contents of lists
#Roughly one line per basic project

#str(str)
#function (object, ...)
#str(ls)
#function (name, pos = -1L, envir = as.environment(pos), all.names = FALSE, pattern, sorted = TRUE)  
x<-rnorm(100,2,4)
summary(x)
str(x)
f<-gl(40,10)
str(f)
summary(f)
m<-matrix(rnorm(100),10,10)
str(m)
m[,1]

#=============================================================================================

        
        
        
        
        
        
        
        












