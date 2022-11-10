## ---------------------------
##
## Script name: data_transformation.R
##
## Purpose of script: transform the data.frame 
##
## Author: Lin Yong
##
## Date Created: 2022-11-08
##
## Copyright (c) DataRx, 2022
## Email: yong.lin@datarx.cn
##
## ---------------------------
##
## Notes:
##   
##
## ---------------------------

box::use(
  dplyr[arrange],
  tidyr[pivot_wider]
)

#' @export
transform_data <- function(dat, names, values, sort_by) {
  dat |> pivot_wider(
    names_from = {{names}},
    values_from = {{values}}
  ) |>
    arrange({{sort_by}})
}
