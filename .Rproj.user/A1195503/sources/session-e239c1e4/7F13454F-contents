#!/usr/bin/env Rscript
# Copy all files from quarto/ to project root
quarto_dir <- "quarto"
root_dir <- "."

# Check if quarto/ exists
if (!dir.exists(quarto_dir)) {
  stop("Error: quarto/ directory not found")
}

# Get all files in quarto/ (recursive)
files <- list.files(quarto_dir, recursive = TRUE, full.names = TRUE)

# Copy each file to root, preserving directory structure is not needed
for (file in files) {
  # Destination is just the basename in root
  dest <- file.path(root_dir, basename(file))
  # Copy file, avoid overwriting
  file.copy(file, dest, overwrite = TRUE)
}

message("Copied files from quarto/ to project root")
