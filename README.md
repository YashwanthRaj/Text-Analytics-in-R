# Text-Analytics-in-R
Project-3 Files of Introduction to data analytics course. We are performing Text Analytics on the given dataset. 

# Dataset
The dataset has contents of a book called Tarzan of the Apes by Edgar Rice Burroughs. It has a total of 28 Chapters but as per given guidelines, we are going to work only on the first 15 chapters. 


# Analysis
We discussed about word clouds, sentiment analysis, and preprocessing as useful methods for text analysis. Word clouds offered a far more useful representation of word frequency than only examining document term frequency tables. Just as fascinating is the study of sentiment. As we've shown, while various methods of assessing emotion may yield radically divergent results, they all still highlight significant aspects of the text. Furthermore, to understand the text, it is beneficial to take into account the linear structure of the feeling across time rather than concentrating on a single global mean or sum value. The structure was agreed upon by all methods, notwithstanding their inability to agree on the exact emotion values. 
The text must be properly preprocessed as well. The results were clearer when punctuation was removed, words were lowercased, and stemming was applied. In particular, stemming proved useful. The word cloud produced after stemming seemed to be a better representation of the text since it better conveyed the meaning of the words. Furthermore, we found that certain visualization styles can be difficult or less useful for text analysis, including the cluster dendrogram, for which we were unable to remove enough words to create a plot that was usable. This at least illustrated the intricacy of large paragraphs in a very sparse manner. 

Here we just restate the important methods we used for analyzing the text from each library. This is not comprehensive, but you can see all the methods used throughout this write-up anyways. 

tm
● VCorpus 
● tm_map
● DocumentTermMatrix 
● findFreqTerms 

quanteda
● docfreq 
● dfm_weight
● dfm_tfidf
● tokens_wordstem ● textplot_wordcloud 

syuzhet
● get_sentences
● get_sentiment
● get_sentiment_dictionary 

wordcloud
● wordcloud 
