shinyUI(
  fluidPage(
    titlePanel("echo"),
    textInput("user_input", "Input"),
    textOutput("display_text")
  )
)