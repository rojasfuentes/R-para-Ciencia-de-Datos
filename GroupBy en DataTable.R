require(data.table)

dt <- fread("2008.csv")

#Recuento de casos agrupado por mes
#la sintaxis es dt[filtros,numero de casos, by]
dt[,.N,by = .(Month)]

#Vuelos con origen en atlanta
dt[Origin == "ATL",.N,by = .(Month)]

#Vuelos retrasados por mas de 60 min agrupados por origen y destino
dt[ArrDelay > 60, .N, by = .(Origin, Dest)]


#Media del retraso de salida para el mismo caso
dt[ArrDelay > 60, .("RetrasoSalida"=mean(DepDelay)), by = .(Origin, Dest)]

dt[Origin == "ATL" & !is.na(ArrDelay), .N, 
   by= .(Month, ">1hr de Retraso" = ArrDelay > 60)]