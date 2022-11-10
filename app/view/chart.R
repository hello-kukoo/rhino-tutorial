## ---------------------------
##
## Script name: chart.R
##
## Purpose of script: display a line chart of the data.frame 
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
  echarts4r = echarts4r[e_chart, e_line, e_x_axis, e_tooltip, group_by],
  shiny[div, tagList, moduleServer, NS]
)

box::use(
  app/logic/chart_utils[label_formatter]
)

#' @export
chartUI <- function(id) {
  ns <- NS(id)
  tagList(
    div(
      class = "component-box",
      echarts4r$echarts4rOutput(ns("chart")),
    )
  )
}

#' @export
chartServer <- function(id, dat) {
  moduleServer(
    id,
    function(input, output, session) {
      print("Chart module server part works!")
      
      output$chart <- echarts4r$renderEcharts4r(
        dat |>
          group_by(Species)  |>
          e_chart(x = Year)  |>
          e_line(Population) |>
          e_x_axis(
            Year,
            axisLabel = list(formatter = label_formatter)
          ) |>
          e_tooltip()
      )
    }
  )
}
