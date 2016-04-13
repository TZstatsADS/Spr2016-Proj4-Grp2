library(xml2)
library(rvest)
library(tidyr)

# Install omdbapi
#devtools::install_github("hrbrmstr/omdbapi")

library(omdbapi)
library(pbapply)

library(dplyr)

# Example 1, not found in OMDB
# ASIN.inq="000500005X" 
# Example 2, found in OMDB
get_movie_info<-function(i){
  ASIN.inq=id_list[i] # this movie's title has a "("
  
  movie1<-read_html(paste("http://www.amazon.com/exec/obidos/ASIN/", ASIN.inq, sep=""))
  movie1.title=
    movie1 %>% 
    html_node("title") %>%
    html_text()
  
  movie1.title=strsplit(movie1.title, ": ")[[1]][2]
  movie1.title=strsplit(movie1.title, " \\[")[[1]][1]
  movie1.title=strsplit(movie1.title, " \\(")[[1]][1]
  
  omdb.entry=search_by_title(movie1.title)
  
  if(!is.null(omdb.entry$imdbID[1])){
    movie.info<-find_by_id(omdb.entry$imdbID[1], include_tomatoes=T)

    genre<-get_genres(movie.info)
    country<-get_countries(movie.info)
    imdbRating<-movie.info$imdbRating
  
    result<-list(id=ASIN.inq,title=omdb.entry$Title[1],genre=genre, country=country,imdbRating=imdbRating)
  }else
  
  {result<-list(id=ASIN.inq,title=NULL,genre=NULL, country=NULL,imdbRating=NULL)}

 
  return(result)
}
