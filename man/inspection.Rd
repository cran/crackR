
\name{inspection}

\alias{inspection}
\alias{inspection.Sing}
\alias{inspection.Mult}
\alias{inspection.CD}

\title{
  Predict the results of a future scheduled inspection and update
  the state accordingly
}

\description{
Predict the results of a future scheduled inspection and update
the state accordingly. The state prior to inspection is utilized to
determine the likelihood of finding each particle, and the state after
inspection consists of a combination of missed particles and repaired
particles. The Probability of Crack Detection (PCD) results of this
inspection are appended to the previously existing PCD results (if any).
}

\usage{
inspection(obj,inspection.type=1)
\method{inspection}{Sing}(obj,inspection.type=1)
\method{inspection}{Mult}(obj,inspection.type=1)
\method{inspection}{CD}(obj,inspection.type=1)
}

\arguments{
  \item{obj}{Object of class crackR}
  \item{inspection.type}{Integer, index of which Probability Of
    Detection (POD) function from the
    parameters to utilize for this inspection.}
}

\details{
  The likelihood of finding each particle at a future inspection depends only
on the crack length at that time and the POD function (as specified by
inspection.type). The overall Probability of Crack Detection (PCD) is
found by taking a weighted average of the probability of detection for
each particle and the importance weights.\cr
Suppose there is a 40\% chance of finding a particular
  particle. That particle will remain in the state, but to reflect the
  possibility that it was not found, the weight is reduced to 60\% of
  the weight prior to inspection. The remaining weight will be used when
  generating new repaired particles (by sampling from the repair flaw
  size distribution). The total weight that is found for all particles
  is the estimate of PCD for this inspection (optionally partitioned
  into several crack length ranges using pod.threshold). After inspection, the weight of the
  repaired particles will sum to PCD, and the weight of the missed
  particles will sum to (1-PCD). Note also that the set of particles
  will be re-sampled without replacement to reduce the particle count
  back to parameters$Np.
}

\value{
  Object of class crackR.
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
  \code{\link{crackRinit}}\cr
  \code{\link{analyze}}\cr
  \code{\link{calcInterval}}
}

\keyword{reliability}
\keyword{aerospace}
\keyword{fatigue}
\keyword{damage tolerance}

\examples{
set.seed(327)
data(cp7ext)

## initialize crackR object
cp7ext.init <- crackRinit(cp7ext)

## advance through time 6000 flights
cp7ext.before.insp <- calcInterval(cp7ext.init, interval.flights=6000)

## conduct inspection
cp7ext.after.insp <- inspection(cp7ext.before.insp)

## print inspection results
cp7ext.after.insp$results$pcd

}
