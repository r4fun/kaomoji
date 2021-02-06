# src: https://github.com/brnnkt/kaomoji_list

x <- yaml::read_yaml("inst/extdata/brnnkt-kaomoji-list.yml")
kaomoji1 <- x$kaomoji
kaomoji1 <- structure(kaomoji1, class = c("kaomoji_set", class(kaomoji1)))

usethis::use_data(kaomoji1, overwrite = TRUE)
