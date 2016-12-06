shinyServer(
  function(input, output) {
    getline = reactive({
      if(input$logy) {
        line <- lm(log(hp) ~ mpg, data=mtcars)
        fun <- function(x) {exp(line$coefficients[1] + line$coefficients[2] * x)}
      } else {
        line <- lm(hp ~ mpg, data=mtcars)
        fun <- function(x) {line$coefficients[1] + line$coefficients[2] * x}
      }
      c(fun(0), fun(max(mtcars$mpg)))
    })
    output$iris_plot <- renderPlot({
      frame()
      cls <- mtcars$vs + 1
      if(input$coloring){
        col = c("red", "blue")
      }else{
        col = c("black", "black")
      }
      plot(mtcars$mpg, mtcars$hp, col=col[cls], log=ifelse(input$logy, "y", ""), 
           xlab="Miles/(US) gallon", ylab="Gross horsepower")
      if(input$coloring){
        legend("topleft", legend=c("V-engine", "Straight Engine"), col=col, pch="o")
      }
      lines(c(0, max(mtcars$mpg)), getline())
    })
  }
)
