is.kaomoji_set <- function(x) {
  inherits(x, "kaomoji_set")
}

is.kaomoji <- function(x) {
  inherits(x, "kaomoji")
}

#' @export
print.kaomoji <- function(x, ...) {
  cat(x)
}
