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

\code{MS.Test} is an extension of the Friedman test, it can be used to analyze complete block designs, with the difference that it allows the inclusion of replicated observations per block (that is, there are multiple observations in and for some combinations of treatment and block ) where the assumption of normality can be violated.

The null hypothesis is that, apart from a block effect, the location parameter of \code{y} is the same in each of the treatments.

If \code{y} is a matrix, the treatments and blocks are obtained from the column and row indices, respectively. \code{NA}'s are not allowed in treatments or blocks.

To calculate the Mack-Skillings statistic for a number of equal replicates, the observations are first ranked from smallest to largest, separately within each of the n blocks. \code{S[j]} being the sum of the ranks of the treatment \code{j}, \code{k} the number of treatments, \code{n} the number of blocks, \code{c} the number of replications within the blocks.
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
# Hollander & Wolfe (2014). Pg. 356.

# matrix input
Data = matrix(c(07.58, 07.87, 07.71, 11.63,
                11.87, 11.40, 15.00, 15.92,
                15.58, 08.00, 08.27, 08.00,
                12.20, 11.70, 11.80, 16.60,
                16.40, 15.90, 07.60, 07.30,
                07.82, 11.04, 11.50, 11.49,
                15.87, 15.91, 16.28, 08.03,
                07.35, 07.66, 11.50, 10.10,
                11.70, 15.10, 14.80, 15.70),9,4)
MS.Test(Data, c = 3)

#	 Skillings-Mack Test

# data:  Data
# MS = 12.927, p-value = 0.004796

## With a significance of 0.05, it is concluded that there is
## enough evidence to reject the null hypothesis and therefore
## there is a significant difference between the treatments.

# formula input
Data = data.frame(x = c(07.58, 07.87, 07.71, 11.63,
                        11.87, 11.40, 15.00, 15.92,
                        15.58, 08.00, 08.27, 08.00,
                        12.20, 11.70, 11.80, 16.60,
                        16.40, 15.90, 07.60, 07.30,
                        07.82, 11.04, 11.50, 11.49,
                        15.87, 15.91, 16.28, 08.03,
                        07.35, 07.66, 11.50, 10.10,
                        11.70, 15.10, 14.80, 15.70),
                  treatments = as.factor(c(rep("lab1",9),
                                           rep("lab2",9),
                                           rep("lab3",9),
                                           rep("lab4",9))),
                  blocks = as.factor(c(rep(c(rep("0",3),
                                             rep("4",3),
                                             rep("8",3)),
                                             4))))

MS.Test(x ~ treatments | blocks, c = 3, data = Data)

#	 Skillings-Mack Test

# data:  Data
# MS = 12.927, p-value = 0.004796

## With a significance of 0.05, it is concluded that there is
## enough evidence to reject the null hypothesis and therefore
## there is a significant difference between the treatments.
}
