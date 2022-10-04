#El paquerte big memory esta diseñado para gestionar matrices 
library(bigmemory)
#Cargamos el objeto en fomrato big matrix
df<-read.big.matrix("2008.csv",header = TRUE,sep=",")

dim(df)
df[1:10,c("DepDelay","ArrDelay")]

#Esto no es un data frame, es una matriz
#Carga las columnas no numericas como datos faltantes 
df[1:10,1:10]

#mwhich es un filtro 
#Depende de 4 parámetros, el primero es el objeto que queremos filtrar
#El segundo es la columna que queremos filtrar 
#El tercero es el valor que quereos filtrar
#El cuarto es el operador ge significa greater or equal


head(df[mwhich(df, "ArrDelay", 60, "ge"),])

#Podemos convertir columnas en formato categorico (strings) a formato numérico
library(data.table)
dt<- fread("2008.csv")

#creamos un vector vacio
origenes<- unique(dt$Origin)
origenes_code <- rep(0,nrow(dt))

#Usamos un bucle de 1 al tamaño de la categoria para rellenar el vector vacio 
for( i in 1:length(origenes)){
  origenes_code[dt$Origin == origenes [i]] <- i 
}

#Sobre escribimos con los codigos que generamos 
#Cambia los strings por un codigo asociado
dt$Origin <- origenes_code
dt$Origin
dim(dt)

#Cargamos solo la columna de origenes 
or <- read.csv("2008.csv",
               colClasses = c(rep("NULL",16),NA,rep("NULL",12)))
head(or)
