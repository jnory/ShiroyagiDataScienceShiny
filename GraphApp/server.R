shinyServer(
  function(input, output) {
    output$iris_plot <- renderPlot({
      frame()
      cls <- unclass(iris$Species)
      levels <- attr(cls, "levels")
      if(input$coloring){
        col = c("red", "green", "blue")
      }else{
        col = c("black", "black", "black")
      }
      plot(iris$Petal.Length,iris$Petal.Width, col=col[cls])
      if(input$coloring){
        legend("topleft", legend=levels, col=col, pch="o")
      }
    })
  }
)
