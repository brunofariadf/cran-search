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

# get data frame from CRAN
# not export

.write_cran <- function(set, path) {
  df_i <- .get_cran_package_all(set)
  write.csv2(df_i, file = path, row.names = FALSE, na = "")
}

# column select to data frame
# not export

.get_cran_package_all <- function(set, type = "basic", format_column = FALSE) {
    db <- tools::CRAN_package_db()
    if (isTRUE(set)) {
        if (type == "basic") {
            data.frame(update = Sys.Date(),
                package = db[["Package"]],
                version = db[["Version"]],
                license = db[["License"]],
                title = if (format_column) .format_character_length(db[["Title"]]) else db[["Title"]],
                description = if (format_column) .format_character_length(db[["Description"]]) else db[["Description"]],
                date = db[["Published"]],
                depends = if (format_column) .format_character_length(db[["Depends"]]) else db[["Depends"]],
                import = if (format_column) .format_character_length(db[["Imports"]]) else db[["Imports"]],
                url = if(format_column) .format_character_length(db[["URL"]]) else db[["URL"]],
                check.names = FALSE)
        } else if (type == "all") {
            return(db)
        }
    } else if (isFALSE(set)) {
        read.csv2(path_cran)
    }
}
