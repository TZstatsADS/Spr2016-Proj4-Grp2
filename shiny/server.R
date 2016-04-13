 shinyServer(function(input, output) {
   output$cat1 <- renderText({
     paste("No.1:",catnamelist[[input$cate]][1])
   })
   output$cat2 <- renderText({
     paste("No.2:",catnamelist[[input$cate]][2])
   })
   output$cat3 <- renderText({
     paste("No.3:",catnamelist[[input$cate]][3])
   })
   output$cat4 <- renderText({
     paste("No.4:",catnamelist[[input$cate]][4])
   })
   output$cat5 <- renderText({
     paste("No.5:",catnamelist[[input$cate]][5])
   })
   output$catimg1 <- renderImage({
     filename=(unlist(catimglist[[input$cate]][1])[1])
     list(src=filename,height=200)
   },deleteFile = F)
   output$catimg2 <- renderImage({
     filename=(unlist(catimglist[[input$cate]][2])[1])
     list(src=filename,height=200)
     },deleteFile = F)
   
   output$catimg3 <- renderImage({
     filename=unlist(catimglist[[input$cate]][3])[1]
     list(src=filename,height=200)},deleteFile = F)
   
   output$catimg4 <- renderImage({
     filename=unlist(catimglist[[input$cate]][4])[1]
     list(src=filename,height=200)},deleteFile = F)
   
   output$catimg5 <- renderImage({
     filename=unlist(catimglist[[input$cate]][5])[1]
     list(src=filename,height=200)},deleteFile = F)
   
  output$top1 <- renderImage({filename=unlist(imglist[[1]])
  list(src=filename,height=200)},deleteFile = F)
  output$top2 <- renderImage({filename=unlist(imglist[[2]])
  list(src=filename,height=200)},deleteFile = F)
  output$top3 <- renderImage({filename=unlist(imglist[[3]])
  list(src=filename,height=200)},deleteFile = F)
  output$top4 <- renderImage({filename=unlist(imglist[[4]])
  list(src=filename,height=200)},deleteFile = F)
  output$top5 <- renderImage({filename=unlist(imglist[[5]])
  list(src=filename,height=200)},deleteFile = F)
  output$top6 <- renderImage({filename=unlist(imglist[[6]])
  list(src=filename,height=200)},deleteFile = F)
  output$top7 <- renderImage({filename=unlist(imglist[[7]])
  list(src=filename,height=200)},deleteFile = F)
  output$top8 <- renderImage({filename=unlist(imglist[[8]])
  list(src=filename,height=200)},deleteFile = F)
  output$top9 <- renderImage({filename=unlist(imglist[[9]])
  list(src=filename,height=200)},deleteFile = F)
  output$top10 <- renderImage({filename=unlist(imglist[[10]])
  list(src=filename,height=200)},deleteFile = F)
  output$topname1 <- renderText({paste("No.1:",namelist[[1]])})
  output$topname2 <- renderText({paste("No.2:",namelist[[2]])})
  output$topname3 <- renderText({paste("No.3:",namelist[[3]])})
  output$topname4 <- renderText({paste("No.4:",namelist[[4]])})
  output$topname5 <- renderText({paste("No.5:",namelist[[5]])})
  output$topname6 <- renderText({paste("No.6:",namelist[[6]])})
  output$topname7 <- renderText({paste("No.7:",namelist[[7]])})
  output$topname8 <- renderText({paste("No.8:",namelist[[8]])})
  output$topname9 <- renderText({paste("No.9:",namelist[[9]])})
  output$topname10 <- renderText({paste("No.10:",namelist[[10]])})
  #new
  output$top1_n <- renderImage({filename=unlist(imglist[[1]])
  list(src=filename,height=200)},deleteFile = F)
  output$top2_n <- renderImage({filename=unlist(imglist[[2]])
  list(src=filename,height=200)},deleteFile = F)
  output$top3_n <- renderImage({filename=unlist(imglist[[3]])
  list(src=filename,height=200)},deleteFile = F)
  output$top4_n <- renderImage({filename=unlist(imglist[[4]])
  list(src=filename,height=200)},deleteFile = F)
  output$top5_n <- renderImage({filename=unlist(imglist[[5]])
  list(src=filename,height=200)},deleteFile = F)
  output$top6_n <- renderImage({filename=unlist(imglist[[6]])
  list(src=filename,height=200)},deleteFile = F)
  output$top7_n <- renderImage({filename=unlist(imglist[[7]])
  list(src=filename,height=200)},deleteFile = F)
  output$top8_n <- renderImage({filename=unlist(imglist[[8]])
  list(src=filename,height=200)},deleteFile = F)
  output$top9_n <- renderImage({filename=unlist(imglist[[9]])
  list(src=filename,height=200)},deleteFile = F)
  output$top10_n <- renderImage({filename=unlist(imglist[[10]])
  list(src=filename,height=200)},deleteFile = F)
  output$topname1_n <- renderText({paste("No.1:",namelist[[1]])})
  output$topname2_n <- renderText({paste("No.2:",namelist[[2]])})
  output$topname3_n <- renderText({paste("No.3:",namelist[[3]])})
  output$topname4_n <- renderText({paste("No.4:",namelist[[4]])})
  output$topname5_n <- renderText({paste("No.5:",namelist[[5]])})
  output$topname6_n <- renderText({paste("No.6:",namelist[[6]])})
  output$topname7_n <- renderText({paste("No.7:",namelist[[7]])})
  output$topname8_n <- renderText({paste("No.8:",namelist[[8]])})
  output$topname9_n <- renderText({paste("No.9:",namelist[[9]])})
  output$topname10_n <- renderText({paste("No.10:",namelist[[10]])})
  #old
  output$top1_o <- renderImage({filename=unlist(imglist[[1]])
  list(src=filename,height=200)},deleteFile = F)
  output$top2_o <- renderImage({filename=unlist(imglist[[2]])
  list(src=filename,height=200)},deleteFile = F)
  output$top3_o <- renderImage({filename=unlist(imglist[[3]])
  list(src=filename,height=200)},deleteFile = F)
  output$top4_o <- renderImage({filename=unlist(imglist[[4]])
  list(src=filename,height=200)},deleteFile = F)
  output$top5_o <- renderImage({filename=unlist(imglist[[5]])
  list(src=filename,height=200)},deleteFile = F)
  output$top6_o <- renderImage({filename=unlist(imglist[[6]])
  list(src=filename,height=200)},deleteFile = F)
  output$top7_o <- renderImage({filename=unlist(imglist[[7]])
  list(src=filename,height=200)},deleteFile = F)
  output$top8_o <- renderImage({filename=unlist(imglist[[8]])
  list(src=filename,height=200)},deleteFile = F)
  output$top9_o <- renderImage({filename=unlist(imglist[[9]])
  list(src=filename,height=200)},deleteFile = F)
  output$top10_o <- renderImage({filename=unlist(imglist[[10]])
  list(src=filename,height=200)},deleteFile = F)
  output$topname1_o <- renderText({paste("No.1:",namelist[[1]])})
  output$topname2_o <- renderText({paste("No.2:",namelist[[2]])})
  output$topname3_o <- renderText({paste("No.3:",namelist[[3]])})
  output$topname4_o <- renderText({paste("No.4:",namelist[[4]])})
  output$topname5_o <- renderText({paste("No.5:",namelist[[5]])})
  output$topname6_o <- renderText({paste("No.6:",namelist[[6]])})
  output$topname7_o <- renderText({paste("No.7:",namelist[[7]])})
  output$topname8_o <- renderText({paste("No.8:",namelist[[8]])})
  output$topname9_o <- renderText({paste("No.9:",namelist[[9]])})
  output$topname10_o <- renderText({paste("No.10:",namelist[[10]])})
  
  output$new1 <- renderText({
    if(setequal(unlist(input$newu),c("1","2","3"))){paste(newnamelist[[1]][1])}
    else if(setequal(unlist(input$newu),c("4","5","6"))){paste(newnamelist[[2]][1])}
    else{paste("To be Continued")}
  })
  output$new2 <- renderText({
    if(setequal(unlist(input$newu),c("1","2","3"))){paste(newnamelist[[1]][2])}
    else if(setequal(unlist(input$newu),c("4","5","6"))){paste(newnamelist[[2]][2])}
    else{paste("To be Continued")}
  })
  output$new3 <- renderText({
    if(setequal(unlist(input$newu),c("1","2","3"))){paste(newnamelist[[1]][3])}
    else if(setequal(unlist(input$newu),c("4","5","6"))){paste(newnamelist[[2]][3])}
    else{paste("To be Continued")}
  })
  output$new4 <- renderText({
    if(setequal(unlist(input$newu),c("1","2","3"))){paste(newnamelist[[1]][4])}
    else if(setequal(unlist(input$newu),c("4","5","6"))){paste(newnamelist[[2]][4])}
    else{paste("To be Continued")}
  })
  output$new5 <- renderText({
    if(setequal(unlist(input$newu),c("1","2","3"))){paste(newnamelist[[1]][5])}
    else if(setequal(unlist(input$newu),c("4","5","6"))){paste(newnamelist[[2]][5])}
    else{paste("To be Continued")}
  })
  output$newimg1 <- renderImage({
    if(setequal(unlist(input$newu),c("1","2","3"))){
      filename=(unlist(newimglist[[1]][1])[1])
    list(src=filename,height=200)}
    else if(setequal(unlist(input$newu),c("4","5","6"))){
      filename=(unlist(newimglist[[2]][1])[1])
      list(src=filename,height=200)}
    else{
      filename=(unlist(newimglist[[3]][1])[1])
    list(src=filename,height=200)}
  },deleteFile = F)
  output$newimg2 <- renderImage({
    if(setequal(unlist(input$newu),c("1","2","3"))){
      filename=(unlist(newimglist[[1]][2])[1])
    list(src=filename,height=200)}
    else if(
      setequal(unlist(input$newu),c("4","5","6"))){filename=(unlist(newimglist[[2]][2])[1])
    list(src=filename,height=200)}
    else{
      filename=(unlist(newimglist[[3]][2])[1])
      list(src=filename,height=200)}
  },deleteFile = F)
  
  output$newimg3 <- renderImage({
    if(setequal(unlist(input$newu),c("1","2","3"))){
      filename=(unlist(newimglist[[1]][3])[1])
    list(src=filename,height=200)}
    else if(setequal(unlist(input$newu),c("4","5","6"))){
      filename=(unlist(newimglist[[2]][3])[1])
      list(src=filename,height=200)}
    else{
      filename=(unlist(newimglist[[3]][3])[1])
    list(src=filename,height=200)}
    
    },deleteFile = F)
  
  output$newimg4 <- renderImage({
    if(setequal(unlist(input$newu),c("1","2","3"))){
      filename=(unlist(newimglist[[1]][4])[1])
      list(src=filename,height=200)}
    else if(setequal(unlist(input$newu),c("4","5","6"))){
      filename=(unlist(newimglist[[2]][4])[1])
      list(src=filename,height=200)}
    else{
      filename=(unlist(newimglist[[3]][4])[1])
    list(src=filename,height=200)}
    
    },deleteFile = F)
  
  output$newimg5 <- renderImage({
    if(setequal(unlist(input$newu),c("1","2","3"))){
      filename=(unlist(newimglist[[1]][5])[1])
      list(src=filename,height=200)}
    else if(setequal(unlist(input$newu),c("4","5","6"))){
      filename=(unlist(newimglist[[2]][5])[1])
      list(src=filename,height=200)}
    else{
      filename=(unlist(newimglist[[3]][5])[1])
    list(src=filename,height=200)}
    
    },deleteFile = F)
  
  output$old1 <- renderText({
    paste(oldnamelist[[input$oldu]][1])
  })
  output$old2 <- renderText({
    paste(oldnamelist[[input$oldu]][2])
  })
  output$old3 <- renderText({
    paste(oldnamelist[[input$oldu]][3])
  })
  output$old4 <- renderText({
    paste(oldnamelist[[input$oldu]][4])
  })
  output$old5 <- renderText({
    paste(oldnamelist[[input$oldu]][5])
  })
  output$oldimg1 <- renderImage({
    filename=(unlist(oldimglist[[input$oldu]][1])[1])
    list(src=filename,height=200)
  },deleteFile = F)
  output$oldimg2 <- renderImage({
    filename=(unlist(oldimglist[[input$oldu]][2])[1])
    list(src=filename,height=200)
  },deleteFile = F)
  
  output$oldimg3 <- renderImage({
    filename=unlist(oldimglist[[input$oldu]][3])[1]
    list(src=filename,height=200)},deleteFile = F)
  
  output$oldimg4 <- renderImage({
    filename=unlist(oldimglist[[input$oldu]][4])[1]
    list(src=filename,height=200)},deleteFile = F)
  
  output$oldimg5 <- renderImage({
    filename=unlist(oldimglist[[input$oldu]][5])[1]
    list(src=filename,height=200)},deleteFile = F)
  
  # output$test <- renderPrint(input$newu)
 })
   


