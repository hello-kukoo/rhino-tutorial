## ---------------------------
##
## Script name: table.R
##
## Purpose of script: display dataset content in a table 
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
  reactable,
  shiny[div, moduleServer, NS, tagList]
)

box::use(
  app/logic/data_transformation[transform_data]
)


#' @export
tableUI <- function(id) {
  ns <- NS(id)
  tagList(
    div(
      class = "component-box",
      reactable$reactableOutput(ns("table")),
    )
  )
}

#' @export
tableServer <- function(id, dat) {
  moduleServer(
    id,
    function(input, output, session) {
      output$table <- reactable$renderReactable(
        reactable$reactable(
                      dat |> transform_data(Species, Population, Year),
                      # filterable = TRUE, 
                      searchable = TRUE, 
                      showSortable = TRUE, resizable = TRUE, 
                      paginationType = "simple", 
                      # showPageSizeOptions = TRUE, 
                      striped = TRUE, highlight = TRUE,
                      outlined = TRUE, bordered = TRUE,)
      )
    }
  )
}

