## ---------------------------
##
## Script name: page1.R
##
## Purpose of script: contains a table and a chart 
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
  shiny[div, h1, icon, moduleServer, NS, renderText, tags, tagList, titlePanel]
)

box::use(
  app/view[chart, table]
)


#' @export
page1UI <- function(id) {
  ns <- NS(id)
  tagList(
    titlePanel("Talbe and Chart"),
    div(
      class = "components-container",
      table$tableUI(ns("table")),
      chart$chartUI(ns("chart")),
    ),
    tags$button(
      id = "help-button",
      icon("question"),
      onclick = "App.showHelp()"
    )
  )
}

#' @export
page1Server <- function(id) {
  moduleServer(
    id,
    function(input, output, session) {
      dat <- rhino::rhinos
      
      table$tableServer("table", dat = dat)
      chart$chartServer("chart", dat = dat)
    }
  )
}

