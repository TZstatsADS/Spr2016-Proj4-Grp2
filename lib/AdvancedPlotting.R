setwd('E:/Rfile/4249Pro4')
library(data.table)
library(dplyr)
library(tidyr)
library(ggplot2)
library(plotly)
library(tables)

selectdata<-fread('review_data_frame2.csv')
wholedata<-fread('xinhaogu_moviedata.csv')
clusterdata<-fread('cluster_of_review.csv')

selectdata<-data.table(selectdata,key="product_productid")
wholedata<-data.table(wholedata,key="product_productid")

selectdata$review_helpfulness=wholedata[wholedata$product_productid==selectdata$product_productid]$review_helpfulness

selectdata$cluster_id=clusterdata[clusterdata$review_text==selectdata$review_text]$cluster_id

############################################################
clusterdata<-separate(clusterdata,review_helpfulness, 
               c("helpful.v", "total.v"), sep = "/", 
               remove=FALSE)

clusterdata$helpful.v=as.numeric(clusterdata$helpful.v)
clusterdata$total.v=as.numeric(clusterdata$total.v)
clusterdata<-mutate(clusterdata,
             review_h=as.numeric(helpful.v)/as.numeric(total.v))

cluster_0<-subset(clusterdata, clusterdata$cluster_id==0)
cluster_1<-subset(clusterdata, clusterdata$cluster_id==1)

#############################################################
#plot the pie chart for cluster_0
plot_cluster_0 <- cluster_0 %>%
  group_by(cluster_id) %>% 
  summarize(count = n(),cluster_0$cluster_id)

plot_ly(cluster_0, labels = cluster_id, values = count, type = "pie", hole = 0.6, showlegend = F) %>% 
  layout(title = "Donut charts using Plotly")

##############################################################
### two basic pie charts "review_score Vs cluster"
plotframe<-data.frame(labels=c('1','2','3','4','5'), values=c(nrow(subset(cluster_0, cluster_0$review_score==1)),nrow(subset(cluster_0, cluster_0$review_score==2)),nrow(subset(cluster_0, cluster_0$review_score==3)),nrow(subset(cluster_0, cluster_0$review_score==4)),nrow(subset(cluster_0, cluster_0$review_score==5))))

plot_ly(plotframe, labels = labels, values = values, type = "pie") %>% 
  layout(title = "Basic Pie Chart using Plotly")

plotframe<-data.frame(labels=c('1','2','3','4','5'), values=c(nrow(subset(cluster_1, cluster_1$review_score==1)),nrow(subset(cluster_1, cluster_1$review_score==2)),nrow(subset(cluster_1, cluster_1$review_score==3)),nrow(subset(cluster_1, cluster_1$review_score==4)),nrow(subset(cluster_1, cluster_1$review_score==5))))

plot_ly(plotframe, labels = labels, values = values, type = "pie") %>% 
  layout(title = "Basic Pie Chart using Plotly")

#################################################################
### scatter plot <helpfulness rate V.S. count>
### if its ok, draw two plots marked by different clusters.
# make a subset of only 'helpfulness' and 'count' two variables.
library(plotly)
d <- diamonds[sample(nrow(diamonds), 1000), ]
# note how size is automatically scaled and added as hover text
plot_ly(d, x = count, y = helpful, size = count, mode = "markers")



#### another type of scatter plot, smoothscatter
with(data,smoothScatter(x,y,main=""))


#################################################################
### two pie chart of helpfulness V.S. cluster

## set levels for helpfulness
clusterdata$OCCP <- ifelse(clusterdata$OCCP >= 10 & clusterdata$OCCP <= 430, 1, clusterdata$OCCP)
clusterdata$OCCP <- ifelse(clusterdata$OCCP >= 1005 & clusterdata$OCCP <= 1240, 2, clusterdata$OCCP)
clusterdata$OCCP <- ifelse(clusterdata$OCCP >= 800 & clusterdata$OCCP <= 950, 3, clusterdata$OCCP)
clusterdata$OCCP <- ifelse(clusterdata$OCCP >= 2105 & clusterdata$OCCP <= 2160, 4, clusterdata$OCCP)
clusterdata$OCCP <- ifelse(clusterdata$OCCP >= 3000 & clusterdata$OCCP <= 3540, 5, clusterdata$OCCP)
clusterdata$OCCP <- ifelse(clusterdata$OCCP >= 510 & clusterdata$OCCP <= 740, 6, clusterdata$OCCP)
clusterdata$OCCP <- ifelse(clusterdata$OCCP >= 1300 & clusterdata$OCCP <= 1560, 7, clusterdata$OCCP)
clusterdata$OCCP <- ifelse(clusterdata$OCCP >= 1600 & clusterdata$OCCP <= 1965, 8, clusterdata$OCCP)

clusterdata <- filter(clusterdata, OCCP %in% c(1:8))
clusterdata$OCCP <- as.factor(clusterdata$OCCP)

levels(clusterdata$OCCP) <- c('MGR', 'CMM', 'FIN', 'LGL', 'MED' , 'BUS', 'ENG', 'SCI')

############################################################
### donut plot
df <- mtcars

# Get Manufacturer
df$manuf <- sapply(rownames(mtcars), function(x) strsplit(x, split = " ")[[1]][1])

plot.df <- df %>%
  group_by(manuf) %>% 
  summarize(count = n())

plot_ly(plot.df, labels = manuf, values = count, type = "pie", hole = 0.6, showlegend = F) %>% 
  layout(title = "Donut charts using Plotly")


##############################################################
### comprehensive bar chart marked by cluster, score freq V.S. score.

ggplot(pus_race_occp, aes(x=OCCP, y=MEAN, fill=factor(RAC1P))) + 
  geom_bar(stat="identity",position="dodge") + 
  scale_fill_brewer(palette="RdYlGn") +
  labs(fill="") + 
  ylab("Mean Salary ($)") + 
  xlab("Occupations") + 
  ggtitle(paste("Salary Comparison between Asians & Whites")) + 
  theme(axis.text.x = element_text(angle = 30, hjust = 1), 
        panel.background = element_rect(fill = 'white' )) + 
  theme_grey(base_size = 12)













