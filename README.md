
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
libary(tidyverse)
library(knitr)
library(haven)
library(Qtools)

# Creates raw, out, and pst folders
new_proj()

# Basic frequency tab
frtab(infert, Education)

# Basic crosstab
ctab(infert, Education, induced)

# Codebook crosstab - Uses col number: 1=education.
cbtab(infert, 1)

# Create a codebook from a Qualtrics data file

### Load data from SPSS formatted file

df <- read_spss("./EXAMPLE SURVEY DATA.sav")

### Remove paradata and keep survey data
### Replace A and Z with first and last variable

df <- df %>% select(csid = ExternalReference, Q_A:Q_Z)

### Create a list of all variables and check their type.
### Character variables start with an 'A'

varlist <- tibble(
  var = names(df),
  labels = map_chr(1:ncol(df), function(x) attr(df[[x]], "label")),
  typ = map_chr(1:ncol(df), function(x) attr(df[[x]], "format.spss")),
  oe = str_detect(typ, "A")
)

### Separate OE vars 

oev <- varlist %>% filter(oe == TRUE)
varlist <- varlist %>% filter(oe == FALSE)

oe <- df %>% select(oev$var)
df <- df %>% select(varlist$var)

### Apply variable and value labels

df <- as_factor(df)

### Specify file name for frequency report and create the template

codebk("Example Data Frequency Report.qmd", df, varlist)

### Export comments to separate files with date stamp
### Example exported file name: P9999 Q45_TEXT Responses 2022-10-12.csv

for(i in 1:length(names(oe))) {
  openend(oe, i, "P9999")
}


```



