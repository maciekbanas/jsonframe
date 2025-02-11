include_jsonframe <- function() {
  addResourcePath("www", system.file("www", package = "jsonframe"))
  htmltools::tags$head(
    htmltools::tags$script(src = "www/script.js")
  )
}
JSONFrame <- R6::R6Class(
  "JSONFrame",
  public = list(
    initialize = function(session, input, json_data) {
      private$session <- session
      session$sendCustomMessage("createJSONFrame", json_data)
    },
    get_json = function(input) {
      jsonlite::toJSON(input$json_frame)
    },
    get_data_frame = function(input) {
      json_frame <- shiny::reactive(input$json_frame)
      data_frame <- purrr::map(json_frame()$data, function(row) {
        data_row <- data.frame(row)
        colnames(data_row) <- unlist(json_frame()$columns)
        return(data_row)
      }) |>
        data.table::rbindlist()
      return(data_frame)
    },
    filter = function(input, filter_expression) {
      private$session$sendCustomMessage("filterJSONFrame", filter_expression)
    }
  ),
  private = list(
    session = NULL
  )
)