shinyUI(
  fluidPage(
    titlePanel("mtcars Regression"),
    sidebarLayout(
      sidebarPanel(
        checkboxInput("coloring", "Coloring"),
        checkboxInput("logy", "Logscale y-axis")
      ),
      mainPanel(
        plotOutput("iris_plot")
      )
    )
  )
)
