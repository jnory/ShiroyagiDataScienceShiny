shinyUI(
  fluidPage(
    titlePanel("mtcars Regression"),
    sidebarLayout(
      sidebarPanel(
        checkboxInput("coloring", "色分け"),
        checkboxInput("logy", "y軸を対数スケール")
      ),
      mainPanel(
        plotOutput("iris_plot")
      )
    )
  )
)
