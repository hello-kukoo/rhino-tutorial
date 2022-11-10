## ---------------------------
##
## Script name: page2.R
##
## Purpose of script: contains a plot from {overviewR} 
##
## Author: Lin Yong
##
## Date Created: 2022-11-10
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
  shiny = shiny[...],
  ggplot2 = ggplot2[...],
  dplyr = dplyr[...],
  overviewR
)

toydata <- overviewR::toydata

#' @export
page2UI <- function(id) {
  ns <- NS(id)
  tagList(
    titlePanel ("Visualization"),
    ###Define sidebar
    sidebarLayout(
      sidebarPanel(
        checkboxGroupInput(
          ns("countries"),
          h4("Select the countries"),
          choices = unique(toydata$ccode),
          selected = c("RWA", "AGO")
        )
      ),
      ###Show the visualization
      mainPanel(plotOutput(ns("first_plot")))
    )
  )
}

#' @export
page2Server <- function(id) {
  moduleServer(
    id,
    function(input, output, session) {
      
      output$first_plot <-
        renderPlot({
          ###Generate a normal ggplot2 with some data wrangling
          toydata |>
            filter(ccode %in% input$countries) |>
            mutate(year = as.integer(year)) |>
            ggplot(aes(x = year, y = population)) +
              geom_col() +
              facet_wrap( ~ ccode) + 
              theme_minimal()
        })
    }
  )
}


