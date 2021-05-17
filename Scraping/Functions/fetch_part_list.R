
read_html("https://pcpartpicker.com/products/video-card/#page=1") %>%
  html_nodes('table') %>%
  html_text()
