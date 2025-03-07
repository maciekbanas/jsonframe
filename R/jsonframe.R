#' @importFrom R6 R6Class

#' @title Link JS code.
#' @name include_jsonframe
#' @export
include_jsonframe <- function() {
  shiny::addResourcePath("www", system.file("www", package = "jsonframe"))
  htmltools::tags$head(
    htmltools::tags$script(src = "www/script.js")
  )
}

#' @title A `JSONFrame` class.
#' @export
JSONFrame <- R6::R6Class(
  "JSONFrame",
  public = list(
    #' @description Send `JSON` data to the browser.
    #' @param input A `Shiny` input parameter.
    #' @param json_data A character - should mirror JSON data structure.
    #' @param session A `Shiny` session parameter.
    initialize = function(input, json_data, session = shiny::getDefaultReactiveDomain()) {
      private$original_data <- json_data
      session$sendCustomMessage("createJSONFrame", json_data)
    },
    #' @description Retrieve `JSON` from the browser.
    #' @param input A `Shiny` input parameter.
    get_json = function(input) {
      as.character(input$json_frame)
    },
    #' @description Send `JSON` data to the browser.
    #' @param input A `Shiny` input parameter.
    #' @param filter_expression A character, filtering expression (e.g. "{var} >= 0").
    #' @param session A `Shiny` session parameter.
    filter = function(input, filter_expression, session = shiny::getDefaultReactiveDomain()) {
      session$sendCustomMessage("filterJSONFrame", list(
        original_data = private$original_data,
        filter_expression = filter_expression
      ))
    }
  ),
  private = list(
    original_data = NULL
  )
)