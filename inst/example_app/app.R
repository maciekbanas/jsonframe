pkgload::load_all()

ui <- fluidPage(
  include_jsonframe(),
  shiny::tags$head(
    shiny::tags$script('
    var example_json = [{"name": "Alice", "age": 25, "city": "New York"},
      {"name": "Bob", "age": 30, "city": "San Francisco"},
      {"name": "Charlie", "age": 35, "city": "Los Angeles"},
      {"name": "David", "age": 40, "city": "Chicago"},
      {"name": "Eve", "age": 28, "city": "New York"},
      {"name": "Frank", "age": 45, "city": "Phoenix"},
      {"name": "Grace", "age": 32, "city": "Philadelphia"},
      {"name": "Heidi", "age": 38, "city": "Phoenix"},
      {"name": "Ivan", "age": 50, "city": "New York"},
      {"name": "Judy", "age": 22, "city": "Chicago"},
      {"name": "Karl", "age": 28, "city": "San Jose"},
      {"name": "Laura", "age": 31, "city": "Austin"},
      {"name": "Mallory", "age": 37, "city": "Phoenix"},
      {"name": "Nathan", "age": 42, "city": "Los Angeles"}]')
  ),
  titlePanel("JSONFrame Shiny App"),
  sidebarLayout(
    sidebarPanel(
      textInput("filter_expression", "Filter Expression", value = ""),
      actionButton("filter_btn", "Apply Filter")
    ),
    mainPanel(
      shiny::h2("Dataset name"),
      textOutput("dataset_name"),
      shiny::h2("Filtering expression translated"),
      textOutput("filter_translation"),
      shiny::h2("Dataset"),
      textOutput("json_string")
    )
  )
)

server <- function(input, output, session) {
  
  my_json_frame <- JSONFrame$new(input, "example_json")
  
  shiny::observeEvent(input$filter_btn, {
    my_json_frame$filter(input, input$filter_expression)
  })
  
  output$dataset_name <- shiny::renderText({
    my_json_frame$get_data_name(input)
  })
  
  output$filter_translation <- shiny::renderText({
    my_json_frame$get_translation(input)
  })
  
  output$json_string <- shiny::renderText({
    my_json_frame$get_json(input)
  })

}

test_app <- shinyApp(ui = ui, server = server)