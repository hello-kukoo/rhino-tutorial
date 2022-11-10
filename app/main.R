box::use(
  shiny[moduleServer, NS, navbarPage, navbarMenu, tagList, tabPanel]
)

box::use(
  app/view[page1, page2]
)

#' @export
ui <- function(id) {
  ns <- NS(id)
  page1 <- page1$page1UI(ns("page1"))
  page2 <- page2$page2UI(ns("page2"))
  
  tagList(
    navbarPage(
      "Rhino Application",
      tabPanel("Page1", page1),
      tabPanel("Page2", page2),
      navbarMenu(
        "more",
        tabPanel("panel 4a", "four-a"),
        tabPanel("panel 4a", "four-a"),
        tabPanel("panel 4a", "four-a"),
      ),
    ),
  )
}

#' @export
server <- function(id) {
  moduleServer(id, function(input, output, session) {
    page1$page1Server("page1")
    page2$page2Server("page2")
  })
}
