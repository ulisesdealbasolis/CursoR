
rm(list=ls())
cat("\014")

complete <- function(directory, id=1:332)
{
  setwd(directory)
  file_names = list.files(pattern="*.csv")
  for(i in id){
      filedir = paste(file_names[i],sep = "")
      df = read.csv(file=filedir,header = TRUE,sep = ",")
      cuenta_nitrato<-df[(!is.na(df$nitrate)),]
      cuenta_n_mas_sulfato<-cuenta_nitrato[(!is.na(cuenta_nitrato$sulfate)),]
      nobs<-nrow(cuenta_n_mas_sulfato)
      print(paste("Del archivo ",i," hay un total de ",nobs," casos completados"))
  }
  
}

#inicio
message("Bienvenido.")
message("\n")
message("El siguiente programa ea un directorio lleno de archivos e informe el número de casos")
message("completamente observados en cada archivo de datos.")
message("\n")
Dirname=readline(prompt = "Escribe el nombre del directorio donde se encuentran los archivos: \n")
id=readline(prompt = "Cuantos archivos quieres ocupar: \n")
id=as.integer(id)

print("Buscando directorio...")
Dir.home<-getwd()
Dirs <- list.dirs(path=file.path("~"),recursive=T)
direct=names(unlist(sapply(Dirs,grep,pattern=Dirname))[1])
print(paste("cambiando de ruta a: ",direct))
print("Procesando...")
complete(direct,id)
setwd(Dir.home)
print("FIn")
