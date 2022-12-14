% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/openend.R
\name{openend}
\alias{openend}
\title{Open ended variable helper}
\usage{
openend(oe, x, pnum)
}
\arguments{
\item{oe}{A dataframe of OE responses}

\item{x}{A col number}

\item{pnum}{A project number to use for exported files in format "P9999"}
}
\value{

}
\description{
Exports comments and formats file name nicely for delivery.  Use with a for loop to run through all OE vars.
}
\examples{

for(i in 1:length(names(oe))) {
    openend(oe, i, "P9999")
}
}
