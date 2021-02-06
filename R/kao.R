#' Return a random kaomoji
#'
#' @param x A list of kaomoji sets to sample from
#' @export
kao_random <- function(x = list(kaomoji1, kaomoji2)) {
  is_kaomoji_set <- all(unlist(lapply(x, function(i) {
    is.kaomoji_set(i)
  })))
  if (is_kaomoji_set) {
    out <- sample(unlist(x), 1)
    structure(out, class = c("kaomoji", class(out)))
  } else {
    stop("Detected an object that isn't a <kaomoji_set>", call. = FALSE)
  }
}
