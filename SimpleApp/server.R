shinyServer(
  function(input, output) {
    output$display_text <- renderText(input$user_input)
    output$n_input <- renderText(nchar(input$user_input))
  }
)