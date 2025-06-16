library(shiny)

ui <- fluidPage(
    titlePanel("Simple Calculator"),
    sidebarLayout(
        sidebarPanel(
            numericInput("num1", "Enter first number:", 0),
            numericInput("num2", "Enter second number:", 0),
            fluidRow(
                column(3, actionButton("add", "Add")),
                column(3, actionButton("subtract", "Subtract")),
                column(3, actionButton("multiply", "Multiply")),
                column(3, actionButton("divide", "Divide"))
            )
        ),
        mainPanel(
            h3("Result:"),
            textOutput("result")
        )
    )
)

server <- function(input, output, session) {
    result <- reactiveVal(0)

    observeEvent(input$add, {
        result(input$num1 + input$num2)
    })

    observeEvent(input$subtract, {
        result(input$num1 - input$num2)
    })

    observeEvent(input$multiply, {
        result(input$num1 * input$num2)
    })

    observeEvent(input$divide, {
        if (input$num2 == 0) {
            result("Error: Division by zero")
        } else {
            result(input$num1 / input$num2)
        }
    })

    output$result <- renderText({
        result()
    })
}

shinyApp(ui, server)
