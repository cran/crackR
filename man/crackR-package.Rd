
\name{crackR-package}

\alias{crackR-package}
\alias{crackR}

\docType{package}

\title{
Probabilistic damage tolerance analysis for fatigue cracking of metallic aerospace structures
}

\description{
Using a sampling-based approach (either sequential importance sampling explicit Monte Carlo), this package can be used to perform a probabilistic damage tolerance for aircraft structures. It can model a single crack, or two simultaneously growing fatigue cracks (the so-called continuing damage problem). With a single crack, multiple types of future repairs are possible.
}

\details{
\tabular{ll}{
Package: \tab crackR\cr
Type: \tab Package\cr
Version: \tab 0.3-9\cr
Date: \tab 2014-04-21\cr
License: \tab GPL-3\cr
}

To run a crackR analysis, first create an object of class crackR. This
is accomplished by first creating an object of class
crackRparameters. This can be done by modifying a supplied data set,
such as with data(cp7). Use crackRinit() on the crackRparameters object
to generate the crackR object. To perform the analysis, use analyze() or
crackRmc().
}

\author{
  Keith Halbert\cr
  Maintainer: Keith Halbert <keith.a.halbert@gmail.com>
}

\references{
  MIL-STD-1530C (USAF) "General Guidelines For Aircraft Structural Integrity Program (ASIP)", Nov 2005\cr
  MIL-HDBK-1823A (Department of Defense, USA) "Nondestructive Evaluation
  System Reliability Assessment", Apr 2009\cr
  PRoF Ver. 3.0 PRobability of Fracture, Software Package, University of
  Dayton Research Institute, Dayton, OH, 2005\cr
  Halbert, K. "Estimation of Probability of Failure for Damage-Tolerant
  Aerospace Structures" PhD Thesis, Temple University Department of
  Statistics, Philadelphia, PA, Apr 2014
}

\seealso{
  \code{\link{crackRinit}}\cr
  \code{\link{analyze}}\cr
  \code{\link{crackRmc}}
}

\examples{
set.seed(327)
## cp7ext data is part of this package
data(cp7ext)
## prepare a crackR object for analysis
cp7ext.init <- crackRinit(cp7ext)
## perform sequential importance sampling analysis
cp7ext.out  <- analyze(cp7ext.init)
## Plot SFPOF and PCD results
plot(cp7ext.out)
}

\keyword{package}
\keyword{reliability}
\keyword{aerospace}
\keyword{fatigue}
\keyword{damage tolerance}
