# Cargamos paquetes
library(reshape)
library(dplyr)
library(ggplot2)

#Leemos archivo de breast_cancer
breast.cancer <- read.csv('breast_cancer.csv')

# Vemos la estructura
str(breast.cancer)

# Quitamos las columnas no numéricas
breast.cancer.num <- breast.cancer[,-c(1,2,3)]

# Calculamos la matriz de correlación y le damos formato para graficar
cor.df <- melt(cor(breast.cancer.num))

# Creamos gráfico para visualizar matriz de correlación
cor.df %>% ggplot(aes(X1,X2)) + 
  geom_tile(aes(fill = value)) + 
  ggtitle('Matriz de correlación')+
  scale_fill_gradient(low = 'white', high = 'red') + 
  theme(axis.text.x = element_text(angle = 90,hjust = 0))
