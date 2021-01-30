library(rvest)

url <- "http://kaomoji.ru/en/"

raw_html <- read_html(url)

kaomojis_categories <- raw_html %>%
  html_nodes(css = "h3") %>%
  html_text()

kaomojis <- raw_html %>%
  html_table(header = NA) %>%
  .[3:41] %>%
  setNames(kaomojis_categories) %>%
  lapply(unlist)

usethis::use_data(kaomojis, internal = F, overwrite = T)
