shinyUI(
  fluidPage(
    titlePanel("HTML App"),
    sidebarLayout(
      sidebarPanel(
        h2("見出し"),
        p("適当に段落を作れる。", br(), "改行もできる。"),
        div("ブロック1"),
        div("スタイルシートを設定", style="font-style: italic; font-weight:bold;")
      ),
      mainPanel(
        h2("画像埋め込み"),
        img(src="https://shiroyagi.co.jp/images/logo-white-no.png"),
        hr(), h2("リンク"),
        a(href="https://shiroyagi.co.jp/", "白ヤギコーポレーション")
      )
    )
  )
)