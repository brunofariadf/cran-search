# cran-search
![lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-lightgrey)![status:
development](https://img.shields.io/badge/status-development-blue)

# Overview

The **`CRAN search`** project is to perform package search available in the Comprehensive R Archive Network (CRAN) repositorio for programming language R. The collected data is obtained by the **`tools::CRAN_package_db()`** and selected only a few columns to perform the search of the theme of interest.

# Usage

This is a basic example that shows how to use the page to Windows.

- R
``` r
renv::restore()
source("../cran-search/statistic/01-process")
browseURL(file.path(getwd(), "index.html"))
```

# Code of Conduct

Please note that the project is released with a [Contributor
Code of
Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html). By contributing to this project, you agree to abide by its terms.

# License

MIT