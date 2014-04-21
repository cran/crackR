\name{analyzeParallel}

\alias{analyzeParallel}

\title{
  Perform multiple parallel runs of a probabilistic damage tolerance
  analysis on a crackR object
}

\description{
  One powerful method for assessing convergence of a sequential
  importance sampling analysis is to run parallel sequences. This
  function does this, saving only the results (of class
  crackRresults). Results are returned in a list. Note parallelization
  is not performed, the analyses are run sequentially...thus
  this is a convenience function and a placeholder for the time being.
}

\usage{
analyzeParallel(obj,n.parallel=3)
}

\arguments{
  \item{obj}{
    Object of class Sing, Mult, or CD
}
  \item{n.parallel}{
    Number of parallel sequences to run
}
}

\value{
  List of crackRresults components
}

\author{
  Keith Halbert <keith.a.halbert@gmail.com>
}

\seealso{
  \code{\link{analyze}}
}

\examples{
set.seed(327)
## cp7ext data is part of this package
data(cp7ext)
## prepare a crackR object for analysis
cp7ext.init <- crackRinit(cp7ext)
## perform 2 parallel runs
cp7ext.out.2  <- analyzeParallel(cp7ext.init, n.parallel=2)
## Plot SFPOF results
plot(cp7ext.out.2)
}

\keyword{reliability}
\keyword{aerospace}
\keyword{fatigue}
\keyword{damage tolerance}

