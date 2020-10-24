
rm(list=ls())
cat("\014")

pollutantmean <- function(direct, pollutant, id=1:332)
{
  setwd(direct)
  file_names = list.files(pattern="*.csv")
  for(i in id){
    filedir = paste(file_names[i],sep = "")
    if(i==id[1]){
      df = read.csv(file=filedir,header = TRUE,sep = ",")
    }
    else{
      df = rbind(df,read.csv(file=filedir,header=TRUE,sep = ","))
    }
  }
  col = df[[pollutant]]
  means = mean(col,na.rm = TRUE)
  print(paste("El promedio de",pollutant,"es:",means))
}

#inicio del programa

message("Bienvenido.")
message("\n")
message("El siguiente programa calcula la media de un contaminante (sulfato o nitrato)")
message("en una lista específica de monitores.")
message("\n")
Dirname=readline(prompt = "Escribe el nombre del directorio donde se encuentran los archivos: \n")
pollutant=readline(prompt = "Escribe 1 para obtener la media de Sulfato o 2 para Nitrato: \n")
id=readline(prompt = "Cuantos archivos quieres ocupar: \n")
id=as.numeric(id)

print("Buscando directorio...")
Dir.home<-getwd()
Dirs <- list.dirs(path=file.path("~"),recursive=T)
direct=names(unlist(sapply(Dirs,grep,pattern=Dirname))[1])
print(paste("cambiando de ruta a: ",direct))
print("Procesando...")

if (pollutant==1) {
  pollutant="sulfate"
}
  if (pollutant==2) {
  pollutant="nitrate"
  }

pollutantmean(direct,pollutant,id)
setwd(Dir.home)
print("FIn")
