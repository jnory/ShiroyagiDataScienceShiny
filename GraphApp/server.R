library(ggplot2)

shinyServer(
  function(input, output) {
    output$iris_plot <- renderPlot({
      gp <- ggplot(iris, aes(Petal.Length, Petal.Width))
      gp <- gp + theme(legend.justification = c(0, 1), legend.position=c(0, 1))
      if(input$coloring){
        gp + geom_point(aes(color=Species))
      }else{
        gp + geom_point()
      }
    })
  }
)
