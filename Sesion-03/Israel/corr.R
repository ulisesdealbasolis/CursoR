#Se borran variables de ambiente globales y se limpia la consola
rm(list=ls())
cat("\014")

#funcion "complete" recibe nombre de carpeta
complete <- function(directory, id=1:332)
{
  #se establece el directorio de trabajo en base a la variable directory
  setwd(directory)
  #se genera un vector con el nombre de los directorios que contengan la extension *.csv  test=data.frame(id=0,nobs=0)
  file_names = list.files(pattern="*.csv")
  #se inicializa el D.F. para que guarde el resultado de la funcion  
  resultado.complete<-data.frame(id=numeric(),nobs=numeric())
  
  for(i in id){
    #se construye el nombre del archivo segun la iteracion del FOR
    filedir = paste(file_names[i],sep = "")
    #dataframe creado een funcion al archivo csv
    df = read.csv(file=filedir,header = TRUE,sep = ",")
    #creamos un vector que contenga solo datos validos de nitrato
    cuenta_nitrato<-df[(!is.na(df$nitrate)),]
    #creamos un vector que contenga solo datos validos de nitrato y sulfato
    cuenta_n_mas_sulfato<-cuenta_nitrato[(!is.na(cuenta_nitrato$sulfate)),]
    #se cuentan las filas del D.F. resultantes
    cuenta_nobs<-nrow(cuenta_n_mas_sulfato)
    #Aqui se va a agrupar la informacion resultado de la funcion en un nuevo D.F.
    resultado.complete<-rbind(resultado.complete,data.frame(id=i,nobs=cuenta_nobs))#se genera un conetnido anidado del resultado en un nuevo D.F.
  }
  returnValue(resultado.complete)#se regresa el valor resultado de la funcion
}

#funcion Corr
corr <- function(directory, threshold = 0)
{
  resultado<-numeric()
  completos<-complete(directory)
  completos_condicion<-completos[(completos$nobs>=threshold),]
  setwd(directory)
  file_names = list.files(pattern="*.csv")
  if (nrow(completos_condicion)>0) {
    for(i in completos_condicion$id){
      filedir = paste(file_names[i],sep = "")
      df = read.csv(file=filedir,header = TRUE,sep = ",")
      cuenta_nitrato<-df[(!is.na(df$nitrate)),]
      cuenta_n_mas_sulfato<-cuenta_nitrato[(!is.na(cuenta_nitrato$sulfate)),]
      total_sulfato<-cuenta_n_mas_sulfato["sulfate"]
      total_nitrato<-cuenta_n_mas_sulfato["nitrate"]
     resultado<-c(resultado,cor(total_sulfato,total_nitrato))
    } 
    print("-----------------------------------------------------------------------")
    print("Head:")
    print(head(resultado))
    print("-----------------------------------------------------------------------")
    print("Summary:")
    print(summary(resultado))
    print("-----------------------------------------------------------------------")
  } else{
    print("No hay datos por arriba el umbral")
  }
}

#inicio del programa
message("Bienvenido.")
message("\n")
message("El siguiente programa toma un directorio de archivos de datos y un umbral ")
message("para casos completos y calcula la correlación entre sulfato y nitrato para ")
message("ubicaciones de monitoreo donde el número de casos completamente observados ")
message("(en todas las variables) es mayor que el umbral.")
message("\n")
Dirname=readline(prompt = "Escribe el nombre del directorio donde se encuentran los archivos: \n")
Threshold=readline(prompt = "Digita el umbral a comparar: \n")
Threshold=as.numeric(Threshold)

print("Buscando directorio...")
Dir.home<-getwd()
Dirs <- list.dirs(path=file.path("~"),recursive=T)
direct=names(unlist(sapply(Dirs,grep,pattern=Dirname))[1])
print(paste("cambiando de ruta a: ",direct))
print("Procesando...")
#corr(direct,Threshold)
setwd(Dir.home)
print("FIn")
