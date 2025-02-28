include_jsonframe <- function() {
  shiny::addResourcePath("www", system.file("www", package = "jsonframe"))
  htmltools::tags$head(
    htmltools::tags$script(src = "www/script.js")
  )
}

# Define the JSONFrame R6 Class
JSONFrame <- R6::R6Class(
  "JSONFrame",
  public = list(
    initialize = function(input, json_data, session = shiny::getDefaultReactiveDomain()) {
      private$original_data <- json_data
      session$sendCustomMessage("createJSONFrame", json_data)
    },
    get_json = function(input) {
      as.character(input$json_frame)
    },
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