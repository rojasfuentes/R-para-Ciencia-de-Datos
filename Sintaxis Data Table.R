require(data.table)

dt <- fread("2008.csv")

#No necesitamos poner el signo de pesos para indicar una fila
dt[Month == 2, ArrDelay]

#Para ver dos filas
#Es importante incluir antes un punto
dt[Month == 2, .(ArrDelay,DepDelay)]

#Más de un filtro por filas 
dt[Month == 2 & DayOfWeek == 1, .(ArrDelay,DepDelay)]

#Renombrar columnas
dt[Month == 2, .("Llegada"=ArrDelay, 
                 "Salida"= DepDelay)]

#Cuantos casos hay en total
dt[Month == 2 & DayOfWeek == 1, .N]

#fUNCION como filtro
#Porcentaje de vuelos donde el retraso de llegada es menor al retraso de saida
dt[,mean(ArrDelay < DepDelay,na.rm = TRUE)]
