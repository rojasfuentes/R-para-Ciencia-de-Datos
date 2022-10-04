df <- as.data.frame(read.csv("2008.csv",nrows = 1000))
df2 <- df[,c("CarrierDelay", "WeatherDelay", 
             "NASDelay", "SecurityDelay", 
             "LateAircraftDelay")]

head(df2)

start <- Sys.time()
results2 <- apply(df2, 1, mean, na.rm = TRUE)
print(Sys.time()-start)

require(parallel)
ncl <- detectCores()
cl <- makeCluster(ncl - 1)


start <- Sys.time()
results2 <- apply(cl = cl, df2, 1, mean, na.rm = TRUE)
print(Sys.time()-start)

stopCluster(cl)