#CONTOL STRUCTURES IN R
#if-else
#for
#while
#repeat -execute an infinite loop
#break
#next - skips an iteration of a loop
#return
#===========================================================================

#IF-ELSE SYNTAX
# if(condition)
# {
#   statements
# }else
# {
#   statements
# }
# 
# if(condition)
# {
#   statements
# }else if(condition)
# {
#   statements
# }else
# {
#   statements
# }
#examples
x<-1

if(x>3)
{
  y<-10
}else
{
  y<-0
}
#alternative for the above code
y<-if(x>3){
  10
}else
{
  0
}
print(y)
