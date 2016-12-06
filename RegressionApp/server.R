library(ggplot2)

shinyServer(
  function(input, output) {
    x <- rep(NA, 32)
    x[1] <- min(mtcars$mpg)
    x[2] <- max(mtcars$mpg)

    estimate <- reactive({
      if(input$logy) {
        lm(log(hp) ~ mpg, data=mtcars)
      } else {
        lm(hp ~ mpg, data=mtcars)
      }
    })
    
    getline <- reactive({
      line <- estimate()
      if(input$logy) {
        fun <- function(x) {exp(line$coefficients[1] + line$coefficients[2] * x)}
      } else {
        fun <- function(x) {line$coefficients[1] + line$coefficients[2] * x}
      }
      c(fun(x[1]), fun(x[2]))
    })
    get_confidence <- reactive({
      line <- estimate()
      conf <- predict(line, interval="confidence", level=0.95)
      if(input$logy){
        conf <- exp(conf)
      }
      as.data.frame(conf)
    })
    get_lower <- reactive({
      conf <- get_confidence()
      lower <- as.data.frame(cbind(mtcars$mpg, conf$lwr))
      colnames(lower) <- c("mpg", "lwr")
      lower[sort.list(lower$mpg, decreasing=FALSE),]
    })
    get_upper <- reactive({
      conf <- get_confidence()
      upper <- as.data.frame(cbind(mtcars$mpg, conf$upr))
      colnames(upper) <- c("mpg", "upr")
      upper[sort.list(upper$mpg, decreasing=FALSE),]
    })
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
      
      y <- rep(NA, 32)
      y[1:2] <- getline()
      df <- data.frame(x=x, y=y)
      gp <- gp + geom_line(aes(df$x, df$y))
      
      if(input$confidence){
        lower <- get_lower()
        upper <- get_upper()
        gp <- gp + geom_line(aes(lower$mpg, lower$lwr, color="Confidence")) 
        gp + geom_line(aes(upper$mpg, upper$upr, color="Confidence"))
      }else{
        gp
      }
    })
  }
)
