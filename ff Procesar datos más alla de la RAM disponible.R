##ff gestiona nuestros datos en particiones de memoria del disco
require(ff)
require(readr)
require(ffbase)

df<- read_csv("2008.csv")
df_ff<-read.csv.ffdf(file = "2008.csv")

class(df)
class(df_ff)

#cuanto espacio ocupa en nuestra memoria 
object.size(df)/1024/1024
object.size(df_ff)/1024/1024

mean(df_ff$ArrDelay,na.rm=TRUE)

mean(df_ff[,"ArrDelay"],na.rm=TRUE)

secuenciaff<-as.ff(1:1e9)
secuencia<- 1:1e9

#cuanto ocupa en memoria 
object.size(secuenciaff)
object.size(secuencia)

sum(secuenciaff)
sum(secuencia)

df2_ff<- df_ff[,c("CarrierDelay", "WeatherDelay", "NASDelay","SecurityDelay"
            ,"LateAircraftDelay")]

df2<- df[,c("CarrierDelay", "WeatherDelay", "NASDelay","SecurityDelay"
            ,"LateAircraftDelay")]
