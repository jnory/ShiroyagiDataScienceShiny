shinyUI(
  fluidPage(
    titlePanel("mtcars Regression"),
    sidebarLayout(
      sidebarPanel(
        checkboxInput("coloring", "Coloring"),
        checkboxInput("logy", "Logscale y-axis"),
        checkboxInput("confidence", "Show confidence interval")
      ),
      mainPanel(
        plotOutput("iris_plot")
      )
    )
  )
)
