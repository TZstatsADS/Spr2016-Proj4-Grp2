# setwd("~/Github/project4-team-2/shiny/")
library(shiny)
library(data.table)
library(dplyr)
library(rlist)
library('shinydashboard')

olduser <- list("A16CZRQL23NOIW","A1G69BQLIUMWPN")
newuser <- list("Brokeback Mountain"=1,
                "Indiana Jones and the Kingdom of the Crystal Skull"=2,
                "V for Vendetta"=3,
                "Tangled"=4,
                "Ratatouille"=5,
                "Cars"=6,
                "Up"=7,
                "Food, Inc."=8,
                "Jeff Dunham: Spark of Insanity"=9,
                "Harry Potter and the Deathly Hallows: Part 1"=10)
load("catnamelist.Rdata")
load("catimglist.Rdata")
load("namelist.Rdata")
load("imglist.Rdata")
load("newnamelist.Rdata")
load("newimglist.Rdata")
load("oldnamelist.Rdata")
load("oldimglist.Rdata")
#  oldnamelist <- list()
# oldnamelist[["A16CZRQL23NOIW"]] <- list("Insanity",
#                          "Human Body in Action",
#                          "Bill Nye the Science Guy",
#                          "Ripped in 30",
#                          "Profit")
# oldnamelist[["A1G69BQLIUMWPN"]] <- list("Energy for Children All about Heat",
#                          "Bill Nye the Science Guy",
#                          "The B-2 Stealth Bomber",
#                          "Your Complete SAT Writing Prep Cource",
#                          "JAGARNA")
# save(oldnamelist,file="oldnamelist.Rdata")

# oldimglist <- list()
# oldimglist[["A16CZRQL23NOIW"]] <- list("./u1/1.jpg",
#                         "./u1/3.jpg",
#                         "./u1/4.jpg",
#                         "./u1/5.jpg",
#                         "./u1/7.jpg")
# oldimglist[["A1G69BQLIUMWPN"]] <- list("./u2/1.jpg",
#                         "./u2/3.jpg",
#                         "./u2/4.jpg",
#                         "./u2/7.jpg",
#                         "./u2/9.jpg")
# save(oldimglist,file="oldimglist.Rdata")

# load("oldnamelist.Rdata")
# load("oldimglist.Rdata")
# newnamelist <- list()
# newnamelist[[1]] <- list("Cars",
#                          "Indiana Jones and the Kingdom of the Crystal Skull",
#                          "Iron Man",
#                          "Harry Potter and the Deathly Hallows: Part 1",
#                          "Shrek the Third")
# newnamelist[[2]] <- list("Up",
#                          "Toy Story 3",
#                          "Shrek the Third",
#                          "How to Train Your Dragon",
#                          "Despicable Me")
# newnamelist[[3]] <- list("To be Continued")
# save(newnamelist,file="newnamelist.Rdata")
# 

# newimglist <- list()
# newimglist[[1]] <- list("./REC1/1.jpg",
#                        "./REC1/4.jpg",
#                        "./REC1/5.jpg",
#                        "./REC1/7.jpg",
#                        "./REC1/14.jpg")
# newimglist[[2]] <- list("./REC2/1.jpg",
#                         "./REC2/5.jpg",
#                         "./REC2/9.jpg",
#                         "./REC2/13.jpg",
#                         "./REC2/18.jpg")
# newimglist[[3]] <- list("./image/demo.jpg",
#                         "./image/demo1.jpg",
#                         "./image/demo2.jpg",
#                         "./image/demo3.jpg",
#                         "./image/demo4.jpg")
# save(newimglist,file='newimglist.Rdata')
# imglist <- list()
# imglist[[1]] <- "./image/ink.jpg"
# imglist[[2]] <- "./image/tb.jpg"
# imglist[[3]] <- "./image/c.jpg"
# imglist[[4]] <- "./image/jdsoi.jpg"
# imglist[[5]] <- "./image/fo.jpg"
# imglist[[6]] <- "./image/f.jpg"
# imglist[[7]] <- "./image/tpe.jpg"
# imglist[[8]] <- "./image/jdawm.jpg"
# imglist[[9]] <- "./image/hpatdhp1.jpg"
# imglist[[10]] <- "./image/enia.jpg"
# save(imglist,file = "imglist.Rdata")
# namelist <- list()
# namelist[[1]] <- "INSANITY Base Kit - DVD Workout"
# namelist[[2]] <- "True Blood: Season 1"
# namelist[[3]] <- "Cars"
# namelist[[4]] <- "Jeff Dunham: Spark of Insanity"
# namelist[[5]] <- "Food, Inc"
# namelist[[6]] <- "Fireproof"
# namelist[[7]] <- "The Polar Express "
# namelist[[8]] <- "Jeff Dunham: Arguing with Myself"
# namelist[[9]] <- "Harry Potter & The Deathly Hallows Part 1"
# namelist[[10]] <- "Expelled: No Intelligence Allowed"
# save(namelist,file='namelist.Rdata')

# save(catimglist,file="catimglist.Rdata")
# catimglist <- list()
# catimglist[["Drama"]] <- list("./image/bm.jpg",
#                                "./image/vfv.jpg",
#                                "./image/ftg.jpg",
#                                "./image/pl.jpg",
#                                "./image/ncfom.jpg")
# catimglist[["Adventure"]] <- list("./image/p.jpg",
#                                    "./image/t.jpg",
#                                    "./image/hpatdhp1.jpg",
#                                    "./image/hpatootp.jpg",
#                                    "./image/c.jpg")
catimglist[["Fantasy"]] <- list("./image/hpatdhp1.jpg",
                                 "./image/hpatootp.jpg",
                                 "./image/pl.jpg",
                                 "./image/hpathp.jpg",
                                 "./image/ijatkotcs.jpg")
# catimglist[["Romance"]] <- list("./image/bm.jpg",
#                                  "./image/b.jpg",
#                                  "./image/mitm.jpg",
#                                  "./image/f.jpg",
#                                  "./image/satc.jpg")
# catimglist[["Action"]] <- list("./image/w.jpg",
#                                 "./image/vfv.jpg",
#                                 "./image/ijatkotcs.jpg",
#                                 "./image/swath.jpg",
#                                 "./image/ba.jpg")
# catimglist[["Family"]] <- list("./image/r.jpg",
#                                 "./image/hpatdhp1.jpg",
#                                 "./image/hpatootp.jpg",
#                                 "./image/hpathp.jpg.jpg",
#                                 "./image/tpe.jpg")
# catimglist[["Comedy"]] <- list("./image/r.jpg",
#                                 "./image/t.jpg",
#                                 "./image/jdsoi.jpg",
#                                 "./image/c.jpg",
#                                 "./image/u.jpg")
# catimglist[["Animation"]] <- list("./image/r.jpg",
#                                    "./image/t.jpg",
#                                    "./image/c.jpg",
#                                    "./image/u.jpg",
#                                    "./image/tpe.jpg")
# 
# load("catname.Rdata")
# catnamelist <- list()
# catnamelist[["Drama"]] <- catname[,1]
# catnamelist[["Adventure"]] <- catname[,2]
# catnamelist[["Fantasy"]] <- catname[,3]
# catnamelist[["Romance"]] <- catname[,4]
# catnamelist[["Action"]] <- catname[,5]
# catnamelist[["Family"]] <- catname[,6]
# catnamelist[["Comedy"]] <- catname[,7]
# catnamelist[["Animation"]] <- catname[,8]
# save(catnamelist,file="catnamelist.Rdata")
# load("data1.Rdata")
# load("data2.Rdata")
# load("data3.Rdata")
# load("data4.Rdata")
# load("data5.Rdata")
# load("data6.Rdata")
# load("data7.Rdata")
# load("data8.Rdata")
# save(catname,file="catname.Rdata")
# catname1 <- list()
# for(i in 1:8){
#   catname1[i] <- catname[,i]
# }
# catname1 <- data1[1:5]
# catname1 <- data2[1:5]

# catname <- cbind(data1[1:5],data2[1:5],data3[1:5],data4[1:5],data5[1:5],data6[1:5],data7[1:5],data8[1:5])
# save(catname,file="catname.Rdata")

# load("data9.Rdata")
# load("data10.Rdata")
# 
# load("movie_info.Rdata")
# attach(info.df)
# # for(i in 1:244){
# #   info.df[i,3] <- paste0(info.df[i,3][[1]],collapse = " ")
# # }
# 
# data1 <- c()
# j=1
# for (i in 1: 244){
#   if ('Drama' %in% info.df[i,3][[1]]){
#     data1[j] <- info.df[i,2][[1]]
#     j <- j+1
#   }
# }
# data1 <- unique(data1)
# data2 <- c()
# j=1
# for (i in 1: 244){
#   if ('Adventure' %in% info.df[i,3][[1]]){
#     data2[j] <- info.df[i,2][[1]]
#     j <- j+1
#   }
# }
# data2 <- unique(data2)
# data3 <- c()
# j=1
# for (i in 1: 244){
#   if ('Fantasy' %in% info.df[i,3][[1]]){
#     data3[j] <- info.df[i,2][[1]]
#     j <- j+1
#   }
# }
# data3 <- unique(data3)
# data4 <- c()
# j=1
# for (i in 1: 244){
#   if ('Romance' %in% info.df[i,3][[1]]){
#     data4[j] <- info.df[i,2][[1]]
#     j <- j+1
#   }
# }
# data4 <- unique(data4)
# 
# data5 <- c()
# j=1
# for (i in 1: 244){
#   if ('Action' %in% info.df[i,3][[1]]){
#     data5[j] <- info.df[i,2][[1]]
#     j <- j+1
#   }
# }
# data5 <- unique(data5)
# 
# data6 <- c()
# j=1
# for (i in 1: 244){
#   if ('Family' %in% info.df[i,3][[1]]){
#     data6[j] <- info.df[i,2][[1]]
#     j <- j+1
#   }
# }
# data6 <- unique(data6)
# data7 <- c()
# j=1
# for (i in 1: 244){
#   if ('Comedy' %in% info.df[i,3][[1]]){
#     data7[j] <- info.df[i,2][[1]]
#     j <- j+1
#   }
# }
# data7 <- unique(data7)
# data8 <- c()
# j=1
# for (i in 1: 244){
#   if ('Animation' %in% info.df[i,3][[1]]){
#     data8[j] <- info.df[i,2][[1]]
#     j <- j+1
#   }
# }
# data8 <- unique(data8)
# data9 <- c()
# j=1
# for (i in 1: 244){
#   if ('Mystery' %in% info.df[i,3][[1]]){
#     data9[j] <- info.df[i,2][[1]]
#     j <- j+1
#   }
# }
# data9 <- unique(data9)
# 
# save(data1,file="data1.Rdata")
# save(data2,file="data2.Rdata")
# save(data3,file="data3.Rdata")
# save(data4,file="data4.Rdata")
# save(data5,file="data5.Rdata")
# save(data6,file="data6.Rdata")
# save(data7,file="data7.Rdata")
# save(data8,file="data8.Rdata")
# save(data9,file="data9.Rdata")
# 

# toptwenty <- fread("review_data_frame.csv")
# str(toptwenty)
# load("movie_info.Rdata")
# library(dplyr)
# newdata <- info.df&>&
  
# rec <- fread("matrix_factorization_recommendation.csv")
# co <- fread("co-occurence_matrix_similar_product.csv")
# names(co)
# names(rec)
# dim(co)
# str(co)
# (co$product_productid)
# str(co)
# str(rec)
# str(rec[1,])
# rec
# rec[10,]
# co[78471895,]
# attach(co)
# product_productid
# rec
# str(rec)
# str(co)
# co[78471907,]
# load("movie_info.Rdata")
# info.df
