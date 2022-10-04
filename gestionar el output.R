df <- as.data.frame(read.csv("2008.csv",nrows = 1000))
df2 <- df[,c("CarrierDelay", "WeatherDelay", 
             "NASDelay", "SecurityDelay", 
             "LateAircraftDelay")]

head(df2)

descriptivos <- function(columna){
  media <- mean(columna,na.rm=TRUE)
  minimo <- min(columna,na.rm=TRUE)
  maximo <- max(columna,na.rm=TRUE)
  rango <- maximo - minimo
  return(c(media,minimo,maximo,rango))
}

resultados<-apply(df2, 2, descriptivos)
rownames(resultados)<- c("media", "minimo", "maximo", "rango")
#Transponemos
t(resultados)

top3<-function(columna){
  columna<- columna[!is.na(columna)]
  #Convertimos a vector la columna ordenada en negativo
  columna<- as.numeric(columna[order(-columna)])
  return(list("Primero"=columna[1],"Segundo" =columna[2],"Tercero"= columna[3]))
}

resultado<- apply(df2, 2, top3)

#unlist deshace la fila
unlist(resultado)
matriz<-matrix(unlist(resultado),byrow = FALSE,nrow = 3)
colnames(matriz)<- names(resultado)
rownames(matriz)<- names(resultado$CarrierDelay)

matriz
