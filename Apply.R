df <- as.data.frame(read.csv("2008.csv",nrows = 1000))
df2 <- df[,c("CarrierDelay", "WeatherDelay", 
             "NASDelay", "SecurityDelay", 
             "LateAircraftDelay")]

head(df)

##############
#BUCLE
#############
start<-Sys.time()

resultados <- rep(0,nrow(df))
for(i in 1:nrow(df)){
  resultados[i] <- mean(as.numeric(df[i,]), na.rm = TRUE)
}
print(Sys.time()- start)


##############
#APPLY
############

start <-Sys.time()

resultado2 <- apply(X = df, MARGIN = 1, FUN = mean, na.rm = TRUE)

print(Sys.time()- start)

#No considera los valores NA
all(resultados = resultado2, na.rm = TRUE)
