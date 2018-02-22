
library(NLP);library(tm)
library(quanteda)
library(stringi)
library(data.table)
library(dplyr)
require(R.utils)
require(tm)
require(textcat)


base_F<- getwd()
setwd("./Coursera-SwiftKey/final/en_US")

	con <- file("en_US.news.txt", open="r")
	NEWS_text <- readLines(con, n = -1L, ok = TRUE, encoding = "UTF-8", skipNul = FALSE)
	text_sel<- sample(1:length(NEWS_text), size = length(NEWS_text)/4, replace = F)
	En_US_NEWS_text <- NEWS_text[text_sel]
	close(con); rm(NEWS_text, text_sel)

	con <- file("en_US.blogs.txt", open="r")
	blogs_text <- readLines(con, n = -1L, ok = TRUE, encoding = "UTF-8", skipNul = FALSE)
	text_sel<- sample(1:length(blogs_text), size = length(blogs_text)/4, replace = F)
	En_US_blogs_text <- blogs_text[text_sel]
	close(con); rm(blogs_text, text_sel)

	con <- file("en_US.twitter.txt", open="r")
	twit_text <- readLines(con, n = -1L, ok = TRUE, skipNul = FALSE)
	text_sel<- sample(1:length(twit_text), size = length(twit_text)/4, replace = F)
	En_Twit_text <- twit_text[text_sel]
	close(con); rm(twit_text, text_sel)

rm(con)


Get_ngram<- function(dat10,i,j=3) {
    dat10_tidy<- removePunctuation(dat10)
    dat10_tidy<- stripWhitespace(dat10_tidy)
    dat10_tidy <- stri_trans_tolower(dat10_tidy)
    dat10_tidy1 <- gsub("ð|â|???|T|o|'|³|¾|ñ|f|.|º|°|»|²|¼|>|<|¹|·|¸|¦|~|ðÿ", "", dat10_tidy) 
    
    
    #Remove single letter words
    dat10_tidy1 <- removeWords(dat10_tidy1, "\\b\\w{1}\\b")
    
    Data_tokens<- tokens(dat10_tidy1,what ="word", remove_numbers = TRUE, 
                         remove_punct = TRUE, remove_separators = TRUE, remove_symbols =TRUE )
    #Data_tokens <- tokens_select(Data_tokens, stopwords(),selection ="remove")
    
    Data_gram <- tokens_ngrams(Data_tokens, n=i, concatenator = " ")  ## unigram
    Data_gram.dfm <- dfm(Data_gram, tolower =TRUE, remove_punct = TRUE)
    Data_gram.dfm<- dfm_trim(Data_gram.dfm, min_count = j, max_docfreq = 0.4)
    
    Data_gram.matrix <- sort(colSums(as.matrix(Data_gram.dfm)),decreasing=TRUE)
    DF_gram <- data.table(terms=names(Data_gram.matrix), freq=Data_gram.matrix)
    return (DF_gram)
}

	News_unigram<-Get_ngram(En_US_NEWS_text, 1,100)
	News_bigram<-Get_ngram(En_US_NEWS_text, 2,3)
	News_trigram<-Get_ngram(En_US_NEWS_text, 3,3)
	News_quadgram<-Get_ngram(En_US_NEWS_text, 4,3)
	gc()

	Blogs_unigram<-Get_ngram(En_US_blogs_text, 1,100)
	Blogs_bigram<-Get_ngram(En_US_blogs_text, 2,3)
	Blogs_trigram<-Get_ngram(En_US_blogs_text, 3,3)
	Blogs_quadgram<-Get_ngram(En_US_blogs_text, 4,3)
	gc()

	Twit_unigram<-Get_ngram(En_Twit_text, 1,100)
	Twit_bigram<-Get_ngram(En_Twit_text, 2,3)
	Twit_trigram<-Get_ngram(En_Twit_text, 3,3)
	Twit_quadgram<-Get_ngram(En_Twit_text, 4,3)
	gc()

	df_unigram<- rbind(News_unigram, Blogs_unigram,Twit_unigram)
	df_bigram<- rbind(News_bigram, Blogs_bigram,Twit_bigram)
	df_trigram<- rbind(News_trigram, Blogs_trigram,Twit_trigram)
	df_quadgram<- rbind(News_quadgram, Blogs_quadgram,Twit_quadgram)

	df_unigram<- df_unigram[order(freq),]
	df_bigram<- df_bigram[order(freq),]
	df_trigram<- df_trigram[order(freq),]
	df_quadgram<- df_quadgram[order(freq),]


	rm(News_unigram, Blogs_unigram,Twit_unigram)
	rm(News_bigram, Blogs_bigram,Twit_bigram)
	rm(News_trigram, Blogs_trigram,Twit_trigram)
	rm(News_quadgram, Blogs_quadgram,Twit_quadgram)
	rm(En_US_NEWS_text,En_US_blogs_text,En_Twit_text)

	setwd(base_F)
	save(df_unigram, file="DF_unigram.RData");
	save(df_bigram, file="DF_bigram.RData");
	save(df_trigram, file="DF_trigram.RData");
	save(df_quadgram, file="DF_quadgram.RData")


	load("DF_unigram.RData");
	load("DF_bigram.RData");
	load("DF_trigram.RData");
	load("DF_quadgram.RData")



