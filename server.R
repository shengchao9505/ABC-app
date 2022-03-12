library(DT)
shinyServer(function(input, output) {
 # text <- reactive({ data<-read.csv("D:/Rcode/PGPaper/5 GUI/abc.csv",header = FALSE)

  #   return(data) 
  #})
  preds <- reactive( {
    PG1 <- (input$PG1)
    PG2 <-(input$PG2)
    PGR <- (input$PGR)
    HP <-(input$HP)
    Sex <- (input$Sex)
    Age <- (input$Age)
    Drinking<- (input$Drinking)
    GCfamily <- (input$GCfamily)
    ABC=factor(ifelse(PG1<=70 & PGR<=3, ifelse(HP=="Negative",5,4),
                      ifelse(HP=="Negative",1,ifelse(PG2<20,2,3))),levels=seq(5),labels=c("A","B1","B2","C","D"))
   
    return((ABC))
    
  })
  output$test<- renderText({
    tmp <- preds()
    paste("Group", tmp)
    
  })
  output$myImage2 <- renderImage({
    # When input$n is 3, filename is ./images/image3.jpeg
    filename <- normalizePath(file.path('D:/Rcode/PGPaper/Code/5 GUI/',
                                        paste('image2','.jpg', sep='')))
    
    # Return a list containing the filename and alt text
    list(src = filename,
         width = 420,
         height = 360)
    
  }, deleteFile = FALSE)
  #output$text<-renderTable({text()})
  output$myImage3 <- renderImage({
    # When input$n is 3, filename is ./images/image3.jpeg
    filename <- normalizePath(file.path('D:/Rcode/PGPaper/Code/5 GUI/',
                                        paste('image3','.jpg', sep='')))
    
    # Return a list containing the filename and alt text
    list(src = filename,
         width = 900,
         height = 200)
    
  }, deleteFile = FALSE)
  
})
