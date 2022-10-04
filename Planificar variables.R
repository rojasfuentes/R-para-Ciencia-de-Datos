df <- as.data.frame(read.csv("2008.csv",nrows = 1000))
df <-df[!is.na(df$ArrDelay),]

#Planificar Vectores
#Calculamos la suma acumulativa de la columna ArrDelay

#Opcion 1
start <- Sys.time()
#Variable sin dimensiones, vector vacio
suma <-c()
for(i in 1:nrow(df)){
  suma <- c(suma,df[i,"AirrDelay"])
}
print(Sys.time()-start)

#Opcion 2



#Opcion 3
start <- Sys.time()
suma <- cumsum(df$ArrDelay)
print(Sys.time()-start)



#Planificar Matrices

df2 <- df[,c("CarrierDelay", "WeatherDelay", 
             "NASDelay", "SecurityDelay", 
             "LateAircraftDelay")]
df2<-df2[complete.cases(df2),]
head(df2)

matriz <- matrix( rep(0, nrow(df2)*5), nrow = nrow(df2))
colnames(matriz)<- c("Minimo", "mediana", "Maximo", "Media", "Std. Dev.")

for (i in 1:nrow(df2)) {
  val <- as.numeric(df2[i,])
  matriz[i,]<- c(min(val),median(val),max(val),mean(val),sd(val))
}

head(matriz)
