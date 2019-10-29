library(shiny)
library(reacthexgrid)

ui <- fluidPage(
  titlePanel("reactR HTMLWidget Example"),
  reacthexgridOutput('widgetOutput')
)

server <- function(input, output, session) {
  output$widgetOutput <- renderReacthexgrid(
    reacthexgrid("Hello world!")
  )
}

shinyApp(ui, server)