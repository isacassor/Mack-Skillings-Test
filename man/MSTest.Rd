\name{Mack-Skillings Test}
\alias{MS Test}
\title{Mack-Skillings Test}
\description{
Performs a Mack-Skillings test with replicated (balanced) block data.
}
\usage{
MS.Test(y, c, ...)

## Default method:
MS.Test(y, c)

## Method for class formula:
MS.Test(formula, c, data)
}
\arguments{
\code{y} data matrix with blocks in the rows and treatments in the columns.

\code{c} number of repetitions/replicas.

\code{formula} a formula of the form \code{x~t|b} where \code{x}, \code{t} and \code{b} give the data values and corresponding groups (treatments) and blocks, respectively.

\code{data} an obligatory argument if \code{formula} is specified.
}
\details{

MS.Test is an extension of the Friedman test, it can be used to analyze complete block designs, with the difference that it allows the inclusion of replicated observations per block (that is, there are multiple observations in and for some combinations of treatment and block ) where the assumption of normality can be violated.

The null hypothesis is that, apart from a block effect, the location parameter of y is the same in each of the treatments.

If y is a matrix, the treatments and blocks are obtained from the column and row indices, respectively. NAs are not allowed in treatments or blocks.

To calculate the Mack-Skillings statistic for a number of equal replicates, the observations are first ranked from smallest to largest, separately within each of the n blocks. S_{j} being the sum of the ranks of the treatment j, k the number of treatments, n the number of blocks, c the number of replications within the blocks.
}
\value{
A list with class "\code{htest}" containing the following components

\code{statistic} the value of Skillings-Mack statistic

\code{p.value} p-value of the test.

\code{method} the character string "\code{Skillings-Mack Test}"

\code{data.name} a character string givind the names of the data.
}
\references{
Myles Hollander, Douglas A. Wolfe y Eric Chicken (2014), Nonparametric Statistical Methods. John Wiley & Sons, Inc., Hoboken, New Jersey. Pages 354-363.
}
\examples{
# Ejemplos con datos de Hollander, Wolfe (2014). Pg. 356.

# matrix input
Datos = matrix(c(7.58,7.87,7.71,11.63,11.87,11.4,15,15.92,15.58,8,8.27,8,12.2,11.7,
                 11.8,16.6,16.4,15.9,7.6,7.3,7.82,11.04,11.5,11.49,15.87,15.91,16.28,8.03,7.35,
                 7.66,11.5,10.1,11.7,15.1,14.8,15.7),9,4)
MS.Test(Datos,c=3)

#	 Skillings-Mack Test

# data:  Datos
# MS = 12.927, p-value = 0.004796
## => Con una significancia del 0.05 se concluye que hay evidencia suficiente para rechazar la hipotesis nula y por lo tanto hay
## una diferencia significativa entre los tratamientos.


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
## => Con una significancia del 0.05 se concluye que hay evidencia suficiente para rechazar la hipótesis nula y por lo tanto hay
## una diferencia significativa entre los tratamientos.
}
