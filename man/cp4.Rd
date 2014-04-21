
\name{cp4}

\alias{cp4}
\alias{cp6}
\alias{cp7}
\alias{cp7ext}
\alias{cp7ext.Mult.simple}
\alias{cp7ext.Mult.complex}
\alias{cp7.CD}

\docType{data}

\title{
  Examples CP4, CP6, and CP7, adapted from PRobability Of
  Fracture (PROF) v3.0 documentation (in various forms).
}

\description{
  Examples CP4, CP6 and CP7 are adapted from the documentation of
the software PRobability Of Fracture (PROF) v3.0. The data has been
modifed from the documentation in the following ways: crack growth
is indexed to number of flights instead of flight hours; probability
of inspection is set to 1.0; and the PROF parameter 'number of similar
locations' is not part of this routine (effectively always set equal to
1). For example CP7ext, the crack growth and geometry curves have been
extrapolated to a larger final crack size. The objects cp4, cp6, cp7,
and cp7ext are of analysis type 'single'; i.e., there is a single damage
tolerance analysis (DTA) associated with each. cp7ext.Mult.simple and
cp7ext.Mult.complex are of the 'multiple' type; i.e., there are two or
three DTAs associated, respectively. Finally, cp7.CD is of the
continuing damage variety. Any one of these can be used as a
starting point for creating a new probabilistic damage tolerance
analysis problem, though it is recommended to use the appropriate type
(single, multiple, or continuing damage) due to differences regarding
  the structure of each list. All parameters are discussed in detail
  below along with an indication of whether they apply to Sequential
  Importance Sampling (SIS) or Explicit Monte Carlo (EMC). This
  information is repeated from \code{\link{crackRinit}}.
}

\details{

  \itemize{ 
    \item \code{Np} -- integer -- SIS/EMC -- number of Monte Carlo samples to utilize
      \itemize{ 
        \item For SIS (e.g., using \code{analyze}) this is the number of
  particles in the set. In this case the complete set of particles is
  carried through the analysis, so \code{Np} > several million may use
  up available memory. If many millions of particles are needed, the
  runs can be split and re-combined later either by using
  \code{analyzeParallel} or by using the \code{add=TRUE} option in \code{analyze}.\cr

    For EMC run (using \code{crackRmc}) this is the
    number of trials. Detailed results of each trial are not maintained,
    thus many millions is fine from a memory standpoint. \code{crackRmc}
    is NOT fast, so testing a run with \code{Np} around 1000 is
    recommended (see \code{\link{system.time}}).
      }
    }

    \itemize{
      \item \code{analysis.type} -- character -- SIS/EMC -- the type of
      probabilistic damage tolerance analysis being performed, be it a
      single-type at a single crack ('single'), multiple-type at a
      single crack ('multiple'), or a continuing damage analysis
      involving two cracks ('CD')
      \itemize{
	\item Must be either 'single', 'multiple', or 'CD'. For an SIS
      run, this determines the class of the object created by
      \code{crackRinit} (either \code{Sing}, \code{Mult}, or
      \code{CD}). For an EMC run, the appropriate method of
      \code{crackRmc} is selected according to this parameter.
      }
    }

    \itemize{
      \item \code{survival.updating} -- character -- SIS -- whether to proceed
      flight-by-flight ('fbf') or in intervals ('int')
      \itemize{
	\item Must be either 'fbf' or 'int' for an SIS run
      (specifically, in \code{calcInterval}). This
      parameter is not used in an EMC run
      (\code{crackRmc}).
      }
    }
    
    \itemize{
      \item \code{flt.calc.interval} -- integer -- SIS/EMC -- frequency of output of SFPOF
      calculations in number of flights for each sub-interval
      \itemize{
	\item Regardless of the value of
      \code{survival.updating}, SFPOF
      is calculated and output at the beginning and end of sub-intervals of
      length \code{flt.calc.interval}. The actual sub-interval lengths
      will often vary slightly since sub-intervals are forced to end at
      a scheduled inspection. The sub-intervals within an inspection
      interval are rounded to integers which minimize the variation from
      \code{flt.calc.interval}. A value of 1 may be used, but for long
      service lives the results object may become large and calculation
      speeds may suffer.
      }
    }

    \itemize{
      \item \code{sfpof.threshold} -- numeric -- SIS/EMC -- if specified, a horizontal line will appear
      on results plots at this value.
      \itemize{
	\item This parameter is not currently used for anything
      important.
      }
    }

    \itemize{
      \item \code{sfpof.min} -- numeric -- SIS/EMC -- minimum value of SFPOF to include in results
      \itemize{
	\item If > 0, SFPOF calculated below \code{sfpof.min} will be
      recorded as \code{sfpof.min}. If = 0, SFPOF will be allowed to be
      zero in results. In
      this case, when plotting SFPOF on the log scale, warnings will be
      issued and the plot will not appear at the zero values.
      }
    }

    \itemize{
      \item \code{bootstrap.sfpof} -- logical -- SIS -- whether or not to
      perform obtain bootstrap confidence intervals of SFPOF during a run
      \itemize{
	\item If bootstrap confidence intervals are desired, set this
      parameter to \code{TRUE}. The number of bootstrap samples to
      generate at each calculation of SFPOF is set by
      \code{bootstrap.samples} and the desired quantiles to estimate by
      \code{bootstrap.quantiles}. Results will be in additional
      column(s) with SFPOF in the SFPOF data.frame of the
      crackRresults object. Note that there are many SFPOF calculations
      and using a large number of bootstrap samples may significantly
      increase the run time.
      }
    }

    \itemize{
      \item \code{bootstrap.pcd} -- logical -- SIS -- whether or not to
      perform obtain bootstrap confidence intervals of PCD during a
      scheduled inspection
      \itemize{
	\item If bootstrap confidence intervals are desired, set this
      parameter to \code{TRUE}. The number of bootstrap samples to
      generate at each calculation of PCD is set by
      \code{bootstrap.samples} and the desired quantiles to estimate by
      \code{bootstrap.quantiles}. Results will be in additional
      column(s) with PCD in the PCD data.frame of the
      crackRresults object. Inspections occur less frequently than SFPOF
      calculations, but large values of \code{bootstrap.samples} may significantly
      increase the run time.
      }
    }

    \itemize{
      \item \code{bootstrap.samples} -- integer -- SIS -- number of
      bootstrap samples to take for either SFPOF or PCD
      \itemize{
	\item More samples = better bootstrap estimates of the quantiles
      of the sampling distribution(s), with more samples taking longer
      to run. Note the bootstrap run time is also a function of the
      number of particles (\code{Np}).
      }
    }

    \itemize{
      \item \code{bootstrap.quantiles} -- numeric -- SIS -- quantile(s)
      at which to estimate the sampling distribution of either SFPOF or PCD
      \itemize{
	\item this is simply the \code{probs} argument to the
      \code{\link{quantile}} function.
      }
    }

    \itemize{
      \item \code{ms.gumbel} -- numeric -- SIS/EMC -- vector of length
      two specifying the location (loc) and scale parameters for the
      Gumbel distribution which describes the maximum applied stress per flight
      \itemize{
	\item For example: \code{cp4$ms.gumbel <- c(loc=31.079,
	  scale=0.832)}
	\item The names "loc" and "scale" are required!
	\item \code{crackR} is currently hard-coded to utilize the
      Gumbel distribution for max stress per flight. Expanding to a
      generic distribution is not difficult; it just hasn't been done
      yet. Mostly this is because max stress per flight is almost always
      Gumbel distributed in the literature, so I haven't bothered.
      }
    }

    \itemize{
      \item \code{inspections} -- data.frame -- SIS/EMC -- specification
      of inspection intervals (in number of flights) and the inspection
      type to occur at the end of the interval
      \itemize{
	\item For example: \code{cp4$inspections <- data.frame(flt.interval = c(4615,2308,2308), type = c(1,2,1))}
	\item The names "flt.interval" and "type" are required!
	\item The above example specifies three inspection intervals
      over the \code{4615+2308+2308=9231} flights. The three inspections
      are of types 1, 2, and 1, respectively, which refers to parameter \code{pod.func}.
      }
    }

    \itemize{
      \item \code{pod.func} -- list -- SIS/EMC -- list of POD functions
      \itemize{
	\item For example: \code{cp7ext$pod.func <- list(); cp7ext$pod.func[[1]] <- function(a)
      lognormalPOD(a, 0.03, 1); cp7ext$pod.func[[2]] <-
      function(a) lognormalPOD(a, 0.01, 1)}
        \item The above example specifies two POD curves. At inspection
      time the parameter \code{inspections} specifies which of these to
      use. If the inspection type calls for a POD curve that is not
      specified here, errors will occur. See \code{\link{lognormalPOD}}
      and \code{\link{inspection}}.
      }
    }

    \itemize{
      \item \code{pod.threshold} -- numeric -- SIS/EMC -- either a
      matrix or a vector specifying the crack sizes at which different
      severities of repair will occur (see below for details)
      \itemize{
	\item For a run of \code{analysis.type=="single"} or
      \code{analysis.type=="CD"}, this is a weakly increasing vector of
      thresholds at
      which to partition the PCD results. For example, if = 0, then no
      partitioning will occur; if = c(0.01, 0.05), then PCD will be
      split into three: a < 0.01, 0.01 < 0.05, and a > 0.05.
        \item For \code{analysis.type=="multiple"}, there is more than
      one type of repair that is possible and the behavior of each is
      different. Because of this, \code{pod.threshold} is an upper triangular matrix of
      dimension \code{c(dta.types, dta.types)}, where each row is the
      POD threshold vector for that type. Note each row must be weakly
      increasing from left to right. It is upper triangular since it is
      assumed that a repair can only get more severe...unless the part
      is replaced because the crack grew to exceed the largest threshold
      value. This is admittedly confusing, so here's an example. Suppose there are two
      DTA types describing the possible condition at a single fastener hole, where the first represents the as-manufactured
      condition and the second represents an oversized fastener
      installation. Suppose
      \code{pod.threshold==matrix(c(0.005,NA,0.25,0.005), nrow=2,
      ncol=2)}. For a type 1 particle, the POD threshold values used are
      taken from the first row of this matrix: c(0.005, 0.25). If a
      crack is found smaller than 0.005, it can be repaired to
      as-manufactured condition. If 0.005 < a < 0.25, the oversized
      fastener is installed and the type switches to type 2 as a
      result of the inspection being performed. If a >
      0.25, the part is replaced (back to type 1). If instead when
      heading into inspection the repair was of type 2, then
      \code{pod.threshold==0.005}. If the found crack is smaller than
      0.005, it can be repaired back to the oversized fastener condition
      (but not back to type 1, a smaller fastener). If a > 0.005, the
      part must be replaced (since the oversized fastener repair has
      already been utilized and no other repair is possible). Note that
      zero and Inf values may be used. Also the NA values can optionally
      be zero as they are not used by the code.
      }
    }

    \itemize{
      \item \code{dta.types} -- integer -- SIS/EMC -- number of Damage
      Tolerance Analysis (DTA) data sets present in the analysis
      \itemize{
	\item This is used only for \code{analysis.type=="multiple"} in
      the methods corresponding to a \code{crackR} object of class
      \code{Mult}.
      }
    }

    \itemize{
      \item \code{ismc.bool} -- logical -- EMC -- whether or not to
      utilize importance sampling to set the initial state in an EMC run
      \itemize{
	\item If \code{FALSE} standard Monte Carlo sampling is used and
      the initial crack size will be generated using, for example,
      ifs.ractual.
        \item If \code{TRUE} importance sampling is used and the initial
      size will be generated using ifs.rsamp instead. Subsequently
      ifs.dsamp and ifs.dactual are used to determine the importance
      weights.
        \item See parameter \code{dta} for more information regarding
      specification of initial flaw size distributions
      }
    }

    \itemize{
      \item \code{cg.cc} -- numeric -- SIS/EMC -- critical crack length
      for a run of either \code{analysis.type=="single"}
      or \code{analysis.type=="multiple"}
      \itemize{
	\item The crack length at which failure is assumed to occur with
      certainty. Note that if cg.cc is larger than the largest values in
      the DTA data item \code{cg}, linear extrapolation will occur until
      reaching cg.cc. If cg.cc is smaller than the largest values of
      said table, failure will occur earlier.
        \item Generally cg.cc should be set to the last value of crack
      length in the DTA data item \code{cg}.
      }
    }
    
    \itemize{
      \item \code{cg.cc.pc/cg.cc.ph/cg.cc.sc/cg.cc.sh} -- numeric -- SIS/EMC -- critical crack length
      for a run of \code{analysis.type=="CD"}
      \itemize{
	\item For a continuing damage analysis, there are two cracks
      involved (primary and secondary), each of which can be in either a 'cold' state or a 'hot'
      state, depending on whether the other crack has previously reached
      critical size. Thus there are four sets of DTA data: primary cold (dta.pc),
      primary hot (dta.ph), secondary cold (dta.sc), and secondary hot (dta.sh). See below for more
      details.
        \item The various critical crack sizes associated with a
      continuing damage analysis are as follows: cg.cc.pc, the length at
      which the primary crack goes critical (secondary goes hot);
      cg.cc.sc, the length at which the secondary crack goes critical
      (primary goes hot); cg.cc.ph, the length at which a primary hot crack
      fails; and cg.cc.sh, the length at which a secondary hot crack fails.
      }
    }

    \itemize{
      \item \code{dta} -- list -- SIS/EMC -- deterministic damage
      tolerance analysis input data for \code{analysis.type=="single"}
      or \code{analysis.type=="multiple"}. There are several components to this list, each discussed in
      turn below. Note that for \code{analysis.type=="single"}, this is a list of the
      following parameters. For \code{analysis.type=="multiple"}, dta is a
      "list of lists", where each item of the list (e.g., dta[[1]]) is a
      complete dta listing representing that type of part condition.
      \itemize{
	\item \code{cg} -- data.frame -- crack growth data with columns
      \code{flight} and \code{crack}; note this differs from some other
      probabilistic damage tolerance analysis codes which are indexed to
      flight hours instead of flight numbers. Linear extrapolation will
      occur using the last two rows of this table if cg.cc is larger
      than the last crack size in the table.
        \item \code{geo} -- data.frame -- geometry data relating crack
      length to normalized stress intensity K/sigma with columns
      \code{crack} and \code{ksig}. The data in this table is not
      extrapolated; if a K/sigma value is needed for a crack size beyone
      the end of this table, the final value of K/sigma will be
      used.
	\item \code{kc.rsamp} -- function -- generates values from
      fracture toughness distribution
        \item \code{ifs.rsamp} -- function -- generates values from
      initial flaw size sampling distribution
        \item \code{ifs.dsamp} -- function -- density function for
      initial flaw size sampling distribution
        \item \code{ifs.ractual} -- function -- generates values from
      initial flaw size actual distribution
        \item \code{ifs.dactual} -- function -- density function for
      initial flaw size actual distribution
        \item \code{rfs.rsamp} -- function -- generates values from
      repair flaw size sampling distribution
        \item \code{rfs.dsamp} -- function -- density function for
      repair flaw size sampling distribution
        \item \code{rfs.ractual} -- function -- generates values from
      repair flaw size actual distribution
        \item \code{rfs.dactual} -- function -- density function for
      repair flaw size actual distribution
      }
    }

    \itemize{
      \item \code{dta.pc/dta.ph/dta.sc/dta.sh} -- list -- SIS/EMC -- deterministic damage
      tolerance analysis input data for a continuing damage run
      \itemize{
	\item For a continuing damage run there are four distinct sets
      of DTA data, primary cold (dta.pc),
      primary hot (dta.ph), secondary cold (dta.sc), and secondary hot
      (dta.sh). The cracks become hot at cg.cc.pc or cg.cc.sc, and fail
      at cg.cc.ph or cg.cc.sh.
        \item At manufacture and following a repair, cracks are always
      'cold'. Hence \code{dta.pc} and \code{dta.sc} need to have the various
      distributions for fracture toughness and initial flaw size, but
      \code{dta.ph} and \code{dta.sh} don't require them.
      }
    }
  }

\usage{
data(cp4)
data(cp6)
data(cp7)
data(cp7ext)
data(cp7ext.Mult.simple)
data(cp7ext.Mult.complex)
data(cp7.CD)
}

\format{
List (class Sing, Mult, or CD).
}

\source{
PRoF Ver. 3.0 PRobability of Fracture, Software Package, University of
Dayton Research Institute, Dayton, OH, 2005
}

\references{
  Halbert, K. "Estimation of Probability of Failure for Damage-Tolerant
  Aerospace Structures" PhD Thesis, Temple University Department of
  Statistics, Philadelphia, PA, Apr 2014
}

\examples{
data(cp7)
head(cp7)
}

\keyword{datasets}
\keyword{reliability}
\keyword{aerospace}
\keyword{fatigue}
\keyword{damage tolerance}
