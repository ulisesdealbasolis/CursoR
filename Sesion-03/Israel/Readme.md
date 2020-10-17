[`Estadística y Programación con R`](../Readme.md) > [`Scripts con R`] > [`Sesion-03`]  

## miniProyecto: Scripts con R

### OBJETIVO
  - Demostrar lo aprendido hasta ahora en el curso

### REQUISITOS

1. Datos: El archivo zip que contiene los datos se puede descargar aquí:

 [DataSet Contaminantes en Aire](../Dataset/rprog_data_specdata.zip)

### RETO a resolver por el ALUMNO

El archivo zip contiene 332 archivos de valores separados por comas (CSV) que contienen datos de monitoreo de la contaminación del aire de partículas finas (PM) en 332 ubicaciones en los Estados Unidos. Cada archivo contiene datos de un solo monitor y el número de identificación de cada monitor está contenido en el nombre del archivo. Por ejemplo, los datos para el monitor 200 están contenidos en el archivo "200.csv". Cada archivo contiene tres variables:

Fecha: la fecha de la observación en formato AAAA-MM-DD (año-mes-día)
sulfato: el nivel de sulfato de PM en el aire en esa fecha (medido en microgramos por metro cúbico) de
nitrato: el nivel de nitrato de PM en el aire en esa fecha (medido en microgramos por metro cúbico)
Para esta asignación de programación, necesitarás descomprimir este archivo y crear el directorio 'specdata'. Una vez que hayas descomprimido el archivo zip, no realices modificaciones en los archivos del directorio 'specdata'. En cada archivo, notará que hay muchos días en los que faltan sulfato o nitrato (o ambos) (codificados como NA). Esto es común con los datos de monitoreo de la contaminación del aire en los Estados Unidos.

1- Parte 1 [Programa Pollutan](pollutan.r)

Escriba una función llamada 'pollutantmean' que calcule la media de un contaminante (sulfato o nitrato) en una lista específica de monitores. La función 'pollutantmean' toma tres argumentos: 'directorio', 'pollutant' e 'id'. Dados los números de identificación de un monitor vectorial, 'pollutantmean' lee que monitorea los datos de materia particulada del directorio especificado en el argumento 'directorio' y devuelve la media del contaminante en todos los monitores, ignorando cualquier valor faltante codificado como NA.

Este programa esta estable pero no funciona con vectores para la variable ID.


2- Parte 2 [Programa Complete](Complete.r)

Escribe una función que lea un directorio lleno de archivos e informe el número de casos completamente observados en cada archivo de datos. La función debe devolver un marco de datos donde la primera columna es el nombre del archivo y la segunda columna es el número de casos completos. Sigue un prototipo de esta función:

Este programa esta estable pero no funciona con vectores para la variable ID.

3- Parte 3 [Programa Corr](corr.r)
Escribe una función que tome un directorio de archivos de datos y un umbral para casos completos y calcula la correlación entre sulfato y nitrato para ubicaciones de monitoreo donde el número de casos completamente observados (en todas las variables) es mayor que el umbral. La función debe devolver un vector de correlaciones para los monitores que cumplen con el requisito de umbral. Si ningún monitor cumple con el requisito de umbral, entonces la función debe devolver un vector numérico de longitud 0. 

Este progrrma es estable y funciona bien.