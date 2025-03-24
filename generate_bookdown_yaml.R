# === Auto-generate _bookdown.yml with all .md and .Rmd ===

# List all .md or .Rmd files recursively (excluding hidden/backup files)
files <- list.files(
  path = ".",
  pattern = "\\.R?md$",
  recursive = TRUE,
  full.names = TRUE
)

# Exclude _bookdown.yml, _output.yml, README, and files starting with underscore
files <- files[!grepl("^_", basename(files))]
files <- files[!basename(files) %in% c("README.md", "README.Rmd")]

# Sort files (optional: move index.Rmd to first)
files <- sort(files)
if ("index.Rmd" %in% files) {
  files <- c("index.Rmd", setdiff(files, "index.Rmd"))
}

# Build YAML text
yaml <- c(
  'book_filename: "1132 Readings of German Jurisprudence"',
  'clean: [packages.bib, bookdown.bbl]',
  'delete_merged_file: true',
  'language:',
  '  label:',
  '    fig: "圖 "',
  '    tab: "表 "',
  '  ui:',
  '    edit: "編輯"',
  '    chapter_name: ["第 ", " 章"]',
  'output_dir: "docs"',
  'rmd_subdir: true',
  'rmd_files:',
  paste0("  - ", files)
)

# Write it to _bookdown.yml
writeLines(yaml, "_bookdown.yml")
cat("✅ Generated _bookdown.yml with", length(files), "chapters.\n")