#' @export

do_something <- function(thing, do.it = TRUE) {

  # Get call
  call <- match.call()

  # Don't actually do anything for simplicity
  something <- thing

  # Create return object
  out <- list(something = something)

  # Add call
  attr(out, "call") <- call

  # Add class
  class(out) <- "something"

  return(out)

}

#' @export

getCall.something <- function(x, ...) {

  return(attr(x, "call"))

}

#' @export

updating_function <- function(thing) {

  update(thing, do.it = FALSE)

}
