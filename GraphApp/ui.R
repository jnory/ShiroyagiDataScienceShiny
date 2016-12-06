shinyUI(
  fluidPage(
    titlePanel("Iris Plot"),
    sidebarLayout(
      sidebarPanel(
        checkboxInput("coloring", "色分け")
      ),
      mainPanel(
        plotOutput("iris_plot")
      )
    )
  )
)
