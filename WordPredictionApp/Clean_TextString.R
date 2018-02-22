
Clean_TextString <- function(inStr)
{
   inStr <- iconv(inStr, "latin1", "ASCII", sub=" ");
   inStr <- gsub("[^[:alpha:][:space:][:punct:]]", "", inStr);


   inStrCrps <- VCorpus(VectorSource(inStr))


   inStrCrps <- tm_map(inStrCrps, content_transformer(tolower))
   inStrCrps <- tm_map(inStrCrps, removePunctuation)
   inStrCrps <- tm_map(inStrCrps, removeNumbers)
   inStrCrps <- tm_map(inStrCrps, stripWhitespace)
   inStr <- as.character(inStrCrps[[1]])
   inStr <- gsub("(^[[:space:]]+|[[:space:]]+$)", "", inStr)


   if (nchar(inStr) > 0) {
       return(inStr); 
   } else {
       return("");
   }
}