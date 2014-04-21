
\name{plot.Sing}

\alias{plot.Sing}
\alias{plot.Mult}
\alias{plot.CD}
\alias{plot.crackRresults}
\alias{plot.crackRparallel}
\alias{lines.Sing}
\alias{lines.Mult}
\alias{lines.CD}
\alias{lines.crackRresults}
\alias{lines.crackRparallel}


\title{
  Plotting methods for various crackR objects
}

\description{
  These methods generate plots for the various crackR object classes
}

\usage{
\method{plot}{Sing}(x,sfpof.int=FALSE,...)
\method{plot}{Mult}(x,sfpof.int=FALSE,...)
\method{plot}{CD}(x,sfpof.int=FALSE,...)
\method{plot}{crackRresults}(x,boot=FALSE,thresh=NA,sfpof.int=FALSE,...)
\method{plot}{crackRparallel}(x,thresh=NA,sfpof.int=FALSE,...)
\method{lines}{Sing}(x,sfpof.int=FALSE,...)
\method{lines}{Mult}(x,sfpof.int=FALSE,...)
\method{lines}{CD}(x,sfpof.int=FALSE,...)
\method{lines}{crackRresults}(x,sfpof.int=FALSE,...)
\method{lines}{crackRparallel}(x,sfpof.int=FALSE,...)
}

\arguments{
  \item{x}{Object of appropriate class}
  \item{boot}{Logical. Whether to also plot bootstrap SFPOF estimates}
  \item{thresh}{Numeric. Plots a horizontal line on SFPOF plots
  at this value. If NA, no line is plotted.}
  \item{sfpof.int}{Logical. Whether SFPOF estimates should be approximated
  from the \code{pof.int} component of the results instead of the usual
  \code{sfpof} component}
  \item{\dots}{
    Optional additional arguments. Note the line type is hard-coded to
  \"l\"; trying to set a different type will currently cause an error.
  }
}

\value{
  NULL
}

\author{
  Keith Halbert <keith.a.halbert@gmail.com>
}

\seealso{
  \code{\link{crackRinit}}\cr
  \code{\link{analyze}}\cr
  \code{\link{analyzeParallel}}  
}

\keyword{reliability}
\keyword{aerospace}
\keyword{fatigue}
\keyword{damage tolerance}
