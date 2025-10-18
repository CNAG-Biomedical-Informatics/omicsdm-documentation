#!/usr/bin/env Rscript
# Author: Manuel Rueda (manuel.rueda@cnag.eu)
# Date: Oct-17-2025
# Version: 0.1
#
# Minimal filename validator for the 3TR clinical naming convention.
# Usage: Rscript validate_filename_simple.R <filename>
# Exits 0 if valid, 1 if invalid.

pattern <- paste0(
  "^[A-Z0-9]+_[A-Z0-9]+_[A-Za-z0-9-]+_",
  "(?:REDCAP-(?:RAW|LABEL|DICT)|CSV-RAW|CDISC)_",
  "\\d{8}_",
  "(?:PASS|FAIL|PARTIAL|NA)-[A-Z0-9]+",
  "(?:_CONV-(?:OMOP|PXF|BFF)(?:-[0-9]+(?:[._][0-9]+)*)?)?",
  "\\.(?:csv|json|txt|yaml)$"
)

args <- commandArgs(trailingOnly = TRUE)

if (length(args) != 1) {
  cat("Usage: Rscript validate_filename_simple.R <filename>\n")
  quit(status = 1)
}

name <- args[[1]]
if (grepl(pattern, name, perl = TRUE)) {
  cat("OK", name, "\n")
  quit(status = 0)
} else {
  cat("INVALID", name, "\n")
  quit(status = 1)
}
