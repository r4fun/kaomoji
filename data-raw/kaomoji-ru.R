# src: http://kaomoji.ru/en

library(rvest)

url <- "http://kaomoji.ru/en/"

raw_html <- read_html(url)

kaomojis_categories <- raw_html %>%
  html_nodes(css = "h3") %>%
  html_text()

all_kaomojis <- raw_html %>%
  html_table(header = NA) %>%
  .[3:41] %>%
  setNames(kaomojis_categories)

normal_kaomojis <- all_kaomojis %>%
  head(-1) %>%
  lapply(unlist) %>%
  lapply(unname)

special_kaomojis <- all_kaomojis %>%
  tail(1) %>%
  unlist(recursive = FALSE)

special_kaomojis <- list(Special = setNames(
  object = as.list(special_kaomojis$Special.X1),
  nm     = special_kaomojis$Special.X2
))


kaomoji2 <- c(normal_kaomojis, special_kaomojis)
kaomoji2 <- structure(kaomoji2, class = c("kaomoji_set", class(kaomoji1)))

usethis::use_data(kaomoji2, overwrite = TRUE)
