
<!-- README.md is generated from README.Rmd. Please edit that file -->

# hungryr

<!-- badges: start -->

<!-- badges: end -->

The goal of hungryr is build a model for new restauraunt suggestions.

## Installation

Not yet\!

You can install the released version of randomFood from
[CRAN](https://CRAN.R-project.org) with:

``` r
# Install development
remotes::install_github('bill-ash/hungryr')

install.packages("hungryr")
```

## My favorite places to eat\!

``` r
library(hungryr)
library(ggplot2)
library(forcats)
# Login - get orders  -----------------------------------------------------
me <- gh_auth()
orders <- get_orders(me, pageNum = 1, pageSize = 1000)

orders %>%
  tidyr::unnest(results.restaurants) %>%
  dplyr::count(name) %>%
  dplyr::mutate(name = fct_reorder(name, n)) %>%
  ggplot(aes(n, name)) +
  geom_col() +
  labs(title = "Bill's favorite places to eat.",
       x = 'count', y = '')
```

<img src="man/figures/README-example-1.png" width="100%" />
