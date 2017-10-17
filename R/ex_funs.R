#' @export

scale_model <- function(model, scale = TRUE) {

  # Get call
  call <- match.call()

  # Scale data if scale == TRUE
  if (scale == TRUE) {
    data <- model.frame(model)
    data <- as.data.frame(scale(data))
    scaled_model <- update(model, data = data)
  } else {
    scaled_model <- model
  }

  # Create return object
  out <- list(model = scaled_model)

  # Add call
  attr(out, "call") <- call

  # Add class
  class(out) <- "scaled_model"

  return(out)

}

#' @export

getCall.scaled_model <- function(x, ...) {

  return(attr(x, "call"))

}

#' @export

updating_function <- function(model) {

  update(model, scale = F)

}
