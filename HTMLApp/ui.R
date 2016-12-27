shinyUI(
  fluidPage(
    titlePanel("HTML App"),
    sidebarLayout(
      sidebarPanel(
        h2("Headings"),
        p("Creating paragraphs", br(), "enable breaking lines."),
        div("Block 1"),
        div("Customizing style sheet.", style="font-style: italic; font-weight:bold;")
      ),
      mainPanel(
        h2("Embedding an image"),
        img(src="https://shiroyagi.co.jp/images/logo-white-no.png"),
        hr(), h2("Link"),
        a(href="https://shiroyagi.co.jp/", "Shiroyagi Corporation")
      )
    )
  )
)