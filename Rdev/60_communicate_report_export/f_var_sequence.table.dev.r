# https://chatgpt.com/c/9f7c2674-9b08-4b3c-8d72-6b7f1b009d09

## @ .RelativeSubPath, .FileName.source.r = "f_var_sequence.table" |> paste0(".source.r") ============  
.RelativeSubPath=r"(Rdev/60_communicate_report_export)"|>str_replace_all("\\\\","/")  # Using Raw Strings in R 4.0.0 and Later: The raw string literal, denoted by r"(...)", will not process \ as an escape character.
# if(.RelativeSubPath!="") .RelativeSubPath |> normalizePath(winslash="/",mustWork=TRUE) |> utils::browseURL() |> try()
.FileName.source.r = "f_var_sequence.table" |> paste0(".source.r")
.RelativeSubPath_FileName.source.r = paste0(.RelativeSubPath,ifelse(.RelativeSubPath=="","","/"),.FileName.source.r)
# \% source( file.path(env1$path$source_base,.RelativeSubPath_FileName.source.r) )  ------------  
source( file.path(env1$path$source_base,.RelativeSubPath_FileName.source.r) ) 



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
var_sequence.short_name <- c("V1", "V2", "V3", "V4", "V5")


# Generate and combine tables with short names
combined_table <- f_var_sequence.table(data, var_sequence, var_sequence.short_name)

# Print combined table
combined_table |> print()
# > combined_table |> print()
#          V2_0 V2_1 V2_2 V2_Sum T1| V3_0 V3_1 V3_2 V3_Sum T2| V4_0 V4_1 V4_2 V4_Sum T3| V5_0 V5_1 V5_2 V5_Sum T4|
# prev_0      0    0    0      0   |   14   21   22     57   |   10   16    0     26   |   37   22    0     59   |
# prev_1     57   43    0    100   |   12   18   13     43   |   21   18    0     39   |   22   19    0     41   |
# prev_2      0    0    0      0   |    0    0    0      0   |   28    7    0     35   |    0    0    0      0   |
# prev_Sum   57   43    0    100   |   26   39   35    100   |   59   41    0    100   |   59   41    0    100   |


# Convert to tibble
combined_table |> as_tibble() |> print()
# > combined_table |> as_tibble() |> print()
# # A tibble: 4 × 20
#    V2_0  V2_1  V2_2 V2_Sum `T1|`  V3_0  V3_1  V3_2 V3_Sum `T2|`  V4_0  V4_1  V4_2 V4_Sum `T3|`  V5_0  V5_1  V5_2 V5_Sum `T4|`
#   <dbl> <dbl> <dbl>  <dbl> <chr> <dbl> <dbl> <dbl>  <dbl> <chr> <dbl> <dbl> <dbl>  <dbl> <chr> <dbl> <dbl> <dbl>  <dbl> <chr>
# 1     0     0     0      0 "  |"    14    21    22     57 "  |"    10    16     0     26 "  |"    37    22     0     59 "  |"
# 2    57    43     0    100 "  |"    12    18    13     43 "  |"    21    18     0     39 "  |"    22    19     0     41 "  |"
# 3     0     0     0      0 "  |"     0     0     0      0 "  |"    28     7     0     35 "  |"     0     0     0      0 "  |"
# 4    57    43     0    100 "  |"    26    39    35    100 "  |"    59    41     0    100 "  |"    59    41     0    100 "  |"


# Capture the output of the combined table as a text
combined_table |> print() |> capture.output()
combined_table |> capture.output()
combined_table |> capture.output() |> str(max.level = 2, give.attr = TRUE)
# > combined_table |> capture.output()
# [1] "         V2_0 V2_1 V2_2 V2_Sum T1| V3_0 V3_1 V3_2 V3_Sum T2| V4_0 V4_1 V4_2 V4_Sum T3| V5_0 V5_1 V5_2 V5_Sum T4|"
# [2] "prev_0      0    0    0      0   |   14   21   22     57   |   10   16    0     26   |   37   22    0     59   |"
# [3] "prev_1     57   43    0    100   |   12   18   13     43   |   21   18    0     39   |   22   19    0     41   |"
# [4] "prev_2      0    0    0      0   |    0    0    0      0   |   28    7    0     35   |    0    0    0      0   |"
# [5] "prev_Sum   57   43    0    100   |   26   39   35    100   |   59   41    0    100   |   59   41    0    100   |"
# > combined_table |> capture.output() |> str(max.level = 2, give.attr = TRUE)
#  chr [1:5] "         V2_0 V2_1 V2_2 V2_Sum T1| V3_0 V3_1 V3_2 V3_Sum T2| V4_0 V4_1 V4_2 V4_Sum T3| V5_0 V5_1 V5_2 V5_Sum T4|" ...


combined_table |> capture.output() |> paste0(collapse = "\n")
combined_table |> capture.output() |> paste0(collapse = "\n") |> str(max.level = 2, give.attr = TRUE)
# > combined_table |> capture.output() |> paste0(collapse = "\n")
# [1] "         V2_0 V2_1 V2_2 V2_Sum T1| V3_0 V3_1 V3_2 V3_Sum T2| V4_0 V4_1 V4_2 V4_Sum T3| V5_0 V5_1 V5_2 V5_Sum T4|\nprev_0      0    0    0      0   |   14   21   22     57   |   10   16    0     26   |   37   22    0     59   |\nprev_1     57   43    0    100   |   12   18   13     43   |   21   18    0     39   |   22   19    0     41   |\nprev_2      0    0    0      0   |    0    0    0      0   |   28    7    0     35   |    0    0    0      0   |\nprev_Sum   57   43    0    100   |   26   39   35    100   |   59   41    0    100   |   59   41    0    100   |"
# > combined_table |> capture.output() |> paste0(collapse = "\n") |> str(max.level = 2, give.attr = TRUE)
#  chr "         V2_0 V2_1 V2_2 V2_Sum T1| V3_0 V3_1 V3_2 V3_Sum T2| V4_0 V4_1 V4_2 V4_Sum T3| V5_0 V5_1 V5_2 V5_Sum T4"| __truncated__


combined_table |> capture.output() |> env1$env.internal.attach$catLF(trailing_double_spaces = FALSE)
combined_table |> capture.output() |> env1$env.internal.attach$catLF(trailing_double_spaces = FALSE) |> str(max.level = 2, give.attr = TRUE)
# > combined_table |> capture.output() |> env1$env.internal.attach$catLF(trailing_double_spaces = FALSE)
#          V2_0 V2_1 V2_2 V2_Sum T1| V3_0 V3_1 V3_2 V3_Sum T2| V4_0 V4_1 V4_2 V4_Sum T3| V5_0 V5_1 V5_2 V5_Sum T4|
# prev_0      0    0    0      0   |   14   21   22     57   |   10   16    0     26   |   37   22    0     59   |
# prev_1     57   43    0    100   |   12   18   13     43   |   21   18    0     39   |   22   19    0     41   |
# prev_2      0    0    0      0   |    0    0    0      0   |   28    7    0     35   |    0    0    0      0   |
# prev_Sum   57   43    0    100   |   26   39   35    100   |   59   41    0    100   |   59   41    0    100   | 
# > combined_table |> capture.output() |> env1$env.internal.attach$catLF(trailing_double_spaces = FALSE) |> str(max.level = 2, give.attr = TRUE)
#          V2_0 V2_1 V2_2 V2_Sum T1| V3_0 V3_1 V3_2 V3_Sum T2| V4_0 V4_1 V4_2 V4_Sum T3| V5_0 V5_1 V5_2 V5_Sum T4|
# prev_0      0    0    0      0   |   14   21   22     57   |   10   16    0     26   |   37   22    0     59   |
# prev_1     57   43    0    100   |   12   18   13     43   |   21   18    0     39   |   22   19    0     41   |
# prev_2      0    0    0      0   |    0    0    0      0   |   28    7    0     35   |    0    0    0      0   |
# prev_Sum   57   43    0    100   |   26   39   35    100   |   59   41    0    100   |   59   41    0    100   | 
#  NULL




# Copy to clipboard based on OS
if (Sys.info()["sysname"] == "Windows") {
  combined_table |> capture.output() |> paste0(collapse = "\n") |> writeClipboard()
} else if (Sys.info()["sysname"] == "Darwin") {
  combined_table |> capture.output() |> paste0(collapse = "\n") |> cat(file = pipe("pbcopy"))
} else if (Sys.info()["sysname"] == "Linux") {
  # combined_table |> capture.output() |> paste0(collapse = "\n") |> cat(file = pipe("xclip -selection clipboard"))
  # combined_table |> capture.output() |> paste0(collapse = "\n") |> cat(file = pipe("xsel --clipboard --input"))
}

# if (Sys.info()["sysname"] == "Linux") system('if ! command -v xclip &> /dev/null; then echo "xclip is not installed. Installing xclip..."; sudo apt-get update && sudo apt-get install -y xclip; else echo "xclip is already installed."; fi')
# combined_table |> capture.output() |> paste0(collapse = "\n") |> cat(file = pipe("xclip -selection clipboard"))
# The error Can't open display: :0 occurs because xclip requires access to an X server to interact with the clipboard, which is not available in a headless environment like Docker.

# if (Sys.info()["sysname"] == "Linux") system('if ! command -v xsel &> /dev/null; then echo "xsel is not installed. Installing xsel..."; sudo apt-get update && sudo apt-get install -y xsel; else echo "xsel is already installed."; fi')
# combined_table |> capture.output() |> paste0(collapse = "\n") |> cat(file = pipe("xsel --clipboard --input"))
# xsel: Can't open display: (null)
# : Connection refused


combined_table_text = combined_table |> capture.output() |> paste0(collapse = "\n")

# pipe <- pipe("xsel --clipboard --input", "w")
# cat(combined_table_text, file = pipe)
# close(pipe)
# # > pipe <- pipe("xsel --clipboard --input", "w")
# # xsel: Can't open display: (null)
# # : Connection refused

