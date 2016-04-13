# Project 4 Collective intelligence
### Data Analysis-- Amazon Movies Reviews
####Team Member 
```
Yicheng Wang yw2716

Haoyang Chen hc2812

Xinghao Gu   xg2217

Hexiu Ye     hy2450
```
All the team members have pledged that they all put effort and work for this project. Yicheng Wang is in charge of implementing shiny app and related data analysis. Haoyang Chen is in charge of data cleaning, reading, processing and scrapying data for supporting analysis in general. Xinghao gu and Hexiu Ye are in charge of the implementing data analysis report and related data analysis.
##### Data Analysis Report
Term: Spring 2016


In this project, we explore the Amazon movie data and create a movie recommender Shiny App based on collective filtering. Firstly we read the raw data and conduct basic data analysis. Then we apply sentiment analysis and topic model to the processed data and obtain some interesting results. At last, we create a movie recommender system recommending movies to users according to their preferences.



#####Shiny App
The shiny app is a demo presentation for a product of recommendation system. The data is based on the amazon database collected by Stanford University. http://snap.stanford.edu/data/web-Movies.html.
In terms of the nature and the structure of the dataset itself, the duplication of the data is inevitable. The general problem is that different publised verison of the same movie is categorized as different products while they share the same reviews. On the other hand, we do not have any labels for help distinguishing the same products, the efficiency of data-cleaning and the accuracy of the result will be affected. 

In terms of the shiny app itself, we provide several features:

1. Recommendation based on the category you choose from 8 different types.
2. Recommendation for new users: based on three movies you choose from ten movies, we will recommend 5 movies you would like.
3. Recommendation for old users: based on the history of this user's activities in amazon, we recommend 5 movies you would like.

To be noticed, due to the heavy computaional work and the limitaion from Amzaon api, we only attach 2 recommendations for the new user categories. The other 117 possibilities will be continued once we get all the data from Amazon api in certain way. For the old user,we demonstrate 2 results as an example. The shiny app will be slowed down dramatically if we upload the whole databased, otherwise we will need to pay for upgrading the shiny sever. In this case, we think the example will be good enough to show our ideas and represent the work behind our shiny app.

Our Shiny app's address is: https://cks1001652.shinyapps.io/amazon/

The folder structure is shown below.
```
proj/
├── lib/
├── data/
├── doc/
├── figs/
├── output/
└── shiny/

```


