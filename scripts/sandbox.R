# Processing Maniufest file 

# Load libraries
library(jsonlite)
library(dplyr)

# Read the JSON data from the raw GitHub URL
url <- "https://raw.githubusercontent.com/hamidghaedi/sequencing_benchmark_datasets/main/files/sra_explorer_metadata.json"
data <- fromJSON(url)

library(curl)

download_ftp_dir <- function(ftp_url, local_dir) {
  # ensure trailing slash on both URLs and paths
  if (!grepl("/$", ftp_url))    ftp_url   <- paste0(ftp_url, "/")
  if (!dir.exists(local_dir))    dir.create(local_dir, recursive = TRUE)
  
  # get directory listing (names only)
  h <- new_handle(dirlistonly = TRUE)
  lst <- curl_fetch_memory(ftp_url, handle = h)
  items <- strsplit(rawToChar(lst$content), "\r\n", fixed = TRUE)[[1]]
  items <- items[nzchar(items)]
  
  for (name in items) {
    if (name %in% c(".", "..")) next
    
    remote_path <- paste0(ftp_url, name)
    local_path  <- file.path(local_dir, name)
    
    # try as file
    ok <- TRUE
    tryCatch(
      curl_download(remote_path, local_path, quiet = TRUE),
      error = function(e) ok <<- FALSE
    )
    
    # if download-as-file failed, assume it's a directory and recurse
    if (!ok) {
      download_ftp_dir(remote_path, local_path)
    }
  }
}

# — Usage —
download_ftp_dir(
  ftp_url   = "ftp://ftp-trace.ncbi.nlm.nih.gov/ReferenceSamples/seqc/Somatic_Mutation_WG/tools/NGS_Preprocessing_Pipeline",
  local_dir = "./scripts/ngs_preprocessing_pipeline"
)