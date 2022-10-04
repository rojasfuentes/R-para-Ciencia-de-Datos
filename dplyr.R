require(data.table)
require(dplyr)

dt <- fread("2008.csv")
df <- dt[sample(x = 1:nrow(dt), size = 1e5)]

#Filtro
filter(df, Month == 1 & DayOfWeek == 1)

#Arrange ordena casos
arrange(df, ArrDelay, AirTime)

#Seleccionamos variables 
select(df, ArrDelay, DepDelay)

#Podemos usar un rango de columnas
select(df, CarrierDelay:LateAircraftDelay)

#Mutate genera nuevas columnas
#Tambien podemos crear variables que sean una funcion de dos columnas
mutate(df,
       Retraso = ArrDelay >0
       )

mutate(df,
       Velocidad = Distance/AirTime
)

#Transmute Solo nos muestra la variable que hemos creado 
transmute(df,
       Velocidad = Distance/AirTime
)

#Summarise depende de una base de datos y puede generar resumenes 
summarise(df,
          "Dist, Mediana"= median(Distance,
                                  na.rm = TRUE))

#Sample selecciona casos de nuestra bdd
sample_n(df,10)
sample_frac(df,0.1)
