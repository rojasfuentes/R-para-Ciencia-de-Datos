df <- as.data.frame(read.csv("2008.csv",nrows = 1000))
df2 <- df[,c("CarrierDelay", "WeatherDelay", 
             "NASDelay", "SecurityDelay", 
             "LateAircraftDelay")]

head(df)


df_clean<- df2[complete.cases(df2),]
head(df_clean)

#X Es el objeto que se va a explorar
#MARGIN es cual de los ejes del objeto se va a estar epxlortando 
#1 implica filas y 2 implica columnas 
#FUN es la funcion que queremos usar

filas <-apply(X = df_clean,MARGIN = 1,FUN = mean)
columnas <-apply(X = df_clean,MARGIN = 2,FUN = mean)

filas <-apply(X = df_clean,MARGIN = 1,FUN = max)
filas
columnas <-apply(X = df_clean,MARGIN = 2,FUN = max)
columnas

#Podemos omitir los nombres de los parametros
apply(df_clean,1,summary)

#laply solo necesita X y FUN
#la "l" es de lista

resultado <- lapply(df_clean$CarrierDelay, factorial)

#sapply genera un output con un formato más legible 

 <- sapply(df_clean$CarrierDelay, factorial)


#Es importante indicar que se remeuevan los valores na
apply(df2,2,mean,na.rm=TRUE)
