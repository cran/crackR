
\name{crackRmc}

\alias{crackRmc}
\alias{crackRmc.Sing}
\alias{crackRmc.Mult}
\alias{crackRmc.CD}

\title{
  Performs a probabilistic damage tolerance analysis using explicit
  Monte Carlo sampling
}
\description{
  The main focus of the crackR package is on the sequential importance
  sampling approach to probabilistic damage tolerance analysis. As part
  of the work creating that approach, an explicit sampling routine was
  created for validation of results. It proceeds by repeatedly
  simulating the life cycle, flight-by-flight, and finding the first
  flight to failure for each trial. This approach requires many millions
  of samples to yield useful SFPOF estimates, but provided a sanity
  check for the results of the sequential importance sampling
  routine. Scheduled inspections may be included. If there are no
  scheduled inspections, the user may utilize importance sampling to set
  the initial state and drastically speed up convergence of the SFPOF
  estimates. The parameters for running this analysis are the same as
  those of the sequential importance sampling routine.
}
\usage{
crackRmc(parameters)
\method{crackRmc}{Sing}(parameters)
\method{crackRmc}{Mult}(parameters)
\method{crackRmc}{CD}(parameters)
}

\arguments{
  \item{parameters}{Object of class parametersSing,
  parametersMult, or parametersCD (or a list that looks like one of
  these classes, which are simply lists themselves.)}
}

\details{
  Several items in the input list of parameters are either specific to
  the explicit MC approach, or important for it. ismc.bool indicates
  whether importance sampling should be used to set the initial state,
  in which case the function will look for, for example, the
  distribution sampling function ifs.rsamp to
  set the initial state instead of ifs.ractual. Np is the number of
  trials in this case; be warned, millions will take a VERY long time,
  so I suggest starting with 1,000 to check the speed on your
  machine. For a detailed description of each input parameter, see the
  provided examples (\code{\link{cp4}}).
}

\value{
  A crackRresults object, along with an additional list of the raw data
  from the MC run for later re-processing.
}

\author{
  Keith Halbert <keith.a.halbert@gmail.com>
}

\references{
  Halbert, K. "Estimation of Probability of Failure for Damage-Tolerant
  Aerospace Structures" PhD Thesis, Temple University Department of
  Statistics, Philadelphia, PA, Apr 2014
}

\note{
  This function could benefit strongly from parallelization, so let me
  know if you intend to use this function and we can probably get that going.
}

\seealso{
  \code{\link{crackRmc}}
}

\examples{
data(cp7ext)
cp7ext.ismc <- cp7ext
## importance sampling run (much faster)
cp7ext.ismc$ismc.bool <- TRUE
## this is very few samples for demo only
cp7ext.ismc$Np <- 2000
## only one inspection interval may be included with importance sampling
cp7ext.ismc$inspections <- data.frame(flt.interval=3000, type=1)
## set a low SFPOF minimum so we can see results
cp7ext.ismc$sfpof.min <- 1e-30
out.ismc <- crackRmc( cp7ext.ismc )
plot(out.ismc)
}

\keyword{reliability}
\keyword{aerospace}
\keyword{fatigue}
\keyword{damage tolerance}
