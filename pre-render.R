#!/usr/bin/env Rscript
# Only run in GitHub Actions environment
if (Sys.getenv("GITHUB_ACTIONS") != "true") {
  stop("Rendering is only allowed in GitHub Actions")
}

# Move all files from quarto/ to project root, overwriting
# existing files, then delete quarto/
quarto_dir <- "quarto"
root_dir <- "."

# Get all files in quarto/ (non-recursive, no subdirectories)
all_files <- list.files(quarto_dir, full.names = TRUE)

# Move each file to root
for (file in all_files) {
  dest <- file.path(root_dir, basename(file))
  file.rename(file, dest)  # Overwrites if dest exists
}

# Delete the quarto/ directory and its contents
unlink(quarto_dir, recursive = TRUE)

message("Moved all files from quarto/ to project root and deleted quarto/")
