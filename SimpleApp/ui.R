shinyUI(
  fluidPage(
    titlePanel("入力をそのまま出力"),
    sidebarLayout(
      sidebarPanel(
        textInput(
          "user_input", "入力"
        )
      ),
      mainPanel(
        textOutput("display_text")
      )
    )
  )
)