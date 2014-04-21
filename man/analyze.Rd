\name{analyze}
\alias{analyze}
\title{
Perform a probabilistic damage tolerance analysis on a crackR object
}

\description{
This is the main analysis function for the sequential importance
sampling approach to probabilistic damage tolerance analysis in the crackR package. User can
enter an object of class crackRparameters or class crackR. If a
crackRparameters object is entered, crackRinit will be run to
initialize a crackR object. The sample size for an existing crackR
object can be increased by utilizing an existing crackR object and
specifying add=TRUE.
}

\usage{
analyze(obj,add=FALSE)
}

\arguments{
  \item{obj}{Object of class Sing, Mult, CD, or an appropriate list of
    input parameters}
  \item{add}{Logical, indicating whether this run will add trials to an existing run}
}

\details{
If add=TRUE, the number of particles specified in the input object
parameter Np will be added to the existing particle count and the
results will be weighted according to the existing particle count. The
new set of results, containing only the results of the subset run, will be
included in a new component of the output: 'new.results'. The cumulative
results will as before be contained in component 'results'. Note, if the
input object was already initialized using crackRinit, it's class will
be either Sing, Mult, or CD. If an uninitialized list of crackR
parameters is submitted, this function will attempt to initialize it.
}

\value{
  \item{state}{List containing vectors representing the final state of
    each particle}
  \item{parameters}{List of the analysis parameters (not altered by the
    running of analyze}
  \item{results}{List of the results of a single run (where add=FALSE)
    or of a cumulative set of runs (when add=TRUE)}
  \item{new.results}{List of the results for the latest run in a
    cumulative set of runs (when add=TRUE)}
}

\author{
  Keith Halbert <keith.a.halbert@gmail.com>
}

\seealso{
  \code{\link{crackRinit}}
}

\examples{
set.seed(327)

## cp7ext data is part of this package
data(cp7ext)

## prepare a crackR object for analysis
cp7ext.init <- crackRinit(cp7ext)

## perform analysis
cp7ext.out  <- analyze(cp7ext.init)

## Plot SFPOF and PCD results
plot(cp7ext.out)
}

\keyword{reliability}
\keyword{aerospace}
\keyword{fatigue}
\keyword{damage tolerance}
