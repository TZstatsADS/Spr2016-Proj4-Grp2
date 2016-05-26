setwd('E:/Rfile/4249Pro4')
library(data.table)
library(dplyr)
library(tidyr)
library(ggplot2)
library(plotly)
library(tables)

### data manipulation, add the helpfulness rate, divide clusters
clusterdata<-separate(review_df_small_real,review_helpfulness, 
                      c("helpful.v", "total.v"), sep = "/", 
                      remove=FALSE)
clusterdata$helpful.v=as.numeric(clusterdata$helpful.v)
clusterdata$total.v=as.numeric(clusterdata$total.v)
clusterdata<-mutate(clusterdata,
                    review_h=as.numeric(helpful.v)/as.numeric(total.v))

cluster_main<-subset(clusterdata, clusterdata$cluster_id==0 | clusterdata$cluster_id==1 )
cluster_0<-subset(clusterdata, clusterdata$cluster_id==0)
cluster_1<-subset(clusterdata, clusterdata$cluster_id==1)

### histogram
histdata<-data.frame(score=rep(1:5,2),id=c(0,0,0,0,0,1,1,1,1,1),freq=c(table(cluster_0$review_score)/nrow(cluster_0),table(cluster_1$review_score)/nrow(cluster_1)))

ggplot(histdata, aes(x=score, y=freq, fill=factor(id))) + 
  geom_bar(stat="identity",position="dodge") + 
  scale_fill_manual(values=c('#9999FF','#336699')) +
  labs(fill="") + 
  ylab("Frequency") + 
  xlab("Review Score") + 
  ggtitle(paste("Review Score Distribution between Cluster0 & Cluster1")) + 
  theme(axis.text.x = element_text(angle = 30, hjust = 1), 
        panel.background = element_blank()) + 
  theme_grey(base_size = 15)

### helpfulness rate between clusters




