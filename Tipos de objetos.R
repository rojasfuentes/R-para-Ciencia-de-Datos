num <- 5
num

vector <-c(1,2,3)
vector
vector[2]

rango <-1:30
rango [2:25]

matriz <- matrix(1:6, ncol =3, byrow = TRUE)
matriz

df <- as.data.frame(read.csv("2008.csv",nrows = 1000))
View(df)

df$ArrDelay


df["ArrDelay"]
df[1:5, "ArrDelay"]
df[1:5,c("ArrDelay", "DepDelay") ]


lista <- list()
lista$objeto1 <-c(1,2,3)
lista$objeto2 <-"String"
lista$objeto3 <-df[1:5]

lista
lista$objeto2
lista$objeto3[,"ArrDelay"]
