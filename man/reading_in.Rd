% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/funcs.R
\name{reading_in}
\alias{reading_in}
\title{Function for parsing the text output of FastQC}
\usage{
reading_in(file, test = "Per base sequence quality", sample_name = NULL)
}
\arguments{
\item{file}{string that specifies the path to an individual FastQC result file
(tyically named "fastqc_data.txt"}

\item{test}{Indicate which test results should be extracted. Default:
"Per base sequence quality". Other options are, for example, "Per tile sequence quality",
"Per sequence quality score" etc.}

\item{sample_name}{if sample name is given, we give the a column vector of the sample name in the
dataframe output, default = NULL}
}
\value{
data.frame with the values of a single FastQC test result.
}
\description{
This functions extracts the values for a specific test run by FastQC on a
single fastq file.
}
\details{
The command reads in the file being passed, from there it sed's the file
to grab between the test (default) value \verb{Per base sequence quality} and \code{END_MODULE}.
From there it grabs between the values via the grep and we get out table that's converted to a df.
}
\examples{
\dontrun{
res <- reading_in(file = "acinar-3_S9_L001_R1_001_fastqc/fastqc_data.txt")
}
}
