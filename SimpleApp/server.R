shinyServer(
  function(input, output) {
    output$display_text <- renderText(input$user_input)
  }
)