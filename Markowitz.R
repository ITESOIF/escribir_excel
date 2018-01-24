require(quantmod)
require(xts)
require(zoo)

acciones <- c('AMXL.MX', 'SORIANAB.MX', 'VOLARA.MX')
fechas <- c('2016-01-01', '2017-01-01')

getSymbols(acciones, src = 'yahoo', from = fechas[1], to = fechas[2])

# Acomodando datos en una matriz

precios <- data.frame()

for(i in 1:length(acciones)){
  precios <- cbind(precios, get(acciones[i])) #cbind, Combina columnas
}

precios <- as.data.frame(precios)
precios <- na.omit(precios) #Borra los NA (donde faltan cotizaciones)

#Determinar qué columnas nos interesa
precios_final <- data.frame(matrix(NA, nrow = nrow(precios), ncol = length(acciones))) #Cada columna va a corresponder a una accion

for(i in 1:length(acciones)){
  precios_final[ ,i] <- eval(parse(text=paste( 'precios$', acciones[i], '.Close', sep='')))
}

colnames(precios_final) <- acciones


#Sacando rendimientos
rendimientos <- precios_final[2:nrow(precios_final), ] / precios_final[1:nrow(precios_final)-1, ] -1


# Markowitz ---------------------------------------------------------------
n_porta <- 1000
proporciones <- matrix(runif(n_porta*length(acciones)), nrow = n_porta, ncol = length(acciones))
suma_filas <- apply(proporciones,1, sum) #Sumar todos los renglones

proporciones <- proporciones / suma_filas #Transformando aleatorios que sumen 1
medias <- apply(rendimientos, 2, mean) #Sacando medias por columna de los rendimientos

valor_esperado <- proporciones %*% as.matrix(medias)

#Sacar Varianzas

covarianzas <- cov(rendimientos)
varianzas <- numeric() #Crear algo pero dejarlo vacio para irlo rellenando poco a poco 

for(i in 1:nrow(proporciones)){
  varianzas[i] <- t(as.matrix(proporciones[i, ])) %*% covarianzas %*% as.matrix(proporciones[i, ])
}

desviaciones <- sqrt(varianzas)


# Plot Markowitz ----------------------------------------------------------

plot(desviaciones, valor_esperado)

data <- data.frame(valor_esperado, desviaciones)

riesgo_minimo <- which(data$desviaciones == min(data$desviaciones)) 
proporciones[riesgo_minimo, ] #Portafolio con menor riesgo

mayor_rendimiento <- which(data$valor_esperado == max(data$valor_esperado))
proporciones[mayor_rendimiento, ] #Portafolio con mayor rendimiento