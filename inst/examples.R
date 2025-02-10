devtools::load_all()

ui <- fluidPage(
  include_jsonframe(),
  shiny::actionButton("init_jsonframe", "Run JSONFrame"),
  shiny::tableOutput("jsonframe_table")
)

server <- function(input, output, session) {
  
  tableData <- shiny::reactiveValues(data = NULL)
  
  shiny::observeEvent(input$init_jsonframe, {
    example_json <- "{
      columns: ['ID', 'Name', 'Age', 'Department'],
      data: [
        [1, 'Alice', 30, 'HR'],
        [2, 'Bob', 25, 'Engineering'],
        [3, 'Charlie', 35, 'Finance']
      ]
    }"
    json_frame <- JSONFrame$new(session, input, example_json)
    tableData$data <- json_frame$get_frame(input)
  })
  
  output$jsonframe_table <- shiny::renderTable({
    shiny::req(!is.null(tableData$data))
    tableData$data()
  })
}

shiny::shinyApp(ui = ui, server = server)