% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/getOcc.R
\name{getOcc}
\alias{getOcc}
\title{getOcc}
\usage{
getOcc(species)
}
\arguments{
\item{species}{character, species binomial name}
}
\value{
This function downloads all records for a species from GBIF that 
have coordinates info. If necessary it loops several times to overcome the 
limit of 200,000 occurrences imposed by occ_search function. It returns a 
data table.
}
\description{
Downloads GBIF records iterating when necessary to overcome the limitation 
of 200,000 records
}
\examples{
sps_occurrence <- getOcc("Babiana tubulosa")
}
