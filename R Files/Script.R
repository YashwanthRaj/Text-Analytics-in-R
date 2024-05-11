#install.packages("tm")
library(tm)

#install.packages("readtext")
library(readtext)

#install.packages("wordcloud")
library(wordcloud)

#install.packages("quanteda")
library(quanteda)

#install.packages("syuzhet")
library(syuzhet)

#install.packages("text")
library(text)

#install.packages("textTinyR")
library(textTinyR)

library(dplyr)
library(base)
library(stringr)

setwd("/Users/yashwanth/Documents/GWU/Sem 2/Intro to Big Data/Project/Project 3/R Files/Dataset")

# Separating the chapters into individual files
filename <- "TarzanOfTheApes.txt"
book <- readLines(filename)

# Defining all the indexes of the chapters that we are going to use
# We are using chapters I to XV
indx_ch1 <- which(book == "Chapter I", arr.ind=TRUE)
indx_ch2 <- which(book == "Chapter II", arr.ind=TRUE)
indx_ch3 <- which(book == "Chapter III", arr.ind=TRUE)
indx_ch4 <- which(book == "Chapter IV", arr.ind=TRUE)
indx_ch5 <- which(book == "Chapter V", arr.ind=TRUE)
indx_ch6 <- which(book == "Chapter VI", arr.ind=TRUE)
indx_ch7 <- which(book == "Chapter VII", arr.ind=TRUE)
indx_ch8 <- which(book == "Chapter VIII", arr.ind=TRUE)
indx_ch9 <- which(book == "Chapter IX", arr.ind=TRUE)
indx_ch10 <- which(book == "Chapter X", arr.ind=TRUE)
indx_ch11 <- which(book == "Chapter XI", arr.ind=TRUE)
indx_ch12 <- which(book == "Chapter XII", arr.ind=TRUE)
indx_ch13 <- which(book == "Chapter XIII", arr.ind=TRUE)
indx_ch14 <- which(book == "Chapter XIV", arr.ind=TRUE)
indx_ch15 <- which(book == "Chapter XV", arr.ind=TRUE)
indx_ch16 <- which(book == "Chapter XVI", arr.ind=TRUE)

book_chapter1 <- book[(indx_ch1+1:indx_ch2-1)]
book_chapter2 <- book[(indx_ch2+1:indx_ch3-1)]
book_chapter3 <- book[(indx_ch3+1:indx_ch4-1)]
book_chapter4 <- book[(indx_ch4+1:indx_ch5-1)]
book_chapter5 <- book[(indx_ch5+1:indx_ch6-1)]
book_chapter6 <- book[(indx_ch6+1:indx_ch7-1)]
book_chapter7 <- book[(indx_ch7+1:indx_ch8-1)]
book_chapter8 <- book[(indx_ch8+1:indx_ch9-1)]
book_chapter9 <- book[(indx_ch9+1:indx_ch10-1)]
book_chapter10 <- book[(indx_ch10+1:indx_ch11-1)]
book_chapter11 <- book[(indx_ch11+1:indx_ch12-1)]
book_chapter12 <- book[(indx_ch12+1:indx_ch13-1)]
book_chapter13 <- book[(indx_ch13+1:indx_ch14-1)]
book_chapter14 <- book[(indx_ch14+1:indx_ch15-1)]
book_chapter15 <- book[(indx_ch15+1:indx_ch16-1)]

# Creating a directory to save all the chapters as individual files
dir.create("chapters")
write.table(book_chapter1, file = "chapters/Chapter 01.txt", sep = "\t", row.names=FALSE, col.names=FALSE,quote=FALSE)
write.table(book_chapter2, file = "chapters/Chapter 02.txt", sep = "\t", row.names=FALSE, col.names=FALSE,quote=FALSE)
write.table(book_chapter3, file = "chapters/Chapter 03.txt", sep = "\t", row.names=FALSE, col.names=FALSE,quote=FALSE)
write.table(book_chapter4, file = "chapters/Chapter 04.txt", sep = "\t", row.names=FALSE, col.names=FALSE,quote=FALSE)
write.table(book_chapter5, file = "chapters/Chapter 05.txt", sep = "\t", row.names=FALSE, col.names=FALSE,quote=FALSE)
write.table(book_chapter6, file = "chapters/Chapter 06.txt", sep = "\t", row.names=FALSE, col.names=FALSE,quote=FALSE)
write.table(book_chapter7, file = "chapters/Chapter 07.txt", sep = "\t", row.names=FALSE, col.names=FALSE,quote=FALSE)
write.table(book_chapter8, file = "chapters/Chapter 08.txt", sep = "\t", row.names=FALSE, col.names=FALSE,quote=FALSE)
write.table(book_chapter9, file = "chapters/Chapter 09.txt", sep = "\t", row.names=FALSE, col.names=FALSE,quote=FALSE)
write.table(book_chapter10, file = "chapters/Chapter 10.txt", sep = "\t", row.names=FALSE, col.names=FALSE,quote=FALSE)
write.table(book_chapter11, file = "chapters/Chapter 11.txt", sep = "\t", row.names=FALSE, col.names=FALSE,quote=FALSE)
write.table(book_chapter12, file = "chapters/Chapter 12.txt", sep = "\t", row.names=FALSE, col.names=FALSE,quote=FALSE)
write.table(book_chapter13, file = "chapters/Chapter 13.txt", sep = "\t", row.names=FALSE, col.names=FALSE,quote=FALSE)
write.table(book_chapter14, file = "chapters/Chapter 14.txt", sep = "\t", row.names=FALSE, col.names=FALSE,quote=FALSE)
write.table(book_chapter15, file = "chapters/Chapter 15.txt", sep = "\t", row.names=FALSE, col.names=FALSE,quote=FALSE)


# VCorpus
TarzanData <- VCorpus(DirSource("/Users/yashwanth/Documents/GWU/Sem 2/Intro to Big Data/Project/Project 3/R Files/Dataset", ignore.case = TRUE, mode="text"))
TarzanData

# Examining the Corpus
str(TarzanData)

# Extract text from the corpus
TarzanDataText <-TarzanData[[1]]

# Examining the text
TarzanDataText
TarzanDataText[1]

# Document Term Matrix
TarzanDataDTM <- DocumentTermMatrix(TarzanData)

# Examining DTM
TarzanDataDTM
str(TarzanDataDTM)

# Creating Data Frame
TarzanDatadf <- data.frame(TarzanDataText[1])
TarzanDatadf[1]

# 10 longest words
# Function to find the top ten longest words 
TenLongestWordsFun <- function(SampleCorpus) {
  SampleDTM <- DocumentTermMatrix(SampleCorpus)
  SampleMatrix <- as.matrix(SampleDTM)
  SampleTerms <- colnames(SampleMatrix)
  SampleSplitTerms <- unlist(strsplit(SampleTerms, " "))
  SampleTermLengths <- nchar(SampleSplitTerms)
  SampleSortedIndices <- order(SampleTermLengths, decreasing = TRUE)
  SampleSortedTerms <- SampleSplitTerms[SampleSortedIndices]
  SampleSortedTerms <- SampleSortedTerms[SampleSortedTerms != ""]
  TenLongestWordsReturn <- SampleSortedTerms[1:10]
  return(TenLongestWordsReturn)
}

# 10 longest sentences
# Function to find the top ten longest sentences 
TenLongestSentencecsFun <- function(SampleCorpus, ChapterName, LineEnd = "\n") {
  SamplePlainText <- sapply(SampleCorpus, as.character)
  SampleText <- paste(SamplePlainText, collapse = LineEnd)
  SampleLines <- strsplit(SampleText, LineEnd)[[1]]
  SampleLines <- SampleLines[!grepl(ChapterName, SampleLines, ignore.case = TRUE)]
  SampleText <- paste(SampleLines, collapse = LineEnd)
  SampleSentences <- unlist(strsplit(SampleText, "[.!?]\\s*"))
  SampleSentences <- SampleSentences[SampleSentences != ""]
  SampleSentencesLengths <- nchar(SampleSentences)
  SampleSortedIndices <- order(SampleSentencesLengths, decreasing = TRUE)
  SampleSortedSentences <- SampleSentences[SampleSortedIndices]
  TenLongestSentencesReturn <- SampleSortedSentences[1:10]
  return(TenLongestSentencesReturn)
}

# Empty dataframe
Analysisdf <- data.frame(Chapter = integer(), TopTenLongestWords = character(), TopTenLongestSentences = character(), stringsAsFactors = FALSE)
CorpusCounter <- 0

# Iterate over each chapter file
for (i in 1:15) {
  Chapters <- file.path("/Users/yashwanth/Documents/GWU/Sem 2/Intro to Big Data/Project/Project 3/R Files/Dataset/chapters", paste0("chapter ", sprintf("%02d", i), ".txt"))
  ChaptersContent <- readLines(Chapters)
  ChapterNum <- i
  ChapterCorpus <- VCorpus(VectorSource(ChaptersContent))
  CorpusCounter <- CorpusCounter + 1
  TenLongWrd <- TenLongestWordsFun(ChapterCorpus)
  TenLongSen <- TenLongestSentencecsFun(ChapterCorpus, ChapterNum)
  Analysisdf <- rbind(Analysisdf, data.frame(Chapter = i, TopTenLongestWords = paste(TenLongWrd, collapse = ", "), TopTenLongestSentences = paste(TenLongSen, collapse = " ")))
}

# Print the dataframe
print(Analysisdf)

# Corpus Cleaning
# Data Wrangling

# Function to remove numbers and punctuation
removeNumPunct <- function(x) gsub("[^[:alpha:][:space:]]*","",x)
removeNumPunct

# Removing numbers and punctuation
TarzanDatacl <- tm::tm_map(TarzanData,content_transformer(removeNumPunct))
TarzanDatacl
str(TarzanDatacl)

# Converting into lower case
TarzanDataLow <- tm_map(TarzanDatacl, tm:: content_transformer(tolower))
TarzanDataLow
str(TarzanDataLow)
inspect(TarzanDataLow)

# DTM for the corpus with no punc, num and lower case
TarzanDataDTM <- DocumentTermMatrix(TarzanDataLow)
TarzanDataDTM
str(TarzanDataDTM)

as.matrix(TarzanDataDTM)

myStopwords <- c(tm::stopwords("english"))
myStopwords

TarzanDataStop <- tm::tm_map(TarzanDataLow, tm::removeWords, myStopwords)
tm::inspect(TarzanDataStop[[1]])

# DTM for the corpus with removed stopwords
TarzanDataStopDTM <- tm::TermDocumentMatrix(TarzanDataStop)
TarzanDataStopDTM

# Terms that occur atleast 5 times
freqTerms <- tm::findFreqTerms(TarzanDataStopDTM, lowfreq = 5)
freqTerms

# Finding the length of a string in freqTerms
nchar(freqTerms[3])
freqTerms[3]

TarzanDatatf <- tm::termFreq(TarzanDataStop[[1]])
TarzanDatatf

tm::inspect(TarzanDataStopDTM)

# Dendrogram
TarzanDatadf <- as.data.frame(TarzanDataStopDTM[[1]])
TarzanDataDist <- dist(TarzanDatadf)
TarzanDataDG <- hclust(TarzanDataDist, method = "ward.D2") 
str(TarzanDataDG) 

# Plot not helpful as it is cluttered
plot(TarzanDataDG) 

# Word Cloud
words <- names(TarzanDatatf)
words

pal <- brewer.pal(9,"BuGn")
str(pal)

TarzanDatawc <- wordcloud(words, TarzanDatatf, colors = pal[-(1:4)])
str(TarzanDatawc)

# Different color palette
pal2 <- brewer.pal(9,"Spectral")
TarzanDatawc <- wordcloud(words, TarzanDatatf, colors = pal2)

TarzanDataText <- TarzanDatacl[[1]]
TarzanDataText$content[1:10]

# quanteda 
TarzanDataTokens <- quanteda::tokens(TarzanDataText$content[1:10])
str(TarzanDataTokens)

TarzanDataDFM <- quanteda::dfm(TarzanDataTokens)
str(TarzanDataDFM)

TarzanDataDocFreq <- quanteda::docfreq(TarzanDataDFM)
str(TarzanDataDocFreq)
TarzanDataDocFreq


TarzanDataWeights <-quanteda::dfm_weight(TarzanDataDFM)
str(TarzanDataWeights)
TarzanDataWeights

# Computing the tf-idf score
TarzanDataTFIDF <- quanteda::dfm_tfidf(TarzanDataDFM, scheme_tf = "count", scheme_df="inverse")
str(TarzanDataTFIDF)

# Extracting text as a dataframe
TarzanDataTextdf <- as.data.frame(TarzanDataText$content)
TarzanDataTextdf

# Reading the file as one large string
TarzanDataAsString <- get_text_as_string("/Users/yashwanth/Documents/GWU/Sem 2/Intro to Big Data/Project/Project 3/R Files/Dataset/TarzanOfTheApes.txt")
TarzanDataAsString

# Separating text as sentences
TS <- get_sentences(TarzanDataAsString)
TS

# Assessing the sentiments of sentence.
str(TS)


# Sentiment using syuzhet method
TSSentiment <- get_sentiment(TS,"syuzhet")
TSSentiment

# Sentiment using bing method
TSBing <- get_sentiment(TS,"bing")
TSBing

# Sentiment dictionary for syuzhet
TSDictionary <- get_sentiment_dictionary()
TSDictionary

# Sentiment dictionary for Bing
TSDictionaryBing <- get_sentiment_dictionary()
TSDictionaryBing

# Overall emotional Valence in text for syuzhet
TSSum <- sum(TSSentiment)
TSSum

# Overall emotional Valence in text for Bing
TSBingSum <- sum(TSBing)
TSBingSum

# Mean of the emotional valence for syuzhet
TSMean <- mean(TSSentiment)
TSMean

# Mean of the emotional valence for Bing
TSBingMean <- mean(TSBing)
TSBingMean

# Plotting syuzhet 
plot(TSSentiment, main = "Tarzan Of The Apes Plot Trajectory", xlab ="Narrative",ylab = "Emotional Valence")

# Plotting Bing 
plot(TSBing, main = "Tarzan Of The Apes Plot Trajectory", xlab ="Narrative",ylab = "Emotional Valence")

# PCT Value = 10 bins
TSSentimentPctValue <- get_percentage_values(TSSentiment,bins = 10)
structure(TSSentimentPctValue)

# PCT 10 Bins
plot(TSSentimentPctValue, main = "Tarzan of the Apes PCT 10 Bins", xlab = "Narrative", ylab = "Emotional Valence",col="blue")

# PCT Value = 20 bins
TSSentimentPctValue <- get_percentage_values(TSSentiment,bins = 20)
structure(TSSentimentPctValue)

# PCT 20 Bins
plot(TSSentimentPctValue, main = "Tarzan of the Apes PCT 20 Bins", xlab = "Narrative", ylab = "Emotional Valence",col="red")