## ------------------------------------------
##                          Date: 2022-07-15
## ------------------------------------------
## Project: cran-search
## Author: Bruno Faria
## 
## GUI: vscode (1.69.0)
## Version R: 4.1.0
## Platform: windows (10.0.14393)
## ------------------------------------------

# set time to search
# not export

.callback <- '$("div.search").append($("#mySearch"));$("#mySearch").on("keyup redraw", function(){
  var splits = $("#mySearch").val().split(" ").filter(function(x){return x !=="";})
  var searchString = "(" + splits.join("|") + ")";
  setTimeout(function(){
    table.search(searchString, true).draw(true);
  }, 2000);
});'

# describe to data frame
# not export

.describe <- function(data) {
  data.frame(
    update = Sys.Date(),
    structure = c("column", "n_column", "n_row", "NA"),
    information = c(
      toString(colnames(data)),
      ncol(data),
      nrow(data),
      anyNA(data)
    ),
    check.names = FALSE
  )
}

# load function
# not export

.loadR <- function() {
  path_i <- list.files(file.path("cran-search", "R"), full.names = TRUE)
  path_i <- suppressWarnings(normalizePath(path_i))
  invisible(lapply(path_i, source))
}
