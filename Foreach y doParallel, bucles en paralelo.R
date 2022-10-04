library(foreach)
library(doParallel)
library(tidyverse)

df<- read_csv("2008.csv")

#Seleccionamos 5 columnas
df2<- df[,c("CarrierDelay", "WeatherDelay", "NASDelay","SecurityDelay"
            ,"LateAircraftDelay")]

#Las limpiamos de datos faltantes y usamos 10,000 filas
df2<-df2[complete.cases(df2),]
df2<-df2[1:10000,]

#detectamos el numero de nucleos que tenemos 
ncl<- detectCores()
cl <- makeCluster(ncl -2)
#clusterExport(cl,"df2")

#registramos los clusters con esa instruccion
registerDoParallel(cl)

start<-Sys.time()

# .combine = rbind devuelve un vector en lugar de una lista 
#%dopar% ejecuta el bucle en paralelo 
#dentro de los corchetes va el bucle 
resultados <- foreach(i = icount(nrow(df2)),
                      .export = "df2", .combine = rbind) %dopar%{
                        valor <-max(as.numeric(df2[i,]))
                        valor
                      }

print(Sys.time()-start)

#Es importante cerrar los clusters una vez que terminemos
stopCluster(cl)
resultados
