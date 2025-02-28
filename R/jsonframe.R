# Function to include the JSON frame in the Shiny app
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
      private$session <- session
      private$original_data <- json_data
      session$sendCustomMessage("createJSONFrame", json_data)
    },
    get_json = function(input) {
      as.character(input$json_frame)
    },
    get_data_frame = function(input) {
      json_frame <- shiny::reactive(input$json_frame)
      data_frame <- purrr::map(json_frame()$data, function(row) {
        data_row <- data.frame(t(matrix(unlist(row), nrow = length(row))))
        colnames(data_row) <- unlist(json_frame()$columns)
        return(data_row)
      }) |>
        data.table::rbindlist(fill = TRUE)
      return(data_frame)
    },
    filter = function(input, filter_expression, session = shiny::getDefaultReactiveDomain()) {
      session$sendCustomMessage("filterJSONFrame", list(
        original_data = private$original_data,
        filter_expression = filter_expression
      ))
    }
  ),
  private = list(
    session = NULL,
    original_data = NULL
  )
)

