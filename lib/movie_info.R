library(data.table)
library(dplyr)
#devtools::install_github("rlist","renkun-ken")
library(rlist)
library(ggplot2)

data0<-fread("../output/review_data_frame.csv")
data<-as.data.frame(data0)
id_list0<-distinct(select(data, product_productid))
id_list<-as.matrix(id_list0)

info_A<-sapply(1:59, get_movie_info)
info_B<-sapply(61:65, get_movie_info)
info_C<-sapply(67:100, get_movie_info)
info_0<-cbind(info_A,info_B,info_C)
info_1<-t(info_0)
info.df<-as.data.frame(info_1)
info<-list.parse(info.df)


info.genre<-info%>%
  list.filter(!is.null(title))%>%
  list.names(id)%>%
  list.table(genre)%>%
  list.sort()%>%
  print()
genre_name<-names(info.genre)
test<-as.data.frame(info.genre)  

ggplot( data=test,aes(x=factor(genre_name),y=info.genre,fill=factor(genre_name))) +
  geom_bar(stat="identity")+
  xlab("genre") + ylab("number of movies") +
  ggtitle("Number of Movies for Different Genres")+
  geom_text(aes(label=info.genre), vjust=-0.3, size=3.5)+
  scale_fill_hue(c=40, l=75,guide=guide_legend(title =("genre")))+
  theme(text = element_text(size=20),
        axis.text.x = element_text(angle=45, vjust=0.5)) 
  
  



