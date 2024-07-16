# https://chatgpt.com/c/9f7c2674-9b08-4b3c-8d72-6b7f1b009d09

### \$ subpath, sourcename = "f_var_sequence.table" |> paste0(".source.r") ============  
subpath=r"(Rdev/60_communicate_report_export)"|>str_replace_all("\\\\","/")  # Using Raw Strings in R 4.0.0 and Later: The raw string literal, denoted by r"(...)", will not process \ as an escape character.
# if(subpath!="") utils::browseURL(normalizePath(subpath))
sourcename = "f_var_sequence.table" |> paste0(".source.r")
subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename)
# % (source( file.path(env1$path$source_base,subpath.filename.source.r) )) ------------
(source( file.path(env1$path$source_base,subpath.filename.source.r) ))


# Modified sample data
set.seed(123)
data <- data.frame(
  A01_VISIT = rep(1, 100),  # A01_VISIT has only one value
  A02_VISIT = sample(0:1, 100, replace = TRUE),
  A03_VISIT = sample(0:2, 100, replace = TRUE),
  A04_VISIT = sample(0:1, 100, replace = TRUE),
  A05_VISIT = sample(0:1, 100, replace = TRUE)
)

# Define variable sequence
var_sequence <- c("A01_VISIT", "A02_VISIT", "A03_VISIT", "A04_VISIT", "A05_VISIT")

# Generate and combine tables
combined_table <- f_var_sequence.table(data, var_sequence)

# Print combined table
print(combined_table)
# > print(combined_table)
#          A02_VISIT_0 A02_VISIT_1 A02_VISIT_2 A02_VISIT_Sum "|" A03_VISIT_0 A03_VISIT_1 A03_VISIT_2 A03_VISIT_Sum "|" A04_VISIT_0 A04_VISIT_1 A04_VISIT_2 A04_VISIT_Sum "|" A05_VISIT_0 A05_VISIT_1 A05_VISIT_2 A05_VISIT_Sum "|"
# prev_0             0           0           0             0   |          14          21          22            57   |          10          16           0            26   |          37          22           0            59   |
# prev_1            57          43           0           100   |          12          18          13            43   |          21          18           0            39   |          22          19           0            41   |
# prev_2             0           0           0             0   |           0           0           0             0   |          28           7           0            35   |           0           0           0             0   |
# prev_Sum          57          43           0           100   |          26          39          35           100   |          59          41           0           100   |          59          41           0           100   |