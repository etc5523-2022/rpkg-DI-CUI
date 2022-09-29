
<!-- README.md is generated from README.Rmd. Please edit that file -->

# asdata

<!-- badges: start -->
<!-- badges: end -->

The goal of asdata is to give a good overview of national alcohol
consumption and servings of beer, spirit and wine, and make it easy to
compare alcohol consumption and servings from country to country.

## Installation

You can install the development version of asdata from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("etc5523-2022/rpkg-DI-CUI")
```

## Example

``` r
library(asdata)
```

### Plotting alcohol comsumption and servings

The below examples use the built-in dataset `alcohol_map`, you could
produce plot about global alcohol consumption and servings. There are
two functions: `plotly_litres()` function and `plot_servings()`
function.

`plotly_litres()` function could plot global alcohol consumption map in
a total litres of pure alcohol range, and convert the plot to plotly
object automatically. You could use this function to perform the alcohol
consumption distribution.

In this example, mapping global alcohol consumption with total litres of
pure alcohol in the range (0,10), you could see that except for northern
Europe and Australia, the total litres of pure alcohol of most countries
are less than 10.

``` r
# Not run
consumption <- plotly_litres(Litres = c(0,10))
consumption
```

<img src="./man/figures/plotly.png" width="100%" /> *Image: screenshot
of consumption*

<br>

`plot_servings()` function maps global alcohol servings of beer, spirit
and wine.

In this example, mapping global beer servings. There are high beer
servings in Europe.

``` r
beer_servings <- plot_servings(type = "beer_servings")
beer_servings
```

<img src="man/figures/README-unnamed-chunk-3-1.png" width="100%" />

### Exploring specific numerical differences

The below examples use the built-in dataset `alcohol`, you could see
specific numerical differences about alcohol consumption and servings by
using `extract_country_servings()` function and
`calculate_country_alcohol()` function.

`extract_country_servings()` function is used to obtain a list of
countries in this alcohol servings range in descending order of this
alcohol servings.

In this example, prodcing a data.frame contains country with beer
servings in range (0,100), and showing the top 6 rows.

``` r
country_servings <- extract_country_servings(range = c(0,100), type = "beer_servings")
head(country_servings)
#> # A tibble: 6 x 3
#>   country            rank beer_servings
#>   <chr>             <int>         <dbl>
#> 1 Thailand              1            99
#> 2 Mauritius             2            98
#> 3 Cuba                  3            93
#> 4 Guyana                3            93
#> 5 Equatorial Guinea     5            92
#> 6 Swaziland             6            90
```

`calculate_country_alcohol()` function calculates the average alcohol
consumption and servings of selected countries, as well as the
difference between the alcohol consumption and servings of each country
and the average.

In this example, combine with `extract_country_servings()` function to
calculate the average beer servings of countries with beer servings in
the range (0,100) and produce a data.frame to see the difference between
beer_servings of each country with the average.

``` r
cal_beer <- calculate_country_alcohol(name = country_servings$country, type = "beer_servings")
```

You could use `cal_beer[[1]]` to see the mean value.

``` r
cal_beer[[1]]
#> [1] "mean: 33.33"
```

You could use `cal_beer[[2]]` to see the data.frame, showing the top 6
rows of the data.frame

``` r
head(cal_beer[[2]])
#> # A tibble: 6 x 3
#>   country            diff beer_servings
#>   <chr>             <dbl>         <dbl>
#> 1 Thailand           65.7            99
#> 2 Mauritius          64.7            98
#> 3 Cuba               59.7            93
#> 4 Guyana             59.7            93
#> 5 Equatorial Guinea  58.7            92
#> 6 Swaziland          56.7            90
```

In this example, input a vector of country names to calculate the
average wine servings of China, Japan, France, Australia and the USA,
and to produce a data.frame to see the difference between wine servings
in China, Japan, France, Australia and the USA with the average.

``` r
country <- c("China","Japan","France", "Australia","USA")
cal_wine <- calculate_country_alcohol(name = country, type = "wine_servings")
```

You could use `cal_wine[[1]]` to see the mean value.

``` r
cal_wine[[1]]
#> [1] "mean: 138"
```

You could use `cal_wine[[2]]` to see the data.frame.

``` r
cal_wine[[2]]
#> # A tibble: 5 x 3
#>   country    diff wine_servings
#>   <chr>     <dbl>         <dbl>
#> 1 France      232           370
#> 2 Australia    74           212
#> 3 USA         -54            84
#> 4 Japan      -122            16
#> 5 China      -130             8
```

### Run shiny app

`run_app()` function could run global alcohol consumption shiny app.

``` r
# Not run
run_app()
```
