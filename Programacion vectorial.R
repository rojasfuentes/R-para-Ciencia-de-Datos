df <- as.data.frame(read.csv("2008.csv",nrows = 1000))
delay<- df$ArrDelay
delay<- delay[!is.na(delay)] 
#Eliminamos datos vacios

#Suma de los elementos en las tablas 
df$TaxiIn + df$TaxiOut

#Que elemento es mayor
df$TaxiIn > df$TaxiOut

#Todos los retrasos mayores a 0
delay[delay>0]
a <-delay[delay>0]*2
b <-delay[delay>0] + delay[delay>0]
a == b
all(a == b)

#Suma de todos los valores
sum(delay)

#Producto vectorial entre delay y una columna de 1
delay%*% rep(1,length(delay))
#Astedisto entre signos de porcentaje hace referencia al producto matricial

#Obtenemos la media
delay %*% rep(1,length(delay)) / length(delay)
mean(delay)

df2 <- df[,c("CarrierDelay", "WeatherDelay", 
          "NASDelay", "SecurityDelay", 
          "LateAircraftDelay")]

df2 <- df2[complete.cases(df2),]

df2 <- as.matrix(df2)
#Suma de todos los Delay 
df2 %*% rep(1,ncol(df2))

resultdo <- rep(1,nrow(df2))%*%df2
resultdo[5] == sum(df2[,5])
