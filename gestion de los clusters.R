df <- as.data.frame(read.csv("2008.csv",nrows = 1000))
df2 <- df[,c("CarrierDelay", "WeatherDelay", 
             "NASDelay", "SecurityDelay", 
             "LateAircraftDelay")]

head(df2)

mi_funcion <-function(x){
  ifelse(any(is.na(x)),NA, sum(x)/length(x))
}

#Necesitamos exportar las funciones a los clusters porque contienen una 
#version muy básica de R

require(parallel)

ncl <- detectCores()
cl <- makeCluster(ncl - 1)

#EXPORTAMOS
clusterExport(cl,"mi_funcion")

results <- parApply(cl=cl, df2, 1, mi_funcion)

stopCluster(cl)

###

mi_variable<- ncol(df2)

mi_funcion <- function(x){
  ifelse(any(is.na(x)),NA, sum(x)/mi_variable)
}

clusterExport(cl,"mi_variable")

###
# Como importar un paquete entero
