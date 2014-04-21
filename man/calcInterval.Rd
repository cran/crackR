\name{calcInterval}

\alias{calcInterval}
\alias{calcInterval.Sing}
\alias{calcInterval.Mult}
\alias{calcInterval.CD}

\title{
  Advance crackR object to the next scheduled inspection
}

\description{
Advance in time through a single inspection interval,
adjusting the particle weights and reporting failure probabilities along
the way. Estimates of Single Flight Probability Of Failure (SFPOF) will
be calculated at intervals specified in the parameter flt.calc.interval,
along with the bootstrap estimates of quantiles of SFPOF (if
bootstrap.sfpof is TRUE) and an estimate of the probability of failure for each
subinterval.
}

\usage{
calcInterval(obj, interval.flights)
\method{calcInterval}{Sing}(obj,interval.flights)
\method{calcInterval}{Mult}(obj,interval.flights)
\method{calcInterval}{CD}(obj,interval.flights)
}

\arguments{
  \item{obj}{
    Object of class Sing, Mult, or CD (each of which is an initialized
  crackR object created with crackRinit)
  }
  \item{interval.flights}{
    Integer, number of flights in the interval
  }
}

\details{
  When the parameter survival.updating="fbf", the analysis
proceeds through the interval flight-by-flight (which takes longer to
run and is slower to converge). With survival.updating="int", an
approximate analysis is performed which proceeds in INTervals of several
flights-at-a-time (the number of flights for each subinterval being
determined by parameter flt.calc.interval). While approximate, the "int"
version will often converge on a solution more quickly, particularly if
failure due to reaching the so-called "critical crack length" is
likely. The SFPOF (and various other) results are output at intervals of
flt.calc.interval regardless of the value of survival.updating.
}

\value{
Object of class crackR, advanced in time to the next scheduled
  inspection and including SFPOF (and various other) results of the interval
}

\references{
  Halbert, K. "Estimation of Probability of Failure for Damage-Tolerant
  Aerospace Structures" PhD Thesis, Temple University Department of
  Statistics, Philadelphia, PA, Apr 2014
}

\author{
  Keith Halbert <keith.a.halbert@gmail.com>
}

\seealso{
  \code{\link{analyze}}
}

\examples{
data(cp7ext)
cp7ext$Np <- 200
cp7ext.init <- crackRinit(cp7ext)
cp7ext.next <- calcInterval(cp7ext.init, interval.flights=1000)
## crack lengths have grown
head(cp7ext.init$state)
head(cp7ext.next$state)
## SFPOF estimates for the interval are now present
cp7ext.next$results$sfpof
}

\keyword{reliability}
\keyword{aerospace}
\keyword{fatigue}
\keyword{damage tolerance}
