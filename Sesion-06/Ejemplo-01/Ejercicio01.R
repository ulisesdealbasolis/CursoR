library(tidyr)
library(ggplot2)

# Leer datos
breast.cancer <- read.csv('breast_cancer.csv')

# Contar el número de renglones del dataframe
nrow.df <- nrow(breast.cancer)

# Sacar muestra sin reemplazo de los índices del 20% de todo el dataframe
idx.sample <- sample(nrow(breast.cancer), size = as.integer(nrow.df*0.2))

# Traer las observaciones del dataframe de los índices que salieron en la muestra
sample.df <- breast.cancer[idx.sample,]

# Vemos estructura del dataframe de los índices que salieron en la muestra
str(sample.df)
sample.df <- sample.df[,-c(1,2,3)]

# Gráficamos histograma de variables numéricas de la muestra
ggplot(gather(sample.df), aes(value)) + 
  geom_histogram(bins = 10) + 
  facet_wrap(~key, scales = 'free_x') +
  theme_minimal()
