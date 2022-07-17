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

# print data frame with DT
# not export

.dt_table <- function(data) {
  if (is.data.frame(data)) {
    .dt_style(data)
  } else {
      stop("Method applicable to 'data.frame' class.")
  }
}

# style to DT
# not export

.dt_style <- function(data) {
  DT::datatable(data, filter = "top", 
          extensions = c('Buttons'),
          options = list(
            dom = 'Bfrtip',
            # buttons = list('copy', list(
            #   extend = 'collection',
            #   buttons = c('csv', 'excel', 'pdf'),
            #   text = 'Download'),
            #   I('colvis')),
            buttons = list('copy', list(
              extend = 'collection',
              buttons = list(
                list(extend = 'csv', exportOptions = list(columns = ":visible")), 
                list(extend = 'excel', exportOptions = list(columns = ":visible")), 
                list(
                  extend = 'pdf', 
                  orientation = "landscape",
                  exportOptions = list(columns = ":visible")
                  )
                ),
              text = 'Download'),
              I('colvis')),
            scrollX = TRUE,
            scrollY = 300,
            pageLength = 10,
            scroller = list(rowHeight = 5),
            columnDefs = list(list(
              className = 'dt-center', 
              targets = "_all")),
              autoWidth = FALSE,
              initComplete = DT::JS("function(settings, json) {",
              "$(this.api().table().header()).css({'background-color': '#AFEEEE', 'color': '#2F4F4F'});",
              "}")),
            callback = DT::JS(.callback))
}