library(shiny)
library(DT)

shinyUI(fluidPage(
    tags$head(
        tags$style(HTML("
                        @import url('//fonts.googleapis.com/css?family=Catamaran|Cabin:400,700');"
        ))
        ),
    
    titlePanel(h1(" Next Word Prediction Model", align = "center",
                  style = "font-family: 'Lobster', cursive;
                  font-weight: 500; line-height: 1.1; 
                  color: #4d3a7d; font-weight: bold")
    ),
    tags$header(src='image2.png', align = "right"),
    
    sidebarLayout(
        sidebarPanel(
            h4("Enter your text here", align = "center", style="font-family:'calibri'"),
            tags$style("body{background-color:#c6e2ff; color:brown;  }"),

            tags$textarea(id = 'str1', placeholder = 'Type here', rows = 5, class='form-control', 
                          style="box-shadow:-10px 2px 5px #75c99d; border-radius:10px"),
            tags$head(src='img1.png', align = "center")

        ),

        mainPanel(
            

            div(DT::dataTableOutput("table1"), style = "font-size: 110%; width: 100%; background: rgba(241,231,103,1); 
                color: black; border: 1px solid black; table-layout: fixed; width:500px; border-radius: 7px"  )
            )
        ),
    ## Footer
    hr(),
    
    
    tags$span(style="color:Blue", 
              
              tags$footer(
                  tags$p("Welcome to the Word Predicition App", style="font-size: large"),
                  tags$p("This App predicts Next word and associated Probability"),
                  tags$p("To know more about the tool and methodology please visit below link")  , 
                  tags$a(
                      href="https://github.com/ramumartha1/Capstone_Project",
                      target="_blank",
                      "https://github.com/ramumartha1/Capstone_Project"),
                  tags$p( " \n  "),
                  tags$p("Thanks for Visiting the Web App Hope you like it", style="font-size: large"),
                  align = "Center")
    )
    
    ))

