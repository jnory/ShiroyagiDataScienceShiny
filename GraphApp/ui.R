shinyUI(
  fluidPage(
    titlePanel("Iris Plot"),
    sidebarLayout(
      sidebarPanel(
        checkboxInput("coloring", "Coloring")
      ),
      mainPanel(
        plotOutput("iris_plot")
      )
    )
  )
)
