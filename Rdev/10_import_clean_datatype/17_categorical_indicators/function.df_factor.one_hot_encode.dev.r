
.packagename = "tidyverse"; if (!paste0("package:",.packagename) %in% search()) {library(.packagename, character.only = TRUE)}

# https://github.com/mkim0710/tidystat/blob/master/Rdev/10_import_clean_datatype/17_categorical_indicators/function.df_factor.one_hot_encode.dev.r
function.df_factor.one_hot_encode <- function(input_df, sep4levelname = "_") {
    input_df.attributes = input_df %>% attributes
    input_df.attributes$names = NULL
    input_df.attributes$class = NULL
    input_df_factor <- input_df %>% select_if(is.factor)
    
    # Rename the columns to add separator before the level name
    input_df_factor.colnames = colnames(input_df_factor)
    colnames(input_df_factor) <- paste0(input_df_factor.colnames, sep4levelname)
    
    # Apply one-hot encoding to categorical variables
    input_df_factor.model.matrix <- model.matrix(~ . + 0, data = input_df_factor)
    input_df_factor.model.matrix.colnames = colnames(input_df_factor.model.matrix)
    
    # Combine one-hot encoded data with the original non-categorical data
    output_df <- bind_cols(input_df %>% select_if(function(vec) !is.factor(vec)), as_tibble(input_df_factor.model.matrix))
    attributes(output_df)$input_df_factor.colnames = input_df_factor.colnames
    attributes(output_df)$input_df_factor.model.matrix.colnames = input_df_factor.model.matrix.colnames
    for (i in names(input_df.attributes)) {
        if (!i %in% names(attributes(output_df))) {
            attributes(output_df)[[i]] = input_df.attributes[[i]]
        }
    }
    if(identical(attributes(output_df)$row.names, 1:nrow(output_df))) rownames(output_df) = rownames(input_df)
    return(output_df)
}

df_example <- tibble(
    id = 1:4,
    color = as.factor(c("red", "blue", "green", "red")),
    size = as.factor(c("small", "large", "medium", "small"))
)
attributes(df_example)$test = "test"
rownames(df_example) = LETTERS[1:nrow(df_example)]
df_example %>% attributes |> str()
input_df_factor.model.matrix_example <- function.df_factor.one_hot_encode(df_example)
input_df_factor.model.matrix_example %>% attributes |> str()
input_df_factor.model.matrix_example |> str()
# > df_example <- tibble(
# +     id = 1:4,
# +     color = as.factor(c("red", "blue", "green", "red")),
# +     size = as.factor(c("small", "large", "medium", "small"))
# + )
# > attributes(df_example)$test = "test"
# > rownames(df_example) = LETTERS[1:nrow(df_example)]
# 경고: Setting row names on a tibble is deprecated.
# > df_example %>% attributes |> str()
# List of 4
#  $ class    : chr [1:3] "tbl_df" "tbl" "data.frame"
#  $ row.names: chr [1:4] "A" "B" "C" "D"
#  $ names    : chr [1:3] "id" "color" "size"
#  $ test     : chr "test"
# > input_df_factor.model.matrix_example <- function.df_factor.one_hot_encode(df_example)
# 경고: Setting row names on a tibble is deprecated.
# > input_df_factor.model.matrix_example %>% attributes |> str()
# List of 6
#  $ names                                : chr [1:6] "id" "color_blue" "color_green" "color_red" ...
#  $ row.names                            : chr [1:4] "A" "B" "C" "D"
#  $ class                                : chr [1:3] "tbl_df" "tbl" "data.frame"
#  $ test                                 : chr "test"
#  $ input_df_factor.colnames             : chr [1:2] "color" "size"
#  $ input_df_factor.model.matrix.colnames: chr [1:5] "color_blue" "color_green" "color_red" "size_medium" ...
# > input_df_factor.model.matrix_example |> str()
# tibble [4 × 6] (S3: tbl_df/tbl/data.frame)
#  $ id         : int [1:4] 1 2 3 4
#  $ color_blue : num [1:4] 0 1 0 0
#   ..- attr(*, "assign")= int [1:5] 1 1 1 2 2
#   ..- attr(*, "contrasts")=List of 2
#   .. ..$ color_: chr "contr.treatment"
#   .. ..$ size_ : chr "contr.treatment"
#  $ color_green: num [1:4] 0 0 1 0
#   ..- attr(*, "assign")= int [1:5] 1 1 1 2 2
#   ..- attr(*, "contrasts")=List of 2
#   .. ..$ color_: chr "contr.treatment"
#   .. ..$ size_ : chr "contr.treatment"
#  $ color_red  : num [1:4] 1 0 0 1
#   ..- attr(*, "assign")= int [1:5] 1 1 1 2 2
#   ..- attr(*, "contrasts")=List of 2
#   .. ..$ color_: chr "contr.treatment"
#   .. ..$ size_ : chr "contr.treatment"
#  $ size_medium: num [1:4] 0 0 1 0
#   ..- attr(*, "assign")= int [1:5] 1 1 1 2 2
#   ..- attr(*, "contrasts")=List of 2
#   .. ..$ color_: chr "contr.treatment"
#   .. ..$ size_ : chr "contr.treatment"
#  $ size_small : num [1:4] 1 0 0 1
#   ..- attr(*, "assign")= int [1:5] 1 1 1 2 2
#   ..- attr(*, "contrasts")=List of 2
#   .. ..$ color_: chr "contr.treatment"
#   .. ..$ size_ : chr "contr.treatment"
#  - attr(*, "test")= chr "test"
#  - attr(*, "input_df_factor.colnames")= chr [1:2] "color" "size"
#  - attr(*, "input_df_factor.model.matrix.colnames")= chr [1:5] "color_blue" "color_green" "color_red" "size_medium" ...



