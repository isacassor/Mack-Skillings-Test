\name{Mack-Skillings Test}
\alias{MS Test}
\title{Mack-Skillings Test}
\usage{
MS.Test(y,c,...)

## Método por default:
MS.Test(y, c)

## Método para la clase 'formula':
MS.Test(formula, c, data)
}
\description{
MS.Test es una extensión de la prueba de Friedman, se puede utilizar para analizar diseños de bloques completos, con la diferencia que permite la inclusión de observaciones replicadas por bloque (es decir, hay múltiples observaciones en y para algunas combinaciones de tratamiento y bloque) donde se puede violar el supuesto de normalidad.

La hipótesis nula es que, aparte de un efecto de bloques, el parámetro de ubicación de y es el mismo en cada uno de los tratamientos.

Si y es una matriz, los tratamientos y bloques se obtienen de los índices de columna y fila, respectivamente. Los NA no están permitidos en tratamientos o bloques.

Para calcular la estadística de Mack-Skillings para un número de réplicas iguales, primero se clasifican las observaciones de menor a mayor, por separado dentro de cada uno de los n bloques. Siendo S_{j} la suma de los rangos del tratamiento j, k el número de tratamientos, n el número de bloques, c el número de réplicas dentro de los bloques,
}
\examples{
# matrix input
Datos = matrix(c(7.58,7.87,7.71,11.63,11.87,11.4,15,15.92,15.58,8,8.27,8,12.2,11.7,
                 11.8,16.6,16.4,15.9,7.6,7.3,7.82,11.04,11.5,11.49,15.87,15.91,16.28,
                 8.03,7.35,7.66,11.5,10.1,11.7,15.1,14.8,15.7),9,4)
MS.Test(Datos,c=3)
}
