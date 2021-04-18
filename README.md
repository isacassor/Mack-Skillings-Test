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


```data```&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data frame que contiene las variable en la fórmula ```formula```. Argumento obligatorio si se especifica ```formula```.

## Detalles

## Valores

Una lista de clase ```htest``` que contiene los siguientes componentes:

```statistic```&nbsp; el valor de la estadística de Mack-Skillings.
 
 
```p.value```&nbsp;&nbsp;&nbsp;&nbsp; valor p del test.


```method```&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; la cadena de caracteres "Skillings-Mack Test".


```data.name```&nbsp; cadena de carcateres dando el nombre del conjunto de datos.

## Referencias

## Ejemplos

```
# matrix input

Datos = matrix(c(7.58,7.87,7.71,11.63,11.87,11.4,15,15.92,15.58,8,8.27,8,12.2,11.7,
                 11.8,16.6,16.4,15.9,7.6,7.3,7.82,11.04,11.5,11.49,15.87,15.91,16.28,8.03,7.35,
                 7.66,11.5,10.1,11.7,15.1,14.8,15.7),9,4)
MS.Test(Datos,c=3)

#	 Skillings-Mack Test

# data:  Datos
# MS = 12.927, p-value = 0.004796
## => 
 
 
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
## => 
```
