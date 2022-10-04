require(readr)

start <- Sys.time()
df <- read.csv("2008.csv")
print(Sys.time()-start)

#install.packages("data.table")

start <- Sys.time()
dt <- fread("2008.csv")
print(Sys.time()-start)

data.frame(1:12,1:2)
data.table(1:12,1:2)

#Data frame se filtra por filas y columnas
#Data table filtra filas, columnas y un criterio de agrupación

df[filas,columnas]
dt[filas,columnas,by]