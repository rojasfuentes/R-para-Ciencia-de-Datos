df <- as.data.frame(read.csv("2008.csv",nrows = 1000))
df2 <- df[,c("CarrierDelay", "WeatherDelay", 
             "NASDelay", "SecurityDelay", 
             "LateAircraftDelay")]

head(df2)

df_clean<- df2[complete.cases(df2),]
head(df_clean)

#Genero un vector del 1 al 10 y aplico la funcion a x de x^2
sapply(1:10,FUN = function(x) x^2)

#trim recorta las puntas de la distribución
apply(df_clean, 1, mean,trim = 0.01)
apply(df_clean,1 , function(x) mean(x,trim = 0.01))

#definimos una funcion propia
media2<- function(fila){
  return(sum(fila)/length(fila))
}

res <- apply(df_clean,1,mean)
res2 <- apply(df_clean,1,media2)
#comparamos si la funcion que creamos es identica a una funcion predefinida
all(res == res2)

funcionpropia <- function(fila){
  if(all(fila>0)){
    return(mean(fila))
  }
  else{
    return(max(fila))
  }
}

reusltado<-apply(df_clean,1,funcionpropia)
head(resultado)

funcionpropia2<- function(fila){
  if(any(is.na(fila))){
    return("Contiene NAs")
  }else{
    if(all(fila > 0)){
      return(list(a= "Media",b = mean(fila)))
    }else{
      return(list(a="Maximo", b=max(fila)))
    }
  }
}

reusltado<-apply(df2,1,funcionpropia2)
head(resultado)
