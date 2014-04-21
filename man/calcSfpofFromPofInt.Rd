\name{calcSfpofFromPofInt}
\alias{calcSfpofFromPofInt}

\title{
  Calculate SFPOF results from interval failure probabilities
}
\description{
  For the flight-by-flight sequential importance sampling routine of the
  crackR package, the default is to output SFPOF at the start and end of
  a number of subintervals of flights. Also output in the results
  object is the probability
  of failure of each interval: \code{pof.int}. This function calculates
  and "average" value of
  SFPOF for each flight in each subinterval using \code{pof.int},
  yielding SFPOF results in the familiar format for plotting.
}
\usage{
calcSfpofFromPofInt(pof.int)
}

\arguments{
  \item{pof.int}{
    data.frame of the subintervals of a crackR run with columns
  indicating the number of flights in each interval and the failure
  probability of each interval. pof.int is standard output in a crackR run.
}
}

\details{
Like the
  interval version of the routine, SFPOF will converge more quickly for
  many problems when averaging estimates over a number of flights. Using
  this function to process flight-by-flight results will be approximate
  within each subinterval,
  but these will be less approximate in general than those obtained by
  the interval routine.
}

\value{
  data.frame of SFPOF results for printing or plotting
}

\author{
  Keith Halbert <keith.a.halbert@gmail.com>
}

\references{
  Halbert, K. "Estimation of Probability of Failure for Damage-Tolerant
  Aerospace Structures" PhD Thesis, Temple University Department of
  Statistics, Philadelphia, PA, Apr 2014
}

\seealso{
  \code{\link{analyze}}\cr
  \code{\link{plot.crackRresults}}

}

\keyword{reliability}
\keyword{aerospace}
\keyword{fatigue}
\keyword{damage tolerance}
