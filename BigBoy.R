library(shiny)

ui <- fluidPage(
  titlePanel("Simple Calculator"),
  
  sidebarLayout(
    sidebarPanel(
      numericInput("num1", "Enter first number:", 0),
      numericInput("num2", "Enter second number:", 0),
      
      # Use fluidRow for each row of buttons, spacing nicely
      fluidRow(
        column(6, actionButton("add", "Add", width = "100%")),
        column(6, actionButton("subtract", "Subtract", width = "100%"))
      ),
      br(),
      fluidRow(
        column(6, actionButton("multiply", "Multiply", width = "100%")),
        column(6, actionButton("divide", "Divide", width = "100%"))
      ),
      br(),
      fluidRow(
        column(6, actionButton("power", "Exponentiate", width = "100%")),
        column(6, actionButton("root", "Root", width = "100%"))
      )
    ),
    
    mainPanel(
      h3("Result:"),
      # Add some padding around the result output
      div(style = "padding: 10px; border: 1px solid #ddd; border-radius: 4px; min-height: 50px;",
          textOutput("result"))
    )
  )
)

server <- function(input, output, session) {
  result <- reactiveVal(0)
  
  validateInputs <- function() {
    if (is.na(input$num1) || is.na(input$num2)) {
      return("Error: Please enter valid numbers.")
    }
    return(NULL)
  }
  
  observeEvent(input$add, {
    error <- validateInputs()
    if (!is.null(error)) {
      result(error)
    } else {
      result(input$num1 + input$num2)
    }
  })
  
  observeEvent(input$subtract, {
    error <- validateInputs()
    if (!is.null(error)) {
      result(error)
    } else {
      result(input$num1 - input$num2)
    }
  })
  
  observeEvent(input$multiply, {
    error <- validateInputs()
    if (!is.null(error)) {
      result(error)
    } else {
      result(input$num1 * input$num2)
    }
  })
  
  observeEvent(input$divide, {
    error <- validateInputs()
    if (!is.null(error)) {
      result(error)
    } else if (input$num2 == 0) {
      result("Error: Division by zero")
    } else {
      result(input$num1 / input$num2)
    }
  })
  
  observeEvent(input$root, {
    error <- validateInputs()
    if (!is.null(error)) {
      result(error)
    } else if (input$num2 == 0 || input$num2 == 1) {
      result("Error: Invalid value for index of root")
    } else if (input$num1 < 0 && input$num2 %% 2 == 0) {
      result("Error: Invalid value for radicand of root")
    } else {
      result(input$num1 ^ (1 / input$num2))
    }
  })
  
  observeEvent(input$power, {
    error <- validateInputs()
    if (!is.null(error)) {
      result(error)
    } else {
      result(input$num1 ^ input$num2)
    }
  })
  
  output$result <- renderText({
    result()
  })
}

shinyApp(ui, server) #paste in terminal after running code to open window in VS code
