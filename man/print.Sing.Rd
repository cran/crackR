
\name{print.Sing}

\alias{print.Sing}
\alias{print.Mult}
\alias{print.CD}
\alias{print.stateSing}
\alias{print.stateMult}
\alias{print.stateCD}
\alias{print.crackRresults}
\alias{print.crackRparallel}
\alias{head.Sing}
\alias{head.Mult}
\alias{head.CD}
\alias{head.parametersSing}
\alias{head.parametersMult}
\alias{head.parametersCD}
\alias{head.stateSing}
\alias{head.stateMult}
\alias{head.stateCD}
\alias{head.crackRresults}
\alias{head.crackRparallel}
\alias{tail.Sing}
\alias{tail.Mult}
\alias{tail.CD}
\alias{tail.parametersSing}
\alias{tail.parametersMult}
\alias{tail.parametersCD}
\alias{tail.stateSing}
\alias{tail.stateMult}
\alias{tail.stateCD}
\alias{tail.crackRresults}
\alias{tail.crackRparallel}


\title{
  Printing methods for various crackR objects
}

\description{
  These methods do the expected printings of crackR objects
}
\usage{
\method{print}{Sing}(x,...)
\method{print}{Mult}(x,...)
\method{print}{CD}(x,...)
\method{print}{stateSing}(x,...)
\method{print}{stateMult}(x,...)
\method{print}{stateCD}(x,...)
\method{print}{crackRresults}(x,sfpof.int=FALSE,...)
\method{print}{crackRparallel}(x,sfpof.int=FALSE,...)
\method{head}{Sing}(x,...)
\method{head}{Mult}(x,...)
\method{head}{CD}(x,...)
\method{head}{parametersSing}(x,...)
\method{head}{parametersMult}(x,...)
\method{head}{parametersCD}(x,...)
\method{head}{stateSing}(x,...)
\method{head}{stateMult}(x,...)
\method{head}{stateCD}(x,...)
\method{head}{crackRresults}(x,sfpof.int=FALSE,...)
\method{head}{crackRparallel}(x,sfpof.int=FALSE,...)
\method{tail}{Sing}(x,...)
\method{tail}{Mult}(x,...)
\method{tail}{CD}(x,...)
\method{tail}{parametersSing}(x,...)
\method{tail}{parametersMult}(x,...)
\method{tail}{parametersCD}(x,...)
\method{tail}{stateSing}(x,...)
\method{tail}{stateMult}(x,...)
\method{tail}{stateCD}(x,...)
\method{tail}{crackRresults}(x,sfpof.int=FALSE,...)
\method{tail}{crackRparallel}(x,sfpof.int=FALSE,...)
}

\arguments{
  \item{x}{
    Object of appropriate class
  }
  \item{\dots}{
    Optional additional arguments
  }
  \item{sfpof.int}{Logical. Whether SFPOF estimates should be approximated
  from the \code{pof.int} component of the results instead of the usual
  \code{sfpof} component}
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
