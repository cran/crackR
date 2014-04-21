\name{crackRcalcSfpofMc}

\alias{crackRcalcSfpofMc}

\title{
  Calculates SFPOF by post-processing an explicit Monte Carlo analysis
  as performed by crackRmc.
}

\description{
  crackRmc will calculate SFPOF on the intervals specified for that
  function, along with the raw results of the simulation. If a different
  set of flight intervals for SFPOF is desired, this function can be
  used to do so without re-running the simulation.
}

\usage{
crackRcalcSfpofMc(fail.count,insp.intervals,calc.interval,sfpof.min=1e-16)
}

\arguments{
  \item{fail.count}{
    Vector of failure counts originating from a crackRmc run
  }
  \item{insp.intervals}{
    Vector of the inspection intervals which were used in the run (not
  cumulative); the subintervals for
  pooling SFPOF results will avoid overlapping an inspection flight
  }
  \item{calc.interval}{
    Length of the interval in flights to use to pool SFPOF estimates
  }
  \item{sfpof.min}{
    SFPOF estimates below this value will be raised to this value; this
  may be zero, though the estimates will not plot on the log-scale in
  that case
  }
}

\value{
  Returns an object of class crackRresults
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
  \code{\link{crackRmc}}
}

\keyword{reliability}
\keyword{aerospace}
\keyword{fatigue}
\keyword{damage tolerance}
