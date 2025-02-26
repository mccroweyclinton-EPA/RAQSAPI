% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/bycounty.R
\name{aqs_quarterlysummary_by_county}
\alias{aqs_quarterlysummary_by_county}
\title{aqs_quarterlysummary_by_county}
\usage{
aqs_quarterlysummary_by_county(
  parameter,
  bdate,
  edate,
  stateFIPS,
  countycode,
  cbdate = NA_Date_,
  cedate = NA_Date_,
  return_header = FALSE
)
}
\arguments{
\item{parameter}{a character list or a single character string
which represents the parameter code of the air
pollutant related to the data being requested.}

\item{bdate}{a R date object which represents that begin date of the data
selection. Only data on or after this date will be returned.}

\item{edate}{a R date object which represents that end date of the data
selection. Only data on or before this date will be
returned.}

\item{stateFIPS}{a R character object which represents the 2 digit state
FIPS code (with leading zero) for the state being
requested. @seealso \code{\link[=aqs_states]{aqs_states()}} for the list of
available FIPS codes.}

\item{countycode}{a R character object which represents the 3 digit state
FIPS code for the county being requested (with leading
zero(s)). @seealso \code{\link[=aqs_counties_by_state]{aqs_counties_by_state()}} for the
list of available county codes for each state.}

\item{cbdate}{a R date object which represents a "beginning
date of last change" that indicates when the data was last
updated. cbdate is used to filter data based on the change
date. Only data that changed on or after this date will be
returned. This is an optional variable which defaults
to NA_Date_.}

\item{cedate}{a R date object which represents an "end
date of last change" that indicates when the data was last
updated. cedate is used to filter data based on the change
date. Only data that changed on or before this date will be
returned. This is an optional variable which defaults
to NA_Date_.}

\item{return_header}{If FALSE (default) only returns data requested.
If TRUE returns a AQSAPI_v2 object which is a two
item list that contains header information returned
from the API server mostly used for debugging
purposes in addition to the data requested.}
}
\value{
a tibble or an AQS_Data Mart_APIv2 S3 object that contains quarterly
summary statistics for the given parameter for a single countycode
and stateFIPS combination. An AQS_Data Mart_APIv2 is a 2 item named
list in which the first item (\$Header) is a tibble of header
information from the AQS API and the second item (\$Data) is a
tibble of the data returned.
}
\description{
\lifecycle{stable}
Returns a tibble or an AQS_Data Mart_APIv2 S3
object of quarterly summary data aggregated by cbsa
(Core Based Statistical Area) code.
}
\note{
The AQS API only allows for a single year of quarterly summary to be
retrieved at a time. This function conveniently extracts date
information from the bdate and edate parameters then makes repeated
calls to the AQSAPI retrieving a maximum of one calendar year of data
at a time. Each calendar year of data requires a separate API call so
multiple years of data will require multiple API calls. As the number
of years of data being requested increases so does the length of time
that it will take to retrieve results. There is also a 5 second wait
time inserted between successive API calls to prevent overloading the
API server. This operation has a linear run time of
/(Big O notation: O/(n + 5 seconds/)/).
}
\examples{
# returns a tibble containing quarterly summaries for
          #  FRM/FEM PM2.5 data for Wake County, NC between January
          #  and February 2016
 \dontrun{aqs_quarterlysummary_by_county(parameter = "88101",
                                         bdate = as.Date("20160101",
                                                          format = "\%Y\%m\%d"),
                                         edate = as.Date("20170228",
                                                          format = "\%Y\%m\%d"),
                                         stateFIPS = "37",
                                         countycode = "183"
                                        )
         }
}
\seealso{
Other Aggregate _by_county functions: 
\code{\link{aqs_annualsummary_by_county}()},
\code{\link{aqs_dailysummary_by_county}()},
\code{\link{aqs_monitors_by_county}()},
\code{\link{aqs_qa_annualperformanceeval_by_county}()},
\code{\link{aqs_qa_blanks_by_county}()},
\code{\link{aqs_qa_collocated_assessments_by_county}()},
\code{\link{aqs_qa_flowrateaudit_by_county}()},
\code{\link{aqs_qa_flowrateverification_by_county}()},
\code{\link{aqs_qa_one_point_qc_by_county}()},
\code{\link{aqs_qa_pep_audit_by_county}()},
\code{\link{aqs_quarterlysummary_by_site}()},
\code{\link{aqs_sampledata_by_county}()},
\code{\link{aqs_transactionsample_by_county}()}
}
\concept{Aggregate _by_county functions}
