# COMENTARIO 



texto  <- 'hola'
numero <-  5

mi_vector <- c(2, 5, 8) #Vector
mi_matriz <- matrix(data = 0, nrow = 5, ncol = 5)
mi_dataframe <- data.frame(runif(10), runif(10))

head(mi_dataframe)
View(mi_dataframe)

colnames(mi_dataframe) <- c('Columna1', 'Columna2')

#Accediendo al primer renglón
mi_dataframe[renglon, columna]

mi_dataframe[1, ] #Todos se indica con un espacio
mi_dataframe[ , 1] #Todos los renglones de la columna 1 
mi_dataframe[1, 1] #El renglon 1 columna 1

#Funciones básicas
sum(mi_dataframe[1, ]) #Suma
max(mi_dataframe[1, ]) #Máximo
min(mi_dataframe[1, ])


ncol(mi_dataframe) #Numero de columnas
nrow(mi_dataframe) #Numero de filas

#Ciclo for

# for(contador in inicio:final){
#   contenido
# }

for(monica in 1:5){
  print(monica)
}


#Ciclo while 
# while(condicion){
#   contenido
# }

x <- 5
iterador <- 1
while(iterador <= x){
  iterador <- iterador+1
  print(iterador)
}

#Condicional IF 
#Operadores lógicos
#       'igual' : == 
#       'mayor que': >
#       'AND' : &
#       'OR'  : |

if(4 < 5){
  
  
  a <- 'monica'
  
} else{
  print('no sirve')
  
} 