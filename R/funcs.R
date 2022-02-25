#' Function for parsing the text output of FastQC
#'
#' This functions extracts the values for a specific test run by FastQC on a
#' single fastq file.
#'
#' @param file string that specifies the path to an individual FastQC result file
#' (tyically named "fastqc_data.txt"
#' @param test Indicate which test results should be extracted. Default:
#' "Per base sequence quality". Other options are, for example, "Per tile sequence quality",
#' "Per sequence quality score" etc.
#' @param sample_name if sample name is given, we give the a column vector of the sample name in the
#' dataframe output, default = NULL
#'
#' @return data.frame with the values of a single FastQC test result.
#'
#' @examples \dontrun{
#' res <- reading_in(file = "acinar-3_S9_L001_R1_001_fastqc/fastqc_data.txt")
#' }
#' @details The command reads in the file being passed, from there it sed's the file
#' to grab between the test (default) value `Per base sequence quality` and `END_MODULE`.
#' From there it grabs between the values via the grep and we get out table that's converted to a df.
#'
#' @export
reading_in <- function(file, test = "Per base sequence quality", sample_name = NULL){

  ## generate the string that will be used for the file parsing
  syscommand <- paste0("sed -n '/", test, "/,/END_MODULE/p' ", file, " | grep -v '^>>'")

  ## use the fread command, which can interpret UNIX commands on the fly to
  ## read in the correct portion of the FastQC result
  dat <- data.table::fread( cmd = syscommand, header = TRUE) %>% as.data.frame
  if (!is.null(sample_name)){
    if(is.character(sample_name)){
      dat$sample_name = sample_name
    } else{
      stop("must provide sample name as character")
    }
  }
  return(dat)
}

#' get names
#' @param file_names pass file names, must be a character vector
#'
#' @param regexp regexp to look for in file name. Default `WT_rep[12]_ERR[0-9]{6}`
#' @return list of character strings
#' @export
get_names <- function(file_names, regexp = "WT_rep[12]_ERR[0-9]{6}"){
  out = stringr::str_extract(file_names, regexp)
  return(out)
}
