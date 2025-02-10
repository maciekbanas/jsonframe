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
      session$sendCustomMessage("createJSONFrame", json_data)
    },
    get_frame = function(input) {
      shiny::reactive(input$json_frame)
    }
  )
)