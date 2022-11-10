## ---------------------------
##
## Script name: chart_utils.R
##
## Purpose of script: customer formatter 
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
  htmlwidgets[JS]
)

#' @export
label_formatter <- JS("(value, index) => value")
