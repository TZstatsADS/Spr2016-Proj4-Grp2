library(data.table)
library(dplyr)
#devtools::install_github("rlist","renkun-ken")
library(rlist)
library(ggplot2)
library(plotly)
library(igraph)
library(networkD3)
library(RColorBrewer)
library(wordcloud)
library(tm)
# colsToKeep <- c("product_productid","review_userid", "review_helpfulness", "review_score")
# data0<-fread("../output/xinhaogu_moviedata.csv",select=colsToKeep)
# head(data0)
# #Parse the helpfulness votes
# movies=data0%>%
#   separate(review_helpfulness, 
#            c("helpful.v", "total.v"), sep = "/", 
#            remove=FALSE)
# save(movies,file="../output/movies.Rdata")
# movies1=movies%>%
#   mutate(helpful.v=as.numeric(helpful.v),
#          total.v=as.numeric(total.v),
#          review_h=helpful.v/total.v)
# save(movies1,file="../output/movies1.Rdata")

### RAW DATA
load("../output/movies.Rdata")
load("../output/movies1.Rdata")

review_score<-data0%>%
  group_by(review_score)%>%
  summarise(count=n())%>%
  arrange(review_score)
  
ggplot( data=review_score[1:5],aes(x=review_score,y=count,fill=factor(review_score))) +
  geom_bar(stat="identity")+
  xlab("review score") + ylab("number of reviews") +
  ggtitle("The Distribution of Review Score")+
  scale_fill_hue(c=40, l=75)+
  theme(legend.position='none',axis.text.x = element_text(size=14,vjust=0.7)) 


ggplot(data=movies1, aes(review_h)) + 
  geom_histogram(breaks=seq(0, 1, by = 0.05),fill="blue", alpha = .2) + 
  labs(title="Histogram for helpulness") +
  labs(x="helpfulness", y="numbers of reviews")+
  xlim(c(0,1))


test<-movies1%>%
  select(product_productid,total.v,review_score,review_h)%>%
  group_by(product_productid)%>%
  summarise(n_review=n(),meanscore=mean(review_score))%>%
  arrange(desc(n_review))
 
ggplot(test, aes(x=n_review,y=meanscore))+
  geom_point(color="blue")+
  xlab("number of reviews") + ylab("Review Score") +
  ggtitle("The relationship between the number of reviews and review score")

### MOVIE 

load("D:/R_Work_Directory/project4-team-2/output/movie_info.Rdata")
# write.csv(info.df,"../output/movie_info.csv")
info<-list.parse(info.df)


info.genre<-info%>%
  list.filter(!is.null(title))%>%
  list.names(id)%>%
  list.table(genre)%>%
  list.sort()%>%
  print()
genre_name<-names(info.genre)
data_genre<-as.data.frame(info.genre)  

ggplot( data=data_genre,aes(x=factor(genre_name),y=info.genre,fill=factor(genre_name))) +
  geom_bar(stat="identity")+
  xlab("genre") + ylab("number of movies") +
  ggtitle("Number of Movies for Different Genres")+
  geom_text(aes(label=info.genre), vjust=-0.3, size=3.5)+
  scale_fill_hue(c=40, l=75)+
  theme(legend.position='none',axis.text.x = element_text(size=14,angle=45, vjust=0.7)) 

info.country<-info%>%
  list.filter(!is.null(title))%>%
  list.names(id)%>%
  list.table(country)%>%
  list.sort()%>%
  print()
country_name<-names(info.country)
data_country<-as.data.frame(info.country)  

ggplot( data=data_country,aes(x=factor(country_name),y=info.country,fill=factor(country_name))) +
  geom_bar(stat="identity")+
  xlab("Country") + ylab("number of movies") +
  ggtitle("Countries Involved in Movie-making")+
  geom_text(aes(label=info.country), vjust=-0.3, size=3.5)+
  theme(legend.position='none',axis.text.x = element_text(size=14, vjust=0.7, angle=30))+
  scale_fill_hue(c=60, l=75)

###TEXT ANAYLYSIS
data<-fread("../output/text_analysis_result_of_review.csv")
by_productid<-group_by(data,product_productid)

score<-summarise(  by_productid,
                   count = n(),
                   score = mean(review_score, na.rm = TRUE),
                   sentiment_score=mean(sentiment_score,na.rm=TRUE)
)

word_top<-select(data,review_text)[1:1000]
word_bottom<-select(data,review_text)
word_bottom<-word_bottom[(134881-999):134881]

text <- paste(word_top, collapse=" ")
text_source<-VectorSource(text)
corpus<-Corpus(text_source)%>%
  tm_map(removePunctuation)%>%
  tm_map(stripWhitespace)%>%
  tm_map(removeWords, stopwords("english"))
dtm<-DocumentTermMatrix(corpus)
dtm2<-as.matrix(dtm)
frequency<-colSums(dtm2)
frequency<-sort(frequency, decreasing=TRUE)
words<-names(frequency)
wordcloud(words[1:100], frequency[1:100],colors = brewer.pal(8, "Dark2"))

text <- paste(word_bottom, collapse=" ")
text_source<-VectorSource(text)
corpus<-Corpus(text_source)%>%
  tm_map(removePunctuation)%>%
  tm_map(stripWhitespace)%>%
  tm_map(removeWords, stopwords("english"))
dtm<-DocumentTermMatrix(corpus)
dtm2<-as.matrix(dtm)
frequency<-colSums(dtm2)
frequency<-sort(frequency, decreasing=TRUE)
words<-names(frequency)
wordcloud(words[1:100], frequency[1:100],colors = brewer.pal(8, "Dark2"))

                         

p<- ggplot(score, aes(x=sentiment_score,y=score))+
  geom_point(aes(size = count,alpha = 1/2,color = "red"))+
  geom_smooth() +
  scale_size_area()+
  theme(panel.background = element_blank())+
  xlab("Sentiment Score") + ylab("Review Score") +
  ggtitle("Sentiment Score X Review Score")
p
plot_ly(p)

ggplot(data=data, aes(sentiment_score)) + 
  geom_histogram(breaks=seq(0, 1, by = 0.05),fill="blue", alpha = .8) + 
  labs(title="Histogram for Sentiment Score") +
  labs(x="sentiment score", y="numbers of reviews")

###BIPARTITE
# Create fake data
data<-read.csv("../output/bipartite.csv")
src <- data$topic
target <- data$word
networkData <- data.frame(src, target)

# Plot
simpleNetwork(networkData,opacity = 0.8)

### WORDCLOUD
text0<-read.csv("../output/cluster0.csv")
wordcloud(text0$word,text0$score,max.words = 25,colors = brewer.pal(8, "Dark2"))

text1<-read.csv("../output/cluster_1_topics.csv")
wordcloud(text1$word,text1$score,max.words = 25,colors = brewer.pal(8, "Dark2"))

crude<-fread("../output/cluster_of_review.csv")
text_sample<-sample(crude$review_text,100)#choose 100 reviews randomly
text <- paste(text_sample, collapse=" ")
text_source<-VectorSource(text)
corpus<-Corpus(text_source)%>%
  tm_map(removePunctuation)%>%
  tm_map(stripWhitespace)%>%
  tm_map(removeWords, stopwords("english"))
dtm<-DocumentTermMatrix(corpus)
dtm2<-as.matrix(dtm)
frequency<-colSums(dtm2)
frequency<-sort(frequency, decreasing=TRUE)
words<-names(frequency)
wordcloud(words[1:100], frequency[1:100],colors = brewer.pal(8, "Dark2"))



  