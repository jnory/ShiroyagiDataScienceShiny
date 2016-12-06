library(ggplot2)

shinyServer(
  function(input, output) {
    output$iris_plot <- renderPlot({
      gp <- ggplot(iris, aes(Petal.Length, Petal.Width))
      gp <- gp + theme(legend.justification=c(0, 1), legend.position=c(0, 1))
      
      x_data <- switch(input$xaxis,
                       "Sepal.Length" = iris$Sepal.Length,
                       "Sepal.Width" = iris$Sepal.Width,
                       "Petal.Length" = iris$Petal.Length,
                       "Petal.Width" = iris$Petal.Width
      )
      y_data <- switch(input$yaxis,
                       "Sepal.Length" = iris$Sepal.Length,
                       "Sepal.Width" = iris$Sepal.Width,
                       "Petal.Length" = iris$Petal.Length,
                       "Petal.Width" = iris$Petal.Width
      )
      if(input$coloring){
        gp + geom_point(aes(x_data, y_data, color=Species))
      }else{
        gp + geom_point(aes(x_data, y_data))
      }
    })
  }
)
