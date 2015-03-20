# The user-interface definition of the Shiny web app.
library(shiny)

# Multi-page user-interface that includes a navigation bar.
shinyUI(navbarPage("Data Searcher",
        
        # Start of "Word Combiner" tab panel
        tabPanel("Word Combiner", 
            sidebarPanel(
                textInput(inputId="text1", label = "Input Text1"),
                textInput(inputId="text2", label = "Input Text2"),
                actionButton("goButton", "Go!")
            ),
            mainPanel(
              p('Output Text1'),
              textOutput('text1'),
              p('Output Text2'),
              textOutput('text2'),
              p('Output Text1 + Text2'),
              textOutput('text3')
            )
        ),
        # end of "Word Combiner" tab panel
        # start of "Data Searcher" tab panel
        tabPanel("Data Searcher",
             sidebarPanel(
                sliderInput("timeline", 
                            "Timeline", 
                            min = 1950,
                            max = 2015,
                            value = c(2010, 2015),
                            format = "####"),
                uiOutput("themesControl"), # the id
                actionButton(inputId = "clearAll", 
                             label = "Clear selection", 
                             icon = icon("square-o")),
                actionButton(inputId = "selectAll", 
                             label = "Select all", 
                             icon = icon("check-square-o"))
        
             ),
             mainPanel(
                 tabsetPanel(
                   # Data 
                   tabPanel(p(icon("table"), "Dataset"),
                            dataTableOutput(outputId="dTable")
                   )
                 )
                   
            )     
        ), # end of "Data Searcher" tab panel
        # start of "Readme" tab panel
        tabPanel("Readme",
                 mainPanel(
                   includeMarkdown("about.md")
                 )
        ) # end of "Readme" tab panel
    )
  
)
