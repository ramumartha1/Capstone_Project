## **Next Word Prediction Capstone Project**
author: Ramu Martha date: 21 Feb 2018

App: https://ramumartha1.shinyapps.io/WordPredictionApp/

Web Presentation: http://rpubs.com/ramumartha1/362986

## Overview

Modern applications are looking for artistic ways to use data science to improve user interactions

This current Assignment is one of the important features of mobile and web applications where the user will have the option to select the *Next word predicted* by Text typing apps. This will add great value as it adding intelligent with natural language processing algorithm.

Beyond improving keystroke efficiency, literature points out other benefits of **word prediction** including the improvement of the quality and quantity of written work, enhancement in the development of written literacy skills, along with spelling assistance to people with various levels of spelling disorder

NWP is based on the analysis of a corpus (large text files) resulting in probability distributions over the different sequences of words occurring in the corpus. The resulting language model is then used for predicting the most likely next word.

## *Prediction Methodology*

A Brief description of the steps are performed to generate the web App.

### Text DataBase Generation
- Step-1 : Generated text Text Corpus From the Coarsera Capstone assignment link. This test database consist of the Twitter Chats, News articles and Web blog discussion.
-   Step-2 : Using the quanteda, tm packages generated the Word tokens and n-grams. For this assignment I have considered the unigram, bigram,trigram and quadgrams. 
- Sorted the each grams with based on the frequency ( no of times it reoccurred in n-gram model)

- Using Katz back off algorithm generated the smoothing functions for the next prediction model. 

### Smooth function steps
- If Input text consist of 3 words then this word sequence appeared in the quadgram, trigram and Bigram. Then we will apply following weight factor. For Quadgram 0.5 weightage, trigram 0.3 weighatage and Bigram 0.2 weightage.

- If Input text consist of 2 words then this word sequence appeared in the trigram and Bigram. Then we will apply following weight factor. For trigram 0.65 weightage and Bigram 0.35 weightage.

- If Input text consist of 1 words then this word sequence appeared in the Bigram. Then we will apply following  Bigram 1 weightage.

- once we have calculated the Probability and weight smoothing factor we will sort the N-grams based on the highest probability.

### Shiny Web APP 

Next Word Prediction tool is developed using With Text Database, Prediction algorithm and Shiny inteface GUI/Reactive functions.  In the is user will able to provide the text, The Prediction tool will predict the Next word along with Probability. This Probability based on the existing Word database. Here Probability is measure of highly likely of Next word. 



## Future scope of Work
- Spell checks
- Enhancement of the GUI.. with Word Insert chose words.
- Enhance the existing database

## Reference 

- https://en.wikipedia.org/wiki/Exponential_backoff
- https://cs.stanford.edu/people/eroberts/courses/soco/projects/2004-05/nlp/techniques_word.html
- https://cran.r-project.org/web/packages/NLP/index.html









