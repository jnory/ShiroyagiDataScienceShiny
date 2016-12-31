library(ggplot2)

shinyServer(
  function(input, output) {
    x <- rep(NA, 32)
    x[1] <- min(mtcars$mpg)
    x[2] <- max(mtcars$mpg)
    
    output$iris_plot <- renderPlot({
      gp <- ggplot(mtcars, aes(mpg, hp))
      gp <- gp + xlab("Miles/(US) gallon") + ylab("Gross housepower")
      gp <- gp + theme(legend.justification = c(1, 1), legend.position=c(1, 1))
      gp <- gp + xlim(10, 35)
      if(input$coloring){
        cls <- ifelse(mtcars$vs, "V-engine", "Straight Engine")
        gp <- gp + geom_point(aes(color=cls))
      }else{
        gp <- gp + geom_point()
      }
      if(input$logy){
        gp <- gp + scale_y_log10()
      }
      
      if(input$logy) {
        line <- lm(log(hp) ~ mpg, data=mtcars)
        fun <- function(x) {exp(line$coefficients[1] + line$coefficients[2] * x)}
      } else {
        line <- lm(hp ~ mpg, data=mtcars)
        fun <- function(x) {line$coefficients[1] + line$coefficients[2] * x}
      }
      y <- rep(NA, 32)
      y[1] <- fun(x[1])
      y[2] <- fun(x[2])
      df <- data.frame(x=x, y=y)
      gp + geom_line(aes(df$x, df$y))
    })
  }
)
