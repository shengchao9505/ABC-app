
shinyUI(fluidPage(
  #titlePanel("Recommend for Gastric Cancer screening and Surveillance based on modified ABC method"),
  tags$head(includeHTML(("google-analytics.html"))), #this is only needed for Google analytics when deployed as app to the UGA server. Should not affect R package use.
  tags$head(tags$script('window.onbeforeunload = function() { return "Please use the button on the webpage"; };')), #warning message if user hits browser back button
  
  includeCSS("packagestyle.css"),
  tags$style(type="text/css",
             ".shiny-output-error { visibility: hidden; }",
             ".shiny-output-error:before { visibility: hidden; }"
  ), 
  tags$style(HTML("
        input[type=number] {
              -moz-appearance:textfield;
        }
        input[type=number]::{
              -moz-appearance:textfield;
        }
        input[type=number]::-webkit-outer-spin-button,
        input[type=number]::-webkit-inner-spin-button {
              -webkit-appearance: none;
              margin: 0;
        }
    ")),
  
  tags$div(id = "shinyheadertitle", "Recommend for Gastric Cancer screening and Surveillance based on modified ABC method"),
  tags$div(id = "shinyheadertext", "You can use this calculator to work out your risk of developing colorectal cancer by answering some simple questions."),
  tags$div(id = "infotext", "Written and maintained by", a("Chao Sheng", href="http://www.baidu.com", target="_blank"), "with contributions from", a("others.",  href="https://github.com/shengchao9505/Rcode", target="_blank")),
  tags$div(id = "infotext", "More information can be found", a("on the package website.",  href="https://github.com/shengchao9505/Rcode", target="_blank")),
  sidebarLayout(
    sidebarPanel(width=3, 
      #list(tags$head(tags$style("body {background-color: #ADD8E6; }"))),
      
      
      numericInput("PG1","PGI level(ng/ml)", value = 70, min = 0,step = 0.01),
      numericInput("PG2","PGII level(ng/ml)", value = 5,min = 0,step = 0.01),
      numericInput("PGR","PGI/II ratio", value = 3,min = 0,step = 0.01),
      radioButtons("HP", "HP.pylori infection status",
                   c("Negative"="Negative", "Positive"="Positive"),
                   selected = "Negative",inline=TRUE),
      radioButtons("Sex", "Sex", c("Male"="Male", "Female"="Female"), 
                   selected = "Male",inline=TRUE),
      sliderInput("Age", "What is the your current age?",
                  0, 100, 40, step = 1),
      radioButtons("Smoking", "Have you ever chewed tobacco?", c("Current"="Current", "Never/ever"="Never"), 
                   selected = "Never",inline=TRUE),
      radioButtons("Drinking", "Did you drink any alcoholic beverages in the past year", c("Current"="Current", "Never/ever"="Never"), 
                   selected = "Never",inline=TRUE),
      radioButtons("GCfamily", "Whether there is a family history of gastric cancer", c("No"="No", "Yes"="Yes"), 
                   selected = "No",inline=TRUE),
      
      submitButton('Predict')
      
    ),
    mainPanel(tabsetPanel(
      tabPanel("tab1",
               fluidRow(
                 column(12,
                        p(),
                        strong("According to the modified ABC method, you are")),
                 fluidRow(
                   column(6,
                          verbatimTextOutput("test"),
                          fluidRow(
                            column(6, 
                                   imageOutput("myImage2"))
                          )
                   ),
                   column(width=2),
                   column(width = 4,
                          strong("Introduction")),
                   column(width = 4,
                          h5("The ABC method, combined the detection of serum" ),
                          h5("anti-helicobacter and measurement of the level of serum pepsinogens (PG), 
                            has been used in screening for gastric cancer."),
                          h5("In the ABC method, gastric cancer risk of individual is classified into four groups according to the presence of 
                             chronic atrophic gastritis (CAG) identified by serum pepsinogens and H. pylori infection status:"),
                          h5("(1) H. pylori-negative and normal PG level (Group A);"),
                          h5("(2) H. pylori infection without extensive CAG (Group B);"),
                          h5("(3) H. pylori infection and extensive CAG (Group C);"),
                          h5("(4) H. pylori negative and severe CAG (Group D);"),
                          h5("Therefore, we attempt to use the only PGII level to reclassify the group B so that individuals with higher PGII level (PGII>=20) in group B could be also considered as the higher-risk population to endoscopic examination with group C and D"),
                          h5("Based on the traditional ABC method, best cut-off point of PGII in group B to improve the efficiency of ABC method in Chinese population,
                             our study may suggest a new easy screening strategy for gastric cancer."),
                          style = "width: 48vh;"))
               ),
               fluidRow(
                 column(12,imageOutput("myImage3")) 
               )
               
      ),
      tabPanel("tab2",
               inputPanel(helpText("Input Panel"))
      )
    )
    )
    
    #close "Analyze" tab
    
  )
))
