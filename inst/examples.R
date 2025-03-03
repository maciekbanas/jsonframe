devtools::load_all()

ui <- fluidPage(
  include_jsonframe(),
  htmltools::div(style = "margin-top: 10px"),
  shiny::actionButton("init_jsonframe", "Show JSONFrame"),
  htmltools::div(style = "margin-top: 10px"),
  shiny::textInput("filter_txt", "Filter JSONFrame"),
  shiny::actionButton("filter_btn", "Filter JSONFrame"),
  htmltools::div(style = "margin-top: 10px"),
  shiny::tableOutput("jsonframe_table"),
  shiny::textOutput("json_text")
)

server <- function(input, output, session) {
  
  tableData <- shiny::reactiveValues(data = NULL, text = NULL)
  
  example_json <- "{
      columns: ['ID', 'Name', 'Age', 'Department'],
      data: [
        [1, 'Alice', 30, 'HR'],
        [2, 'Bob', 25, 'Engineering'],
        [3, 'Charlie', 35, 'Finance'],
        [4, 'David', 40, 'HR'],
        [5, 'Eva', 29, 'Engineering'],
        [6, 'Frank', 45, 'Finance'],
        [7, 'Grace', 32, 'Marketing'],
        [8, 'Hannah', 28, 'Engineering'],
        [9, 'Ivy', 31, 'Finance'],
        [10, 'Jack', 26, 'Marketing']
      ]
    }"
  json_frame <- JSONFrame$new(session, input, example_json)
  
  shiny::observeEvent(input$init_jsonframe, {
    tableData$data <- shiny::reactive(json_frame$get_data_frame(input))
    tableData$text <- shiny::reactive(json_frame$get_json(input))
  })

  output$jsonframe_table <- shiny::renderTable({
    shiny::req(!is.null(tableData$data))
    tableData$data()
  })
  
  output$json_text <- shiny::renderText({
    shiny::req(!is.null(tableData$text))
    tableData$text()
  })
  
  shiny::observeEvent(input$filter_btn, {
    json_frame$filter(input, input$filter_txt)
    tableData$data <- shiny::reactive(json_frame$get_data_frame(input))
    tableData$text <- shiny::reactive(json_frame$get_json(input))
  })
}

shiny::shinyApp(ui = ui, server = server)