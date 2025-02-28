devtools::load_all()

jsondata <- '[{"name": "Alice", "age": 25, "city": "New York"},
{"name": "Bob", "age": 30, "city": "San Francisco"},
{"name": "Charlie", "age": 35, "city": "Los Angeles"},
{"name": "David", "age": 40, "city": "Chicago"},
{"name": "Eve", "age": 28, "city": "Houston"},
{"name": "Frank", "age": 45, "city": "Phoenix"},
{"name": "Grace", "age": 32, "city": "Philadelphia"},
{"name": "Heidi", "age": 38, "city": "San Antonio"},
{"name": "Ivan", "age": 50, "city": "San Diego"},
{"name": "Judy", "age": 22, "city": "Dallas"},
{"name": "Karl", "age": 28, "city": "San Jose"},
{"name": "Laura", "age": 31, "city": "Austin"},
{"name": "Mallory", "age": 37, "city": "Jacksonville"},
{"name": "Nathan", "age": 42, "city": "Fort Worth"},
{"name": "Olivia", "age": 33, "city": "Columbus"},
{"name": "Peggy", "age": 29, "city": "Charlotte"},
{"name": "Quinn", "age": 27, "city": "San Francisco"},
{"name": "Rita", "age": 34, "city": "Indianapolis"},
{"name": "Sam", "age": 36, "city": "Seattle"},
{"name": "Trudy", "age": 39, "city": "Denver"},
{"name": "Ursula", "age": 45, "city": "Washington"},
{"name": "Victor", "age": 30, "city": "Boston"},
{"name": "Wendy", "age": 33, "city": "El Paso"},
{"name": "Xavier", "age": 29, "city": "Portland"},
{"name": "Yvonne", "age": 24, "city": "Oklahoma City"},
{"name": "Zara", "age": 28, "city": "Las Vegas"},
{"name": "Alice", "age": 25, "city": "New York"},
{"name": "Bob", "age": 30, "city": "San Francisco"},
{"name": "Charlie", "age": 35, "city": "Los Angeles"},
{"name": "David", "age": 40, "city": "Chicago"},
{"name": "Eve", "age": 28, "city": "Houston"},
{"name": "Frank", "age": 45, "city": "Phoenix"},
{"name": "Grace", "age": 32, "city": "Philadelphia"},
{"name": "Heidi", "age": 38, "city": "San Antonio"},
{"name": "Ivan", "age": 50, "city": "San Diego"},
{"name": "Judy", "age": 22, "city": "Dallas"},
{"name": "Karl", "age": 28, "city": "San Jose"},
{"name": "Laura", "age": 31, "city": "Austin"},
{"name": "Mallory", "age": 37, "city": "Jacksonville"},
{"name": "Nathan", "age": 42, "city": "Fort Worth"},
{"name": "Olivia", "age": 33, "city": "Columbus"},
{"name": "Peggy", "age": 29, "city": "Charlotte"},
{"name": "Quinn", "age": 27, "city": "San Francisco"},
{"name": "Rita", "age": 34, "city": "Indianapolis"},
{"name": "Sam", "age": 36, "city": "Seattle"},
{"name": "Trudy", "age": 39, "city": "Denver"},
{"name": "Ursula", "age": 45, "city": "Washington"},
{"name": "Victor", "age": 30, "city": "Boston"},
{"name": "Wendy", "age": 33, "city": "El Paso"},
{"name": "Xavier", "age": 29, "city": "Portland"},
{"name": "Yvonne", "age": 24, "city": "Oklahoma City"},
{"name": "Zara", "age": 28, "city": "Las Vegas"},
{"name": "Alice", "age": 25, "city": "New York"},
{"name": "Bob", "age": 30, "city": "San Francisco"},
{"name": "Charlie", "age": 35, "city": "Los Angeles"},
{"name": "David", "age": 40, "city": "Chicago"},
{"name": "Eve", "age": 28, "city": "Houston"},
{"name": "Frank", "age": 45, "city": "Phoenix"},
{"name": "Grace", "age": 32, "city": "Philadelphia"},
{"name": "Heidi", "age": 38, "city": "San Antonio"},
{"name": "Ivan", "age": 50, "city": "San Diego"},
{"name": "Judy", "age": 22, "city": "Dallas"},
{"name": "Karl", "age": 28, "city": "San Jose"},
{"name": "Laura", "age": 31, "city": "Austin"},
{"name": "Mallory", "age": 37, "city": "Jacksonville"},
{"name": "Nathan", "age": 42, "city": "Fort Worth"},
{"name": "Olivia", "age": 33, "city": "Columbus"},
{"name": "Peggy", "age": 29, "city": "Charlotte"},
{"name": "Quinn", "age": 27, "city": "San Francisco"},
{"name": "Rita", "age": 34, "city": "Indianapolis"},
{"name": "Sam", "age": 36, "city": "Seattle"},
{"name": "Trudy", "age": 39, "city": "Denver"},
{"name": "Ursula", "age": 45, "city": "Washington"},
{"name": "Victor", "age": 30, "city": "Boston"},
{"name": "Wendy", "age": 33, "city": "El Paso"},
{"name": "Xavier", "age": 29, "city": "Portland"},
{"name": "Yvonne", "age": 24, "city": "Oklahoma City"},
{"name": "Zara", "age": 28, "city": "Las Vegas"},
{"name": "Alice", "age": 25, "city": "New York"},
{"name": "Bob", "age": 30, "city": "San Francisco"},
{"name": "Charlie", "age": 35, "city": "Los Angeles"},
{"name": "David", "age": 40, "city": "Chicago"},
{"name": "Eve", "age": 28, "city": "Houston"},
{"name": "Frank", "age": 45, "city": "Phoenix"},
{"name": "Grace", "age": 32, "city": "Philadelphia"},
{"name": "Heidi", "age": 38, "city": "San Antonio"},
{"name": "Ivan", "age": 50, "city": "San Diego"},
{"name": "Judy", "age": 22, "city": "Dallas"},
{"name": "Karl", "age": 28, "city": "San Jose"},
{"name": "Laura", "age": 31, "city": "Austin"},
{"name": "Mallory", "age": 37, "city": "Jacksonville"},
{"name": "Nathan", "age": 42, "city": "Fort Worth"},
{"name": "Olivia", "age": 33, "city": "Columbus"},
{"name": "Peggy", "age": 29, "city": "Charlotte"},
{"name": "Quinn", "age": 27, "city": "San Francisco"},
{"name": "Rita", "age": 34, "city": "Indianapolis"},
{"name": "Sam", "age": 36, "city": "Seattle"},
{"name": "Trudy", "age": 39, "city": "Denver"},
{"name": "Ursula", "age": 45, "city": "Washington"},
{"name": "Victor", "age": 30, "city": "Boston"},
{"name": "Wendy", "age": 33, "city": "El Paso"},
{"name": "Xavier", "age": 29, "city": "Portland"},
{"name": "Yvonne", "age": 24, "city": "Oklahoma City"},
{"name": "Zara", "age": 28, "city": "Las Vegas"}]'

# UI
ui <- fluidPage(
  include_jsonframe(),
  titlePanel("JSONFrame Shiny App"),
  sidebarLayout(
    sidebarPanel(
      textInput("filter_expression", "Filter Expression", value = "age >= 30"),
      actionButton("filter_btn", "Apply Filter"),
      textOutput("json_string")
    ),
    mainPanel(
      tableOutput("data_table")
    )
  )
)

# Server logic
server <- function(input, output, session) {
  # Include the jsonframe function to load the JavaScript
  include_jsonframe()
  
  # Initialize the JSONFrame object
  my_json_frame <- JSONFrame$new(input, jsondata)
  
  # Apply filter when button is clicked
  observeEvent(input$filter_btn, {
    my_json_frame$filter(input, input$filter_expression)
  })
  
  output$json_string <- renderText({
    req(input$json_frame)
    my_json_frame$get_json(input)
  })
  
  # Render data table
  output$data_table <- renderTable({
    req(input$json_frame)
    my_json_frame$get_data_frame(input)
  })
}

# Run the application
shinyApp(ui = ui, server = server)