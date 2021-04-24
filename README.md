# Mack-Skillings Test

## Descripción
Realiza un test de Mack-Skillings con datos en bloques replicados (balanceados).

## Uso

```
MS.Test(y,c,...)

## Método por default:
MS.Test(y, c)

## Método para la clase 'formula':
MS.Test(formula, c, data)
```

## Argumentos

```y``` &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  matriz de datos con bloques en las filas y tratamientos en las columnas.


```c``` &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; número de réplicas.


```formula```&nbsp; fórmula de la forma ```x ~ t | b```, donde ```x```, ```t``` y ```b``` corresponden a los datos y sus correspondientes tratamientos y bloques, respectivamente.


```data```&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data frame que contiene las variables en la fórmula ```formula```. Argumento obligatorio si se especifica ```formula```.

## Detalles

MS.Test es una extensión de la prueba de Friedman, se puede utilizar para analizar diseños de bloques completos, con la diferencia que permite la inclusión de observaciones replicadas por bloque (es decir, hay múltiples observaciones en $y$ para algunas combinaciones de tratamiento y bloque) donde se puede violar el supuesto de normalidad.

La hipótesis nula es que, aparte de un efecto de bloques, el parámetro de ubicación de $y$ es el mismo en cada uno de los tratamientos.

Si $y$ es una matriz, los tratamientos y bloques se obtienen de los índices de columna y fila, respectivamente. Los NA no están permitidos en tratamientos o bloques.

Para calcular la estadística de Mack-Skillings para un número de réplicas iguales, primero se clasifican las observaciones de menor a mayor, por separado dentro de cada uno de los $n$ bloques. Siendo $S_j$ la suma de los rangos del tratamiento $j$, $k$ el número de tratamientos, $n$ el número de bloques, $c$ el número de réplicas dentro de los bloques, la estadística de Mack-Skillings está dada por          

<img src="https://latex.codecogs.com/svg.image?MS=\frac{12}{k(N&plus;n)}\left[\sum_{j=1}^k{S_j}^2\right]-3(N&plus;n)" title="MS=\frac{12}{k(N+n)}\left[\sum_{j=1}^k{S_j}^2\right]-3(N+n)" />

## Valores

Una lista de clase ```htest``` que contiene los siguientes componentes:

```statistic```&nbsp; el valor de la estadística de Mack-Skillings.
 
 
```p.value```&nbsp;&nbsp;&nbsp;&nbsp; valor p del test.


```method```&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; la cadena de caracteres "Skillings-Mack Test".


```data.name```&nbsp; cadena de carcateres dando el nombre del conjunto de datos.

## Referencias

Myles Hollander, Douglas A. Wolfe y Eric Chicken (2014), Nonparametric Statistical Methods. John Wiley & Sons, Inc., Hoboken, New Jersey. Pages 354–363.

## Ejemplos

```
# Ejemplos con datos de Hollander, Wolfe (2014). Pg. 356.

# matrix input
Datos = matrix(c(7.58,7.87,7.71,11.63,11.87,11.4,15,15.92,15.58,8,8.27,8,12.2,11.7,
                 11.8,16.6,16.4,15.9,7.6,7.3,7.82,11.04,11.5,11.49,15.87,15.91,16.28,8.03,7.35,
                 7.66,11.5,10.1,11.7,15.1,14.8,15.7),9,4)
MS.Test(Datos,c=3)

#	 Skillings-Mack Test

# data:  Datos
# MS = 12.927, p-value = 0.004796
## => Con una significancia del 0.05% se concluye que hay evidencia suficiente para rechazar la hipótesis nula y por lo tanto hay una diferencia significativa entre los tratamientos.
 
 
# formula input
Datos = data.frame(x = c(7.58,7.87,7.71,11.63,11.87,11.4,15,15.92,15.58,8,8.27,8,12.2,11.7,
                     11.8,16.6,16.4,15.9,7.6,7.3,7.82,11.04,11.5,11.49,15.87,15.91,16.28,8.03,7.35,
                     7.66,11.5,10.1,11.7,15.1,14.8,15.7),
                   tratamientos=as.factor(c(rep("lab1",9),rep("lab2",9),rep("lab3",9),rep("lab4",9))),
                   bloques =as.factor(c(rep(c(rep("0",3),rep("4",3),rep("8",3)),4))))
MS.Test(x~tratamientos|bloques,3,data = Datos)

#	 Skillings-Mack Test

# data:  Datos
# MS = 12.927, p-value = 0.004796
## => Con una significancia del 0.05% se concluye que hay evidencia suficiente para rechazar la hipótesis nula y por lo tanto hay una diferencia significativa entre los tratamientos.
```
