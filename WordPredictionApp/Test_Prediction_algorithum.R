library(DT)
## Code Testing

	load("DF_unigram.RData");
	load("DF_bigram.RData");
	load("DF_trigram.RData");
	load("DF_quadgram.RData");

	source("Clean_TextString.R");
		
	inStr4 <- "cant wait to"

	jj <- Word_prediction(inStr4)
	datatable(jj)