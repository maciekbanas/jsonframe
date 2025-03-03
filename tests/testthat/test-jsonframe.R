jsondata <- '[{"name": "Alice", "age": 25, "city": "New York"},
              {"name": "Bob", "age": 30, "city": "San Francisco"},
              {"name": "Charlie", "age": 35, "city": "Los Angeles"},
              {"name": "David", "age": 40, "city": "Chicago"},
              {"name": "Eve", "age": 28, "city": "Houston"}]'

mock_input <- shiny::reactiveValues(json_frame = NULL)

MockShinySession <- R6::R6Class(
  "MockShinySession",
  public = list(
    sendCustomMessage = function(message, data) {
    }
  )
)

mock_session <- MockShinySession$new()

test_that("JSONFrame initializes correctly", {
  my_json_frame <- JSONFrame$new(input = mock_input, json_data = jsondata, session = mock_session)
  expect_equal(my_json_frame$.__enclos_env__$private$original_data, jsondata)
})

test_that("get_json returns the correct json data", {
  my_json_frame <- JSONFrame$new(input = mock_input, json_data = jsondata, session = mock_session)
  shiny::isolate({ mock_input$json_frame <- jsondata })
  expect_equal(shiny::isolate(my_json_frame$get_json(mock_input)), jsondata)
})
