shinyUI(
  fluidPage(
    titlePanel("Iris Plot"),
    sidebarLayout(
      sidebarPanel(
        checkboxInput("coloring", "Coloring"),
        selectInput("xaxis", "X-axis", 
                    choices=c(
                      "Sepal.Length", "Sepal.Width",
                      "Petal.Length", "Petal.Width")),
        selectInput("yaxis", "Y-axis", 
                    choices=c(
                      "Sepal.Length", "Sepal.Width",
                      "Petal.Length", "Petal.Width"))
      ),
      mainPanel(
        plotOutput("iris_plot")
      )
    )
  )
)
