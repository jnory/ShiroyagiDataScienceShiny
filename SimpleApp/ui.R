shinyUI(
  fluidPage(
    titlePanel("入力をそのまま出力"),
    textInput("user_input", "入力"),
    textOutput("display_text")
  )
)