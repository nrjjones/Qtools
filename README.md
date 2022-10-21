
# Qtools

<!-- badges: start -->
<!-- badges: end -->

Qtools is a set of functions to help with processing Qualtrics data.  

## Installation

You can install the development version of Qtools from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("nrjjones/Qtools")
```

## Example

Qtools includes the following functions: 

- new_proj() - Sets up raw, out, and pst folders.  
- frtab(df, x) - Creates a frequency table of variable x from data df with format % (N).  
- ctab(df, x, y) - Creates a crosstab of variables x by y from data df with format % (N).  
- cbtab(df, n) - Create a frequency table of col n from data df with format % (N).  
- codebk(x, varlist) - Creates a codebook with file name x of frtabs from varlist.  
- openend(oe, n, pnum) - Exports comments from oe for col n and adds pnum to file name.  Use with a for loop for all OE vars.  


``` r
library(Qtools)
## basic example code
```

