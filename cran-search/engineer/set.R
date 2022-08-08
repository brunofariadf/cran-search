## ------------------------------------------
##                          Date: 2022-07-16
## ------------------------------------------
## Project: cran-search
## Author: Bruno Faria
## 
## GUI: vscode (1.69.1)
## Version R: 4.1.0
## Platform: windows (10.0.14393)
## ------------------------------------------

## --------------------------------------------------------------------------------
## set - date: 2022-07-16 17:51:35
## --------------------------------------------------------------------------------

## ------------------------------------------
## variable
## ------------------------------------------

# path to read
path_index <- getwd()
path_cran <- "./cran-search/data-raw/cran.csv"
path_rmd <- "./cran-search/index.Rmd"
path_describe <- "./cran-search/data/describe.rda"

# get CRAN: TRUE; read csv: FALSE
set_cran <- TRUE

# n to word count
n_i <- 3

## ------------------------------------------
## data
## ------------------------------------------

df_cran <- .get_cran_package_all(set_cran)
date_cran <- unique(df_cran[["update"]])

## ------------------------------------------
## summary
## ------------------------------------------

# title column
df_title <- df_cran |>
    dplyr::select(title) |> 
    tidytext::unnest_tokens(word, title) |> 
    dplyr::mutate(n_char = nchar(word)) |> 
    dplyr::filter(n_char > 3) |> 
    dplyr::group_by(word) |> 
    dplyr::count() |> 
    dplyr::arrange(dplyr::desc(n)) |> 
    head(n_i) |> 
    as.data.frame()
df_title <- df_title |> 
    dplyr::mutate(percent = scales::percent(n/sum(n), accuracy = 0.01)) |>     
    dplyr::mutate(
        position = 1:nrow(df_title),
        information = paste0("(", position, ") ", word, " ", n," (", percent, ")"))

# description column
df_description <- df_cran |>
    dplyr::select(description) |> 
    tidytext::unnest_tokens(word, description) |> 
    dplyr::mutate(n_char = nchar(word)) |> 
    dplyr::filter(n_char > 3) |> 
    dplyr::group_by(word) |> 
    dplyr::count() |> 
    dplyr::arrange(dplyr::desc(n)) |> 
    head(n_i) |> 
    as.data.frame()
df_description <- df_description |> 
    dplyr::mutate(percent = scales::percent(n/sum(n), accuracy = 0.01)) |>     
    dplyr::mutate(
        position = 1:nrow(df_title),
        information = paste0("(", position, ") ", word, " ", n," (", percent, ")"))

# license column
df_license <- df_cran |>
    dplyr::select(license) |> 
    tidytext::unnest_tokens(word, license) |> 
    dplyr::mutate(n_char = nchar(word)) |> 
    dplyr::filter(n_char > 3) |> 
    dplyr::group_by(word) |> 
    dplyr::count() |> 
    dplyr::arrange(dplyr::desc(n)) |> 
    head(n_i) |> 
    as.data.frame()
df_license <- df_license |> 
    dplyr::mutate(percent = scales::percent(n/sum(n), accuracy = 0.01)) |>     
    dplyr::mutate(
        position = 1:nrow(df_title),
        information = paste0("(", position, ") ", word, " ", n," (", percent, ")"))

# join
df_join <- rbind(
    .describe(df_cran),
    data.frame(update = date_cran, structure = "title",
        information = paste0("frequency: ", toString(df_title[["information"]]))),
    data.frame(update = date_cran, structure = "description",
        information = paste0("frequency: ", toString(df_description[["information"]]))),
    data.frame(update = date_cran, structure = "license",
        information = paste0("frequency: ", toString(df_license[["information"]])))
)

## --------------------------------------------------------------------------------
## export - date: 2022-07-16 18:11:51
## --------------------------------------------------------------------------------

# .write_cran(set_cran, path_cran); save(df_join, file = path_describe)
