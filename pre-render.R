#!/usr/bin/env Rscript

# We want to render all of the files in the quarto/ subdirectory. However,
# doing so raises issues which cannot be addressed with the current
# rendering process.
# In order to work around this, we copy all of the files in quarto/ to
# the root directory and remove the quarto/ subdirectory.
# We do not want any of this taking place in a local rendering; only in
# the GitHub Actions rendering where none of these changes will be kept.

# Only allow rendering in the GitHub Actions environment
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


