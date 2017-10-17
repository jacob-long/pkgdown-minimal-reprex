#' @export

scale_model <- function(model, scale = TRUE) {

  call <- match.call()

  if (scale == TRUE) {
    scaled_model <- scale_it(model)
  } else {
    scaled_model <- model
  }

  out <- list(model = scaled_model)

  attr(out, "call") <- call
  class(out) <- "scaled_model"

  return(out)

}


scale_it <- function(model) {

  data <- model.frame(model)
  data <- as.data.frame(scale(data))
  scaled_model <- update(model, data = data)
  return(scaled_model)

}

#' @export

getCall.scaled_model <- function(x, ...) {

  return(attr(x, "call"))

}

#' @export

updating_function <- function(model) {

  update(model, scale = F)

}
