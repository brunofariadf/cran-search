# cran-search
![lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-lightgrey)![status:
development](https://img.shields.io/badge/status-development-blue)

# Overview

The **`cran-search`** project aims to provide a database to perform a package search for the R programming language in the Comprehensive R Archive Network (CRAN) repository. The collected data are obtained by the tools::CRAN_package_db() function and selected only a few columns to perform the search for the topic of interest.

# Usage

This is a basic example that shows how to use the page to Windows.

- R
``` r
# to restore the state of your project from renv.lock.
renv::restore()

# start the process to construct page
source(file.path("cran-search", "engineer","build.R"))

# open page in browser
browseURL(file.path(getwd(), "index.html"))
```

# Code of Conduct

Please note that the project is released with a [Contributor
Code of
Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html). By contributing to this project, you agree to abide by its terms.

# License

[MIT](https://github.com/brunofariadf/cran-search/blob/main/LICENSE)
